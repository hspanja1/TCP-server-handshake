library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity neispravan_ip is
end entity;

architecture sim of neispravan_ip is

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
    constant SERVER_IP   : std_logic_vector(31 downto 0) := x"C0A80111"; -- 192.168.1.1
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
        send_byte(clock, in_data, in_valid, in_sop, in_eop, x"00", false, true); -- Zadnji bajt, EOP=1
        
        -- Zavrsi slanje
        send_packet_end(clock, in_valid, in_sop, in_eop);
        
        report "SYN paket poslan!";
        wait for 100 ns;
        
        wait;
    end process;
    
end architecture;
