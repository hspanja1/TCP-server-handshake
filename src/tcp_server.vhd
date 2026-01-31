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

    type state_t is (CLOSED, LISTEN, SYN_RCVD, WAIT_ACK, ESTABLISHED);
    signal state : state_t := LISTEN;

    -- "Blur" vrijednosti (Flagovi indikatori)
    signal flag_syn   : std_logic := '0';
    signal flag_ack   : std_logic := '0';
    signal flag_error : std_logic := '0';

    signal rx_cnt     : integer range 0 to 255 := 0;
    signal rx_dest_mac  : std_logic_vector(47 downto 0) := (others=>'0');
    signal rx_dest_ip   : std_logic_vector(31 downto 0) := (others=>'0');
    signal rx_dest_port : std_logic_vector(15 downto 0) := (others=>'0');
   
    signal c_mac  : std_logic_vector(47 downto 0) := (others=>'0');
    signal c_ip   : std_logic_vector(31 downto 0) := (others=>'0');
    signal c_port : std_logic_vector(15 downto 0) := (others=>'0');
   
    signal tx_active : std_logic := '0';
    signal tx_pos    : integer range 0 to 61 := 0;
    signal tx_byte   : std_logic_vector(7 downto 0) := (others=>'0');
   
    type tx_packet_type is (TX_RST, TX_SYN_ACK);
    signal tx_packet_kind : tx_packet_type := TX_RST;

    constant TCP_SYN : integer := 1;
    constant TCP_ACK : integer := 4;

    function get_tx_byte(pos: integer; pkt_type: tx_packet_type; dst_mac, src_mac, dst_ip, src_ip, dst_port, src_port: std_logic_vector) return std_logic_vector is
        variable res : std_logic_vector(7 downto 0);
    begin
        case pos is
            when 0 to 6 => res := x"AA"; -- Preamble
            when 7      => res := x"AB"; -- SFD
            when 8 to 13 => -- Dest MAC
                case pos is
                    when 8 => res := dst_mac(47 downto 40); when 9 => res := dst_mac(39 downto 32);
                    when 10 => res := dst_mac(31 downto 24); when 11 => res := dst_mac(23 downto 16);
                    when 12 => res := dst_mac(15 downto 8); when 13 => res := dst_mac(7 downto 0);
                    when others => res := x"00";
                end case;
            when 14 to 19 => -- Src MAC
                case pos is
                    when 14 => res := src_mac(47 downto 40); when 15 => res := src_mac(39 downto 32);
                    when 16 => res := src_mac(31 downto 24); when 17 => res := src_mac(23 downto 16);
                    when 18 => res := src_mac(15 downto 8); when 19 => res := src_mac(7 downto 0);
                    when others => res := x"00";
                end case;
            when 20 => res := x"08"; when 21 => res := x"00"; -- EtherType
            when 34 to 37 => -- Src IP
                case pos is
                    when 34 => res := src_ip(31 downto 24); when 35 => res := src_ip(23 downto 16);
                    when 36 => res := src_ip(15 downto 8); when 37 => res := src_ip(7 downto 0);
                    when others => res := x"00";
                end case;
            when 38 to 41 => -- Dest IP
                case pos is
                    when 38 => res := dst_ip(31 downto 24); when 39 => res := dst_ip(23 downto 16);
                    when 40 => res := dst_ip(15 downto 8); when 41 => res := dst_ip(7 downto 0);
                    when others => res := x"00";
                end case;
            when 42 to 43 => -- Src Port
                if pos = 42 then res := src_port(15 downto 8); else res := src_port(7 downto 0); end if;
            when 44 to 45 => -- Dest Port
                if pos = 44 then res := dst_port(15 downto 8); else res := dst_port(7 downto 0); end if;
            when 55 => -- Flags
                if pkt_type = TX_RST then res := x"04"; else res := x"12"; end if;
            when others => res := x"00";
        end case;
        return res;
    end function;

begin

    --------------------------------------------------
    -- Avalon-ST Kombinatorika (Standard compliant)
    --------------------------------------------------
    out_valid <= tx_active; -- Ne zavisi kombinatorno od out_ready
    out_sop   <= '1' when (tx_active = '1' and tx_pos = 0)  else '0';
    out_eop   <= '1' when (tx_active = '1' and tx_pos = 61) else '0';
    in_ready  <= '1' when (tx_active = '0') else '0';

    -- Status signali (Nulto kašnjenje)
    is_connected <= '1' when state = ESTABLISHED else '0';
    client_mac   <= c_mac;
    client_ip    <= c_ip;
    client_port  <= c_port;

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
        elsif rising_edge(clock) then
       
            case state is
           
                when LISTEN =>
                    if in_valid = '1' then
                        -- Reset flagova na početku svakog paketa
                        if in_sop = '1' then
                            rx_cnt     <= 0;
                            flag_syn   <= '0';
                            flag_error <= '0';
                        end if;

                        case rx_cnt is
                            when 8 to 12 => rx_dest_mac <= rx_dest_mac(39 downto 0) & in_data;
                            when 13 => 
                                if (rx_dest_mac(39 downto 0) & in_data) /= SERVER_MAC then flag_error <= '1'; end if;
                            when 14 to 19 => c_mac <= c_mac(39 downto 0) & in_data;
                            when 34 to 37 => c_ip <= c_ip(23 downto 0) & in_data;
                            when 38 to 40 => rx_dest_ip <= rx_dest_ip(23 downto 0) & in_data;
                            when 41 =>
                                if (rx_dest_ip(23 downto 0) & in_data) /= SERVER_IP then flag_error <= '1'; end if;
                            when 42 to 43 => c_port <= c_port(7 downto 0) & in_data;
                            when 44 => rx_dest_port(15 downto 8) <= in_data;
                            when 45 =>
                                if (rx_dest_port(15 downto 8) & in_data) /= SERVER_PORT then flag_error <= '1'; end if;
                            when 55 =>
                                if in_data(TCP_SYN) = '1' then flag_syn <= '1'; end if;
                            when others => null;
                        end case;
                        rx_cnt <= rx_cnt + 1;

                        -- Odluka tek na EOP-u na osnovu "blur" flagova
                        if in_eop = '1' then
                            if flag_error = '1' then
                                state <= CLOSED;
                                tx_packet_kind <= TX_RST;
                            elsif flag_syn = '1' then
                                state <= SYN_RCVD;
                                tx_packet_kind <= TX_SYN_ACK;
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
                        tx_byte <= get_tx_byte(tx_pos, tx_packet_kind, c_mac, SERVER_MAC, c_ip, SERVER_IP, c_port, SERVER_PORT);
                        -- Inkrement samo kada je klijent spreman (Standard)
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
                        if in_sop = '1' then 
                            rx_cnt   <= 0; 
                            flag_ack <= '0';
                        end if;
                        
                        if rx_cnt = 55 then
                            if in_data(TCP_ACK) = '1' then flag_ack <= '1'; end if;
                        end if;
                        rx_cnt <= rx_cnt + 1;

                        if in_eop = '1' then
                            if flag_ack = '1' then
                                state <= ESTABLISHED;
                            else
                                state <= CLOSED;
                                tx_packet_kind <= TX_RST;
                            end if;
                        end if;
                    end if;

                when ESTABLISHED =>
                    -- Ovdje veza ostaje stabilna
                    null;
            end case;
        end if;
    end process;

    out_data <= tx_byte;

end architecture;