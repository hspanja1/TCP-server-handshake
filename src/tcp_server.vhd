library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tcp_server is
    -- Generički parametri servera (mogu se redefinisati pri instanciranju)
    generic (
        SERVER_MAC  : std_logic_vector(47 downto 0) := x"001122334455";
        SERVER_IP   : std_logic_vector(31 downto 0) := x"C0A80101"; -- 192.168.1.1
        SERVER_PORT : std_logic_vector(15 downto 0) := x"1F90"       -- 8080
    );
    port (
        clock        : in  std_logic;
        reset        : in  std_logic;

        is_connected : out std_logic;
        client_mac   : out std_logic_vector(47 downto 0);
        client_ip    : out std_logic_vector(31 downto 0);
        client_port  : out std_logic_vector(15 downto 0);

        -- Avalon-ST RX
        in_data      : in  std_logic_vector(7 downto 0);
        in_valid     : in  std_logic;
        in_sop       : in  std_logic;
        in_eop       : in  std_logic;
        in_ready     : out std_logic;

        -- Avalon-ST TX
        out_data     : out std_logic_vector(7 downto 0);
        out_valid    : out std_logic;
        out_sop      : out std_logic;
        out_eop      : out std_logic;
        out_ready    : in  std_logic
    );
end entity;

architecture rtl of tcp_server is

    --------------------------------------------------
    -- TCP server FSM (serverska strana)
    --------------------------------------------------
    type state_t is (CLOSED, LISTEN, SYN_RCVD, ESTABLISHED);
    signal state : state_t := CLOSED;

    --------------------------------------------------
    -- RX parsing (minimalno potrebno za handshake)
    --------------------------------------------------
    signal rx_cnt   : integer range 0 to 255 := 0;
    signal rx_port  : std_logic_vector(15 downto 0) := (others=>'0');
    signal rx_flags : std_logic_vector(7 downto 0)  := (others=>'0');

    --------------------------------------------------
    -- Client info (validno nakon ESTABLISHED)
    --------------------------------------------------
    signal c_mac  : std_logic_vector(47 downto 0) := (others=>'0');
    signal c_ip   : std_logic_vector(31 downto 0) := (others=>'0');
    signal c_port : std_logic_vector(15 downto 0) := (others=>'0');

    --------------------------------------------------
    -- TX kontrola (simbolički TCP odgovor)
    --------------------------------------------------
    signal tx_active : std_logic := '0';
    signal tx_pos    : integer range 0 to 31 := 0;
    signal tx_byte   : std_logic_vector(7 downto 0) := (others=>'0');

    --------------------------------------------------
    -- TCP flag bitovi (pojednostavljeno)
    --------------------------------------------------
    constant TCP_FIN : integer := 0;
    constant TCP_SYN : integer := 1;
    constant TCP_RST : integer := 2;
    constant TCP_ACK : integer := 4;

begin

    --------------------------------------------------
    -- Avalon-ST kontrola
    --------------------------------------------------
    in_ready <= '1' when (state = LISTEN or state = SYN_RCVD) else '0';

    out_valid <= tx_active;
    out_data  <= tx_byte;
    out_sop   <= '1' when (tx_active='1' and tx_pos=0) else '0';
    out_eop   <= '1' when (tx_active='1' and tx_pos=19) else '0';

    --------------------------------------------------
    -- Status i izlazni podaci
    --------------------------------------------------
    is_connected <= '1' when state = ESTABLISHED else '0';

    client_mac  <= c_mac;
    client_ip   <= c_ip;
    client_port <= c_port;

    --------------------------------------------------
    -- Glavni proces
    --------------------------------------------------
    process(clock, reset)
    begin
        if reset='1' then
            state     <= CLOSED;
            rx_cnt    <= 0;
            tx_active <= '0';
            tx_pos    <= 0;

        elsif rising_edge(clock) then

            --------------------------------------------------
            -- RX: hvatanje paketa
            --------------------------------------------------
            if in_valid='1' then
                rx_cnt <= rx_cnt + 1;

                case rx_cnt is
                    -- Client MAC (Ethernet)
                    when 6  => c_mac(47 downto 40) <= in_data;
                    when 7  => c_mac(39 downto 32) <= in_data;
                    when 8  => c_mac(31 downto 24) <= in_data;
                    when 9  => c_mac(23 downto 16) <= in_data;
                    when 10 => c_mac(15 downto 8)  <= in_data;
                    when 11 => c_mac(7 downto 0)   <= in_data;

                    -- Client IP
                    when 26 => c_ip(31 downto 24) <= in_data;
                    when 27 => c_ip(23 downto 16) <= in_data;
                    when 28 => c_ip(15 downto 8)  <= in_data;
                    when 29 => c_ip(7 downto 0)   <= in_data;

                    -- Destination port
                    when 34 => rx_port(15 downto 8) <= in_data;
                    when 35 => rx_port(7 downto 0)  <= in_data;

                    -- TCP flags
                    when 47 => rx_flags <= in_data;

                    when others => null;
                end case;
            end if;

            --------------------------------------------------
            -- End of packet → FSM odluke
            --------------------------------------------------
            if in_eop='1' then
                rx_cnt <= 0;

                case state is

                    --------------------------------------------------
                    when CLOSED =>
                        state <= LISTEN;

                    --------------------------------------------------
                    when LISTEN =>
                        if rx_flags(TCP_SYN)='1' then
                            if rx_port = SERVER_PORT then
                                -- validan SYN
                                c_port    <= rx_port;
                                state     <= SYN_RCVD;
                                tx_active <= '1';   -- SYN-ACK
                                tx_pos    <= 0;
                            else
                                -- pogrešan port → RST
                                tx_active <= '1';
                                tx_pos    <= 0;
                                state     <= LISTEN;
                            end if;
                        end if;

                    --------------------------------------------------
                    when SYN_RCVD =>
                        if rx_flags(TCP_ACK)='1' then
                            state <= ESTABLISHED;
                        end if;

                    --------------------------------------------------
                    when ESTABLISHED =>
                        if rx_flags(TCP_SYN)='1' then
                            -- duplikovani SYN → RST
                            tx_active <= '1';
                            tx_pos    <= 0;
                        end if;

                end case;
            end if;

            --------------------------------------------------
            -- TX: slanje odgovora (simbolički TCP segment)
            --------------------------------------------------
            if tx_active='1' and out_ready='1' then
                tx_byte <= x"00";  -- payload nije bitan za handshake
                if tx_pos = 19 then
                    tx_active <= '0';
                else
                    tx_pos <= tx_pos + 1;
                end if;
            end if;

        end if;
    end process;

end architecture;
