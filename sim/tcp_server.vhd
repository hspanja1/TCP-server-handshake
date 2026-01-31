library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tcp_server is
    -- Generički parametri servera (mogu se redefinisati pri instanciranju)
    generic (
        SERVER_MAC  : std_logic_vector(47 downto 0) := x"001122334455";
        SERVER_IP   : std_logic_vector(31 downto 0) := x"C0A80101"; -- 192.168.1.1
        SERVER_PORT : std_logic_vector(15 downto 0) := x"1F90"      -- 8080
    );
    port (
        clock       : in  std_logic;
        reset       : in  std_logic;
        is_connected: out std_logic;
        client_mac  : out std_logic_vector(47 downto 0);
        client_ip   : out std_logic_vector(31 downto 0);
        client_port : out std_logic_vector(15 downto 0);
        
        -- Avalon-ST RX
        in_data     : in  std_logic_vector(7 downto 0);
        in_valid    : in  std_logic;
        in_sop      : in  std_logic;
        in_eop      : in  std_logic;
        in_ready    : out std_logic;
        
        -- Avalon-ST TX
        out_data    : out std_logic_vector(7 downto 0);
        out_valid   : out std_logic;
        out_sop     : out std_logic;
        out_eop     : out std_logic;
        out_ready   : in  std_logic
    );
end entity;

architecture rtl of tcp_server is

    --------------------------------------------------
    -- TCP server FSM (serverska strana)
    --------------------------------------------------
    type state_t is (CLOSED, LISTEN, SYN_RCVD, WAIT_ACK, ESTABLISHED);
    signal state      : state_t := LISTEN;
    signal next_state : state_t := LISTEN;
	 
    --------------------------------------------------
    -- RX parsing (pozicije u paketu)
    -- Struktura paketa (SA Preamble i SFD):
    -- 0-6:   Preamble (7 bajtova, 0xAA)
    -- 7:     SFD (1 bajt, 0xAB)
    -- 8-13:  Destination MAC (6 bajtova)
    -- 14-19: Source MAC (6 bajtova)
    -- 20-21: EtherType (2 bajta, 0x0800 za IPv4)
    -- 22-41: IP Header (20 bajtova minimum)
    -- 42-61: TCP Header (20 bajtova minimum)
    -- 62-65: FCS (4 bajta, CRC-32)
    -- Ukupno: 66 bajtova
    --------------------------------------------------
    signal rx_cnt     : integer range 0 to 255 := 0;
    
    -- Temporary storage za validaciju
    signal rx_dest_mac  : std_logic_vector(47 downto 0) := (others=>'0');
    signal rx_dest_ip   : std_logic_vector(31 downto 0) := (others=>'0');
    signal rx_dest_port : std_logic_vector(15 downto 0) := (others=>'0');
    signal rx_flags     : std_logic_vector(7 downto 0)  := (others=>'0');
    
    --------------------------------------------------
    -- Client info (validno nakon ESTABLISHED)
    --------------------------------------------------
    signal c_mac  : std_logic_vector(47 downto 0) := (others=>'0');
    signal c_ip   : std_logic_vector(31 downto 0) := (others=>'0');
    signal c_port : std_logic_vector(15 downto 0) := (others=>'0');
    
    --------------------------------------------------
    -- Pomocne varijable za pracenje stanja
    --------------------------------------------------
    signal syn_received : std_logic := '0';  -- Da li smo već primili SYN
    signal ack_received : std_logic := '0';  -- Da li smo već primili ACK
    
    --------------------------------------------------
    -- Validation flags
    --------------------------------------------------
    signal mac_valid  : std_logic := '0';
    signal ip_valid   : std_logic := '0';
    signal port_valid : std_logic := '0';
    
    --------------------------------------------------
    -- TX kontrola (simbolički TCP odgovor)
    --------------------------------------------------
    signal tx_active : std_logic := '0';
    signal tx_pos    : integer range 0 to 65 := 0;
    signal tx_byte   : std_logic_vector(7 downto 0) := (others=>'0');
    
    --------------------------------------------------
    -- TCP flag bitovi (pojednostavljeno)
    --------------------------------------------------
    constant TCP_FIN : integer := 0;
    constant TCP_SYN : integer := 1;
    constant TCP_RST : integer := 2;
    constant TCP_PSH : integer := 3;
    constant TCP_ACK : integer := 4;
    constant TCP_URG : integer := 5;
    
    --------------------------------------------------
    -- Clock counter za CLOSED stanje
    --------------------------------------------------
    signal closed_counter : integer range 0 to 1 := 0;

begin
    
	 
    --------------------------------------------------
    -- Avalon-ST kontrola
    --------------------------------------------------
    -- in_ready je 1 kada primamo podatke (in_valid aktivan)
    -- out_valid je 1 kada šaljemo podatke (tx_active aktivan)
    --in_ready <= '1' when (tx_active = '0') else '0';
    
    out_valid <= tx_active when out_ready='1';
    out_data  <= tx_byte when out_ready='1';
    out_sop   <= '1' when (tx_active='1' and tx_pos=0 ) else '0';
    out_eop   <= '1' when (tx_active='1' and tx_pos=65) else '0';
    
	 
	 in_ready <= '1' when (tx_active = '0') else '0';
    --------------------------------------------------
    -- Status i izlazni podaci
    --------------------------------------------------
    client_mac   <= c_mac;
    client_ip    <= c_ip;
    client_port  <= c_port;
    
    --------------------------------------------------
    -- Glavni proces
    --------------------------------------------------
    process(clock, reset)
    begin
        if reset='1' then
            next_state     <= LISTEN;
            rx_cnt         <= 0;
            tx_active      <= '0';
            tx_pos         <= 0;
            syn_received   <= '0';
            ack_received   <= '0';
            mac_valid      <= '0';
            ip_valid       <= '0';
            port_valid     <= '0';
            closed_counter <= 0;
            c_mac          <= (others=>'0');
            c_ip           <= (others=>'0');
            c_port         <= (others=>'0');
				is_connected   <= '0';
            
        elsif rising_edge(clock) then
        
            --------------------------------------------------
            -- FSM Logic
            --------------------------------------------------
            case state is
            
                ---------------------------------------------
                when CLOSED =>
                    -- Čekamo kraj dolaznog paketa (in_eop)
						 if in_valid = '1' then
							  -- Ako počinje paket, resetuj counter
							  if in_sop = '1' then
									rx_cnt <= 0;
							  end if;

							  rx_cnt <= rx_cnt + 1;
						 end if;

						 -- Ovdje čekamo da paket završi
						 if in_eop = '1' then
							  -- Kraj paketa, idemo u LISTEN
							  state <= LISTEN;

							  -- Reset validacija
							  rx_cnt <= 0;
							  mac_valid    <= '0';
							  ip_valid     <= '0';
							  port_valid   <= '0';
							  syn_received <= '0';
							  ack_received <= '0';
							  is_connected <= '0';
						 end if;
                
                ---------------------------------------------
                when LISTEN =>
                    -- Čekamo dolazni paket
                    -- in_valid je aktivan, out_valid je 0
                    
                    -- Na početku paketa (SOP)
                    if in_sop = '1' and in_valid = '1' then
                        rx_cnt       <= 0;
                        mac_valid    <= '0';
                        ip_valid     <= '0';
                        port_valid   <= '0';
                    end if;
                    
                    -- Primanje bajta po bajta
                    if in_valid = '1' then
                        case rx_cnt is
                            -- Preamble (bajt 0-6, 0xAA) - preskačemo, samo čitamo
                            when 0 to 6 => null;
                            
                            -- SFD (bajt 7, 0xAB) - preskačemo
                            when 7 => null;
                            
                            -- Učitavanje Destination MAC (bajt 8-13)
                            when 8  => rx_dest_mac(47 downto 40) <= in_data;
                            when 9  => rx_dest_mac(39 downto 32) <= in_data;
                            when 10 => rx_dest_mac(31 downto 24) <= in_data;
                            when 11 => rx_dest_mac(23 downto 16) <= in_data;
                            when 12 => rx_dest_mac(15 downto 8)  <= in_data;
                            when 13 => 
                                rx_dest_mac(7 downto 0) <= in_data;
                                -- Provjera MAC adrese
                                if (rx_dest_mac(47 downto 8) & in_data) /= SERVER_MAC then
                                    next_state <= CLOSED;
                                else
                                    mac_valid <= '1';
                                end if;
                            
                            -- Učitavanje Source MAC (Client MAC) (bajt 14-19)
                            when 14 => c_mac(47 downto 40) <= in_data;
                            when 15 => c_mac(39 downto 32) <= in_data;
                            when 16 => c_mac(31 downto 24) <= in_data;
                            when 17 => c_mac(23 downto 16) <= in_data;
                            when 18 => c_mac(15 downto 8)  <= in_data;
                            when 19 => c_mac(7 downto 0)   <= in_data;
                            
                            -- EtherType (bajt 20-21) - preskačemo
                            
                            -- IP Header počinje na bajtu 22
                            -- Source IP (Client IP) je na offsetu 34-37 (bajt 22+12=34)
                            when 34 => c_ip(31 downto 24) <= in_data;
                            when 35 => c_ip(23 downto 16) <= in_data;
                            when 36 => c_ip(15 downto 8)  <= in_data;
                            when 37 => c_ip(7 downto 0)   <= in_data;
                            
                            -- Destination IP Address je na offsetu 38-41 (bajt 22+16=38)
                            when 38 => rx_dest_ip(31 downto 24) <= in_data;
                            when 39 => rx_dest_ip(23 downto 16) <= in_data;
                            when 40 => rx_dest_ip(15 downto 8)  <= in_data;
                            when 41 => 
                                rx_dest_ip(7 downto 0) <= in_data;
                                -- Provjera IP adrese
                                if (rx_dest_ip(31 downto 8) & in_data) /= SERVER_IP then
                                    next_state <= CLOSED;
                                else
                                    ip_valid <= '1';
                                end if;
                            
                            -- TCP Header počinje na bajtu 42 (22 + 20)
                            -- Source Port (bajt 42-43)
                            when 42 => c_port(15 downto 8) <= in_data;
                            when 43 => c_port(7 downto 0)  <= in_data;
                            
                            -- Destination Port (bajt 44-45)
                            when 44 => rx_dest_port(15 downto 8) <= in_data;
                            when 45 => 
                                rx_dest_port(7 downto 0) <= in_data;
                                -- Provjera PORT-a
                                if (rx_dest_port(15 downto 8) & in_data) /= SERVER_PORT then
                                    next_state <= CLOSED;
                                else
                                    port_valid <= '1';
                                end if;
                            
                            -- TCP Flags su na bajtu 55 (bajt 42 + 13)
                            when 55 => 
                                rx_flags <= in_data;
                                -- Provjera SYN flaga
                                if mac_valid = '1' and ip_valid = '1' and port_valid = '1' then
                                    if in_data(TCP_SYN) = '1' and syn_received = '0' then
                                        next_state <= SYN_RCVD;
                                    elsif in_data(TCP_SYN) = '1' and syn_received = '1' then
                                        -- Duplikovani SYN
                                        next_state <= CLOSED;
                                    end if;
                                end if;
                            
                            -- FCS (CRC-32) (bajt 62-65) - preskačemo, samo čitamo
                            when 62 to 65 => null;
                            
                            when others => null;
                        end case;
                        
                        rx_cnt <= rx_cnt + 1;
                    end if;
                    
                    -- Kraj paketa
                    if in_eop = '1' then
                        rx_cnt <= 0;
                        if next_state = SYN_RCVD then
                            state        <= SYN_RCVD;
                            syn_received <= '1';
                            -- Priprema za slanje SYN-ACK
                            tx_active    <= '1';
                            tx_pos       <= 0;
                        elsif next_state = CLOSED then
                            state      <= CLOSED;
                            next_state <= LISTEN;
                        end if;
                    end if;
                
                ---------------------------------------------
                when SYN_RCVD =>
                    -- Šaljemo SYN-ACK paket
                    -- in_valid = 0, out_valid = 1
                    
                    if tx_active = '1' and out_ready = '1' then
                        -- Slanje bajta (simulacija SYN-ACK paketa)
                        -- Ovdje bi trebalo formirati pravi paket, ali za sada simbolički
                        tx_byte <= x"00";  -- Payload nije bitan
                        
                        if tx_pos = 65 then
                            -- Poslali smo cijeli paket (out_eop = '1')
                            tx_active  <= '0';
                            tx_pos     <= 0;
                            state      <= WAIT_ACK;
                            next_state <= WAIT_ACK;
                        else
                            tx_pos <= tx_pos + 1;
                        end if;
                    end if;
                
                ---------------------------------------------
                when WAIT_ACK =>
                    -- Čekamo ACK paket od klijenta
                    -- in_valid = 1, out_valid = 0
                    
                    if in_sop = '1' and in_valid = '1' then
                        rx_cnt <= 0;
                    end if;
                    
                    if in_valid = '1' then
                        -- Provjeravamo TCP flags (bajt 55)
                        if rx_cnt = 55 then
                            rx_flags <= in_data;
                            -- Provjera ACK i SYN flaga
                            if in_data(TCP_ACK) = '1'  then
                                if ack_received = '0' then
                                    next_state   <= ESTABLISHED;
                                    ack_received <= '1';
                                else
                                    -- Duplikovani ACK+SYN
                                    next_state <= CLOSED;
                                end if;
                            end if;
                        end if;
                        
                        rx_cnt <= rx_cnt + 1;
                    end if;
                    
                    if in_eop = '1' then
                        rx_cnt <= 0;
                        if next_state = ESTABLISHED then
                            state <= ESTABLISHED;
                        elsif next_state = CLOSED then
                            state      <= CLOSED;
                            next_state <= LISTEN;
                        end if;
                    end if;
                
                ---------------------------------------------
                when ESTABLISHED =>
                    -- Veza je uspostavljena
                    --is_connected <= '1';
                    -- Ovdje možemo primati i slati podatke
                    is_connected   <= '1';
                    -- Za sada samo ostajemo u ovom stanju
                    null;
                
            end case;
        end if;
    end process;
    --is_connected <= '1' when state = ESTABLISHED else '0';
end architecture;