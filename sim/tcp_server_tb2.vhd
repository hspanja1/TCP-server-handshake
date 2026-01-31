library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tcp_server_tb2 is
end entity;

architecture sim of tcp_server_tb2 is

    --------------------------------------------------
    -- Helper funkcija za konverziju u hex string
    --------------------------------------------------
    function to_hex_string(slv : std_logic_vector) return string is
        variable result : string(1 to slv'length/4);
        variable nibble : std_logic_vector(3 downto 0);
        variable index : integer := 1;
    begin
        for i in 0 to (slv'length/4)-1 loop
            nibble := slv(slv'high - i*4 downto slv'high - i*4 - 3);
            case nibble is
                when "0000" => result(index) := '0';
                when "0001" => result(index) := '1';
                when "0010" => result(index) := '2';
                when "0011" => result(index) := '3';
                when "0100" => result(index) := '4';
                when "0101" => result(index) := '5';
                when "0110" => result(index) := '6';
                when "0111" => result(index) := '7';
                when "1000" => result(index) := '8';
                when "1001" => result(index) := '9';
                when "1010" => result(index) := 'A';
                when "1011" => result(index) := 'B';
                when "1100" => result(index) := 'C';
                when "1101" => result(index) := 'D';
                when "1110" => result(index) := 'E';
                when "1111" => result(index) := 'F';
                when others => result(index) := 'X';
            end case;
            index := index + 1;
        end loop;
        return result;
    end function;

    --------------------------------------------------
    -- Konstante za testiranje
    --------------------------------------------------
    constant CLK_PERIOD : time := 10 ns;
    
    -- Server parametri
    constant SERVER_MAC  : std_logic_vector(47 downto 0) := x"001122334455";
    constant SERVER_IP   : std_logic_vector(31 downto 0) := x"C0A80101"; -- 192.168.1.1
    constant SERVER_PORT : std_logic_vector(15 downto 0) := x"1F90";     -- 8080
    
    -- Client parametri
    constant CLIENT_MAC  : std_logic_vector(47 downto 0) := x"AABBCCDDEEFF";
    constant CLIENT_IP   : std_logic_vector(31 downto 0) := x"C0A80102"; -- 192.168.1.2
    constant CLIENT_PORT : std_logic_vector(15 downto 0) := x"C350";     -- 50000
    
    --------------------------------------------------
    -- Signali za DUT
    --------------------------------------------------
    signal clock        : std_logic := '0';
    signal reset        : std_logic := '1';
    signal is_connected : std_logic;
    signal client_mac_out  : std_logic_vector(47 downto 0);
    signal client_ip_out   : std_logic_vector(31 downto 0);
    signal client_port_out : std_logic_vector(15 downto 0);
    
    -- Avalon-ST RX
    signal in_data      : std_logic_vector(7 downto 0) := (others => '0');
    signal in_valid     : std_logic := '0';
    signal in_sop       : std_logic := '0';
    signal in_eop       : std_logic := '0';
    signal in_ready     : std_logic;
    
    -- Avalon-ST TX
    signal out_data     : std_logic_vector(7 downto 0);
    signal out_valid    : std_logic;
    signal out_sop      : std_logic;
    signal out_eop      : std_logic;
    signal out_ready    : std_logic := '1';
    
    --------------------------------------------------
    -- Pomocni signali za testiranje
    --------------------------------------------------
    signal test_running : boolean := true;
    
    --------------------------------------------------
    -- TCP Flag konstante
    --------------------------------------------------
    constant TCP_FIN : integer := 0;
    constant TCP_SYN : integer := 1;
    constant TCP_RST : integer := 2;
    constant TCP_PSH : integer := 3;
    constant TCP_ACK : integer := 4;
    
    --------------------------------------------------
    -- Procedure za slanje paketa
    --------------------------------------------------
    procedure send_byte(
        signal clk       : in  std_logic;
        signal data      : out std_logic_vector(7 downto 0);
        signal valid     : out std_logic;
        signal sop       : out std_logic;
        signal eop       : out std_logic;
        constant byte_val: in  std_logic_vector(7 downto 0);
        constant is_first: in  boolean;
        constant is_last : in  boolean
    ) is
    begin
        wait until rising_edge(clk);
        data  <= byte_val;
        valid <= '1';
        if is_first then
            sop <= '1';
        else
            sop <= '0';
        end if;
        if is_last then
            eop <= '1';
        else
            eop <= '0';
        end if;
    end procedure;
    
    procedure send_packet_end(
        signal clk   : in  std_logic;
        signal valid : out std_logic;
        signal sop   : out std_logic;
        signal eop   : out std_logic
    ) is
    begin
        wait until rising_edge(clk);
        valid <= '0';
        sop   <= '0';
        eop   <= '0';
    end procedure;

begin

    --------------------------------------------------
    -- Clock generator
    --------------------------------------------------
    clock_gen: process
    begin
        while test_running loop
            clock <= '0';
            wait for CLK_PERIOD/2;
            clock <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process;
    
    --------------------------------------------------
    -- DUT instanca
    --------------------------------------------------
    dut: entity work.tcp_server
        generic map (
            SERVER_MAC  => SERVER_MAC,
            SERVER_IP   => SERVER_IP,
            SERVER_PORT => SERVER_PORT
        )
        port map (
            clock        => clock,
            reset        => reset,
            is_connected => is_connected,
            client_mac   => client_mac_out,
            client_ip    => client_ip_out,
            client_port  => client_port_out,
            in_data      => in_data,
            in_valid     => in_valid,
            in_sop       => in_sop,
            in_eop       => in_eop,
            in_ready     => in_ready,
            out_data     => out_data,
            out_valid    => out_valid,
            out_sop      => out_sop,
            out_eop      => out_eop,
            out_ready    => out_ready
        );
    
    --------------------------------------------------
    -- Stimulus process
    --------------------------------------------------
    stimulus: process
        variable tcp_flags : std_logic_vector(7 downto 0);
        variable byte_cnt  : integer;
    begin
        -- Reset
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 50 ns;
        
        report "===== TEST START =====";
        report "Slanje SYN paketa od klijenta ka serveru...";
        
        --------------------------------------------------
        -- 1. SLANJE SYN PAKETA (Client -> Server)
        --------------------------------------------------
        tcp_flags := (others => '0');
        tcp_flags(TCP_SYN) := '1';  -- Postavi SYN flag
        
        -- Preamble (7 bajtova, 0xAA)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"AA", true, false);
        for i in 1 to 6 loop
            send_byte(clock, in_data, in_valid, in_sop, in_eop, x"AA", false, false);
        end loop;
        
        -- SFD (1 bajt, 0xAB)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"AB", false, false);
        
        -- Destination MAC (Server MAC - 6 bajtova)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(47 downto 40), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(39 downto 32), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(31 downto 24), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(23 downto 16), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(15 downto 8),  false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(7 downto 0),   false, false);
        
        -- Source MAC (Client MAC - 6 bajtova)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(47 downto 40), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(39 downto 32), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(31 downto 24), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(23 downto 16), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(15 downto 8),  false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(7 downto 0),   false, false);
        
        -- EtherType (2 bajta, 0x0800 za IPv4)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"08", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        
        -- IP Header (20 bajtova)
        -- Version + IHL (1 bajt)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"45", false, false);
        -- ToS (1 bajt)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        -- Total Length (2 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"28", false, false);
        -- Identification (2 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"01", false, false);
        -- Flags + Fragment Offset (2 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        -- TTL (1 bajt)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"40", false, false);
        -- Protocol (1 bajt, 0x06 za TCP)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"06", false, false);
        -- Header Checksum (2 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        -- Source IP (Client IP - 4 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_IP(31 downto 24), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_IP(23 downto 16), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_IP(15 downto 8),  false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_IP(7 downto 0),   false, false);
        -- Destination IP (Server IP - 4 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_IP(31 downto 24), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_IP(23 downto 16), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_IP(15 downto 8),  false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_IP(7 downto 0),   false, false);
        
        -- TCP Header (20 bajtova)
        -- Source Port (Client Port - 2 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_PORT(15 downto 8), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_PORT(7 downto 0),  false, false);
        -- Destination Port (Server Port - 2 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_PORT(15 downto 8), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_PORT(7 downto 0),  false, false);
        -- Sequence Number (4 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"01", false, false);
        -- Acknowledgment Number (4 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        -- Data Offset + Reserved (1 bajt)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"50", false, false);
        -- TCP Flags (1 bajt) - SYN FLAG
        send_byte(clock, in_data, in_valid, in_sop, in_eop, tcp_flags, false, false);
        -- Window Size (2 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"FF", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"FF", false, false);
        -- Checksum (2 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        -- Urgent Pointer (2 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        
        -- FCS (CRC-32, 4 bajta)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"AA", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"BB", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"CC", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"DD", false, true);  -- Zadnji bajt, EOP=1
        
        -- Zavrsi slanje
        send_packet_end(clock, in_valid, in_sop, in_eop);
        
        report "SYN paket poslan!";
        wait for 100 ns;
        
        --------------------------------------------------
        -- 2. PRIMANJE SYN-ACK PAKETA (Server -> Client)
        --------------------------------------------------
        report "Cekanje na SYN-ACK odgovor od servera...";
        
        -- Čekaj da server pocne slati (out_valid = 1)
        --wait until out_valid = '1';
        report "Server poceo slati SYN-ACK paket!";
        
        -- Čitaj sve bajtove dok ne dobiješ EOP
        byte_cnt := 0;
        while out_eop = '0' loop
            wait until rising_edge(clock);
            if out_valid = '1' then
                byte_cnt := byte_cnt + 1;
                
                -- Provjeri SOP na prvom bajtu
                if byte_cnt = 1 then
                    assert out_sop = '1'
                        report "ERROR: SOP nije postavljen na prvom bajtu!"
                        severity error;
                    report "SOP detektovan na pocetku paketa.";
                end if;
                
                report "Primljen bajt " & integer'image(byte_cnt) & 
                       ": 0x" & to_hex_string(out_data);
            end if;
        end loop;
        
        -- Primljen zadnji bajt sa EOP
        wait until rising_edge(clock);
        report "Primljen zadnji bajt sa EOP! Ukupno bajtova: " & integer'image(byte_cnt + 1);
        
        -- Provjeri da li je out_valid = 0 nakon EOP
        wait until rising_edge(clock);
        assert out_valid = '0'
            report "ERROR: out_valid nije '0' nakon EOP!"
            severity error;
        report "out_valid je '0' nakon slanja paketa. SYN-ACK primljen!";
        
        wait for 200 ns;
        
        --------------------------------------------------
        -- 3. SLANJE ACK PAKETA (Client -> Server)
        --------------------------------------------------
        report "Slanje ACK paketa od klijenta ka serveru...";
        
		  in_valid<='1';
		  
        tcp_flags := (others => '0');
        tcp_flags(TCP_ACK) := '1';  -- Postavi ACK flag
        tcp_flags(TCP_SYN) := '0';  -- Postavi i SYN flag (ACK+SYN)
        
        -- Preamble (7 bajtova)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"AA", true, false);
        for i in 1 to 6 loop
            send_byte(clock, in_data, in_valid, in_sop, in_eop, x"AA", false, false);
        end loop;
        
        -- SFD
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"AB", false, false);
        
        -- Destination MAC (Server MAC)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(47 downto 40), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(39 downto 32), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(31 downto 24), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(23 downto 16), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(15 downto 8),  false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_MAC(7 downto 0),   false, false);
        
        -- Source MAC (Client MAC)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(47 downto 40), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(39 downto 32), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(31 downto 24), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(23 downto 16), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(15 downto 8),  false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_MAC(7 downto 0),   false, false);
        
        -- EtherType
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"08", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        
        -- IP Header (20 bajtova - isti kao kod SYN)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"45", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"28", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"02", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"40", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"06", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        -- Source IP (Client)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_IP(31 downto 24), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_IP(23 downto 16), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_IP(15 downto 8),  false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_IP(7 downto 0),   false, false);
        -- Destination IP (Server)
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_IP(31 downto 24), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_IP(23 downto 16), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_IP(15 downto 8),  false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_IP(7 downto 0),   false, false);
        
        -- TCP Header (20 bajtova)
        -- Source Port
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_PORT(15 downto 8), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, CLIENT_PORT(7 downto 0),  false, false);
        -- Destination Port
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_PORT(15 downto 8), false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, SERVER_PORT(7 downto 0),  false, false);
        -- Sequence Number
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"02", false, false);
        -- Acknowledgment Number
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"02", false, false);
        -- Data Offset + Reserved
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"50", false, false);
        -- TCP Flags - ACK+SYN FLAG
        send_byte(clock, in_data, in_valid, in_sop, in_eop, tcp_flags, false, false);
        -- Window Size
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"FF", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"FF", false, false);
        -- Checksum
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        -- Urgent Pointer
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, false);
        
        -- FCS
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"11", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"22", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"33", false, false);
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"44", false, true);
        
        -- Zavrsi slanje
        send_packet_end(clock, in_valid, in_sop, in_eop);
        
        report "ACK paket poslan!";
        wait for 200 ns;
        
        --------------------------------------------------
        -- 4. PROVJERA STANJA
        --------------------------------------------------
        report "===== PROVJERA FINALNOG STANJA =====";
        
        assert is_connected = '1'
            report "ERROR: Veza nije uspostavljena (is_connected /= '1')!"
            severity error;
        report "SUCCESS: Veza je uspostavljena (is_connected = '1')!";
        
        assert client_mac_out = CLIENT_MAC
            report "ERROR: Client MAC nije ispravan!"
            severity error;
        report "Client MAC: 0x" & to_hex_string(client_mac_out);
        
        assert client_ip_out = CLIENT_IP
            report "ERROR: Client IP nije ispravan!"
            severity error;
        report "Client IP: 0x" & to_hex_string(client_ip_out);
        
        assert client_port_out = CLIENT_PORT
            report "ERROR: Client PORT nije ispravan!"
            severity error;
        report "Client PORT: 0x" & to_hex_string(client_port_out);
        
        wait for 500 ns;
        
        report "===== TEST ZAVRŠEN USPJEŠNO! =====";
        test_running <= false;
        wait;
    end process;
    
end architecture;
