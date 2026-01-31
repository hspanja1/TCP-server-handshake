library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tcp_server is
    generic (
        SERVER_MAC  : std_logic_vector(47 downto 0) := x"001122334455";
        SERVER_IP   : std_logic_vector(31 downto 0) := x"C0A80101";
        SERVER_PORT : std_logic_vector(15 downto 0) := x"1F90"
    );
    port (
        clock       : in  std_logic;
        reset       : in  std_logic;
        is_connected: out std_logic;
        client_mac  : out std_logic_vector(47 downto 0);
        client_ip   : out std_logic_vector(31 downto 0);
        client_port : out std_logic_vector(15 downto 0);
        in_data     : in  std_logic_vector(7 downto 0);
        in_valid    : in  std_logic;
        in_sop      : in  std_logic;
        in_eop      : in  std_logic;
        in_ready    : out std_logic;
        out_data    : out std_logic_vector(7 downto 0);
        out_valid   : out std_logic;
        out_sop     : out std_logic;
        out_eop     : out std_logic;
        out_ready   : in  std_logic
    );
end entity;

architecture rtl of tcp_server is

    type state_t is (LISTEN, SYN_RCVD, WAIT_ACK, ESTABLISHED, CLOSED);
    signal state : state_t := LISTEN;

    -- "Blur" flagovi (Indikatori detekcije)
    signal flag_syn   : std_logic := '0';
    signal flag_ack   : std_logic := '0';
    signal flag_error : std_logic := '0';

    signal rx_cnt     : integer range 0 to 255 := 0;
    signal tx_pos     : integer range 0 to 61 := 0;
    signal tx_active  : std_logic := '0';
    signal tx_byte    : std_logic_vector(7 downto 0) := (others => '0');
    
    -- Privremeni registri za validaciju
    signal rx_dest_mac  : std_logic_vector(47 downto 0) := (others=>'0');
    signal rx_dest_ip   : std_logic_vector(31 downto 0) := (others=>'0');
    signal rx_dest_port : std_logic_vector(15 downto 0) := (others=>'0');
    
    -- Registri za klijentske podatke
    signal reg_c_mac    : std_logic_vector(47 downto 0) := (others=>'0');
    signal reg_c_ip     : std_logic_vector(31 downto 0) := (others=>'0');
    signal reg_c_port   : std_logic_vector(15 downto 0) := (others=>'0');

    type tx_packet_t is (TX_RST, TX_SYN_ACK);
    signal tx_packet_kind : tx_packet_t := TX_RST;

    constant TCP_SYN : integer := 1;
    constant TCP_ACK : integer := 4;

    -- ISPRAVLJENO: Funkcija koristi statičke opsege za sintezu
    function get_tx_byte(pos: integer; pkt: tx_packet_t; dm, sm, di, si, dp, sp: std_logic_vector) return std_logic_vector is
        variable res : std_logic_vector(7 downto 0);
    begin
        case pos is
            when 0 to 6  => res := x"AA"; -- Preamble
            when 7       => res := x"AB"; -- SFD
            -- Destination MAC (Client MAC)
            when 8  => res := dm(47 downto 40); when 9  => res := dm(39 downto 32);
            when 10 => res := dm(31 downto 24); when 11 => res := dm(23 downto 16);
            when 12 => res := dm(15 downto  8); when 13 => res := dm( 7 downto  0);
            -- Source MAC (Server MAC)
            when 14 => res := sm(47 downto 40); when 15 => res := sm(39 downto 32);
            when 16 => res := sm(31 downto 24); when 17 => res := sm(23 downto 16);
            when 18 => res := sm(15 downto  8); when 19 => res := sm( 7 downto  0);
            -- EtherType
            when 20 => res := x"08"; when 21 => res := x"00";
            -- IP Header 
            when 22 to 33 => res := x"00"; -- Ostala polja IP headera (pojednostavljeno)
            -- Source IP (Server IP)
            when 34 => res := si(31 downto 24); when 35 => res := si(23 downto 16);
            when 36 => res := si(15 downto  8); when 37 => res := si( 7 downto  0);
            -- Destination IP (Client IP)
            when 38 => res := di(31 downto 24); when 39 => res := di(23 downto 16);
            when 40 => res := di(15 downto  8); when 41 => res := di( 7 downto  0);
            -- Source Port (Server Port)
            when 42 => res := sp(15 downto  8); when 43 => res := sp( 7 downto  0);
            -- Destination Port (Client Port)
            when 44 => res := dp(15 downto  8); when 45 => res := dp( 7 downto  0);
            -- TCP Flags polje
            when 55 => 
                if pkt = TX_RST then res := x"14"; -- RST + ACK (Scenario 2)
                else res := x"12";                 -- SYN + ACK (Scenario 1)
                end if;
            when others => res := x"00";
        end case;
        return res;
    end function;

begin

    --------------------------------------------------
    -- AVALON-ST I STATUS LOGIKA (Konkurentno)
    --------------------------------------------------
    out_valid    <= tx_active; 
    out_sop      <= '1' when (tx_active = '1' and tx_pos = 0)  else '0';
    out_eop      <= '1' when (tx_active = '1' and tx_pos = 61) else '0';
    out_data     <= tx_byte;
    in_ready     <= '1' when (tx_active = '0') else '0';

    -- Status signali (Nulto kašnjenje izvan procesa)
    is_connected <= '1' when state = ESTABLISHED else '0';
    client_mac   <= reg_c_mac;
    client_ip    <= reg_c_ip;
    client_port  <= reg_c_port;

    --------------------------------------------------
    -- GLAVNI PROCES (FSM)
    --------------------------------------------------
    process(clock, reset)
    begin
        if reset = '1' then
            state      <= LISTEN;
            tx_active  <= '0';
            tx_pos     <= 0;
            rx_cnt     <= 0;
            flag_syn   <= '0';
            flag_ack   <= '0';
            flag_error <= '0';
            reg_c_mac <= (others=>'0'); reg_c_ip <= (others=>'0'); reg_c_port <= (others=>'0');
        elsif rising_edge(clock) then
       
            case state is
           
                when LISTEN =>
                    if in_valid = '1' then
                        if in_sop = '1' then
                            rx_cnt <= 0; flag_syn <= '0'; flag_error <= '0';
                        end if;

                        case rx_cnt is
                            when 8 to 13 => rx_dest_mac <= rx_dest_mac(39 downto 0) & in_data;
                                if rx_cnt = 13 and (rx_dest_mac(39 downto 0) & in_data) /= SERVER_MAC then
                                    flag_error <= '1';
                                end if;
                            when 14 to 19 => reg_c_mac <= reg_c_mac(39 downto 0) & in_data;
                            when 34 to 37 => reg_c_ip  <= reg_c_ip(23 downto 0) & in_data;
                            when 38 to 41 => rx_dest_ip <= rx_dest_ip(23 downto 0) & in_data;
                                if rx_cnt = 41 and (rx_dest_ip(23 downto 0) & in_data) /= SERVER_IP then
                                    flag_error <= '1';
                                end if;
                            when 42 to 43 => reg_c_port <= reg_c_port(7 downto 0) & in_data;
                            when 44 to 45 => rx_dest_port <= rx_dest_port(7 downto 0) & in_data;
                                if rx_cnt = 45 and (rx_dest_port(7 downto 0) & in_data) /= SERVER_PORT then
                                    flag_error <= '1'; -- Scenario 2 (Pogrešan port)
                                end if;
                            when 55 => if in_data(TCP_SYN) = '1' then flag_syn <= '1'; end if;
                            when others => null;
                        end case;
                        rx_cnt <= rx_cnt + 1;

                        if in_eop = '1' then
                            if flag_error = '1' then
                                state <= CLOSED; tx_packet_kind <= TX_RST;
                            elsif flag_syn = '1' then
                                state <= SYN_RCVD; tx_packet_kind <= TX_SYN_ACK;
                            else
                                state <= LISTEN;
                            end if;
                        end if;
                    end if;

                when SYN_RCVD | CLOSED =>
                    if tx_active = '0' then
                        tx_active <= '1';
                        tx_pos    <= 0;
                    else
                        tx_byte <= get_tx_byte(tx_pos, tx_packet_kind, reg_c_mac, SERVER_MAC, reg_c_ip, SERVER_IP, reg_c_port, SERVER_PORT);
                        if out_ready = '1' then 
                            if tx_pos = 61 then
                                tx_active <= '0';
                                if state = SYN_RCVD then state <= WAIT_ACK; else state <= LISTEN; end if;
                            else
                                tx_pos <= tx_pos + 1;
                            end if;
                        end if;
                    end if;

                when WAIT_ACK =>
                    if in_valid = '1' then
                        if in_sop = '1' then rx_cnt <= 0; flag_ack <= '0'; end if;
                        if rx_cnt = 55 and in_data(TCP_ACK) = '1' then flag_ack <= '1'; end if;
                        rx_cnt <= rx_cnt + 1;

                        if in_eop = '1' then
                            if flag_ack = '1' then state <= ESTABLISHED;
                            else state <= CLOSED; tx_packet_kind <= TX_RST;
                            end if;
                        end if;
                    end if;

                when ESTABLISHED =>
                    -- Scenario 3: Detekcija duplog SYN-a
                    if in_valid = '1' then
                        if in_sop = '1' then rx_cnt <= 0; flag_syn <= '0'; end if;
                        if rx_cnt = 55 and in_data(TCP_SYN) = '1' then flag_syn <= '1'; end if;
                        rx_cnt <= rx_cnt + 1;
                        if in_eop = '1' and flag_syn = '1' then
                            state <= CLOSED; tx_packet_kind <= TX_RST;
                        end if;
                    end if;

                when others => state <= LISTEN;
            end case;
        end if;
    end process;

end architecture;