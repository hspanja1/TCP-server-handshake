-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "01/31/2026 09:48:17"

-- 
-- Device: Altera EP4CE6F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	tcp_server IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	is_connected : OUT std_logic;
	client_mac : OUT std_logic_vector(47 DOWNTO 0);
	client_ip : OUT std_logic_vector(31 DOWNTO 0);
	client_port : OUT std_logic_vector(15 DOWNTO 0);
	in_data : IN std_logic_vector(7 DOWNTO 0);
	in_valid : IN std_logic;
	in_sop : IN std_logic;
	in_eop : IN std_logic;
	in_ready : OUT std_logic;
	out_data : OUT std_logic_vector(7 DOWNTO 0);
	out_valid : OUT std_logic;
	out_sop : OUT std_logic;
	out_eop : OUT std_logic;
	out_ready : IN std_logic
	);
END tcp_server;

-- Design Ports Information
-- is_connected	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[0]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[1]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[2]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[3]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[4]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[5]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[6]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[7]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[8]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[9]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[10]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[11]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[12]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[13]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[14]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[15]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[16]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[17]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[18]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[19]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[20]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[21]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[22]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[23]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[24]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[25]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[26]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[27]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[28]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[29]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[30]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[31]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[32]	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[33]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[34]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[35]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[36]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[37]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[38]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[39]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[40]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[41]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[42]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[43]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[44]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[45]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[46]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_mac[47]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[0]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[1]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[2]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[3]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[4]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[5]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[6]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[7]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[8]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[9]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[10]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[11]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[12]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[13]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[14]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[15]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[16]	=>  Location: PIN_K6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[17]	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[18]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[19]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[20]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[21]	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[22]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[23]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[24]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[25]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[26]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[27]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[28]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[29]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[30]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_ip[31]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[0]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[1]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[2]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[3]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[4]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[5]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[6]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[7]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[8]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[9]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[10]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[11]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[12]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[13]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[14]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- client_port[15]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_ready	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_data[0]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_data[1]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_data[2]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_data[3]	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_data[4]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_data[5]	=>  Location: PIN_L10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_data[6]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_data[7]	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_valid	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_sop	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_eop	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_data[0]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_valid	=>  Location: PIN_T6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_data[1]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_data[2]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_data[3]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_data[4]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_data[5]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_data[6]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_data[7]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_eop	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_ready	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_sop	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF tcp_server IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_is_connected : std_logic;
SIGNAL ww_client_mac : std_logic_vector(47 DOWNTO 0);
SIGNAL ww_client_ip : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_client_port : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_in_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_in_valid : std_logic;
SIGNAL ww_in_sop : std_logic;
SIGNAL ww_in_eop : std_logic;
SIGNAL ww_in_ready : std_logic;
SIGNAL ww_out_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_out_valid : std_logic;
SIGNAL ww_out_sop : std_logic;
SIGNAL ww_out_eop : std_logic;
SIGNAL ww_out_ready : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \is_connected~output_o\ : std_logic;
SIGNAL \client_mac[0]~output_o\ : std_logic;
SIGNAL \client_mac[1]~output_o\ : std_logic;
SIGNAL \client_mac[2]~output_o\ : std_logic;
SIGNAL \client_mac[3]~output_o\ : std_logic;
SIGNAL \client_mac[4]~output_o\ : std_logic;
SIGNAL \client_mac[5]~output_o\ : std_logic;
SIGNAL \client_mac[6]~output_o\ : std_logic;
SIGNAL \client_mac[7]~output_o\ : std_logic;
SIGNAL \client_mac[8]~output_o\ : std_logic;
SIGNAL \client_mac[9]~output_o\ : std_logic;
SIGNAL \client_mac[10]~output_o\ : std_logic;
SIGNAL \client_mac[11]~output_o\ : std_logic;
SIGNAL \client_mac[12]~output_o\ : std_logic;
SIGNAL \client_mac[13]~output_o\ : std_logic;
SIGNAL \client_mac[14]~output_o\ : std_logic;
SIGNAL \client_mac[15]~output_o\ : std_logic;
SIGNAL \client_mac[16]~output_o\ : std_logic;
SIGNAL \client_mac[17]~output_o\ : std_logic;
SIGNAL \client_mac[18]~output_o\ : std_logic;
SIGNAL \client_mac[19]~output_o\ : std_logic;
SIGNAL \client_mac[20]~output_o\ : std_logic;
SIGNAL \client_mac[21]~output_o\ : std_logic;
SIGNAL \client_mac[22]~output_o\ : std_logic;
SIGNAL \client_mac[23]~output_o\ : std_logic;
SIGNAL \client_mac[24]~output_o\ : std_logic;
SIGNAL \client_mac[25]~output_o\ : std_logic;
SIGNAL \client_mac[26]~output_o\ : std_logic;
SIGNAL \client_mac[27]~output_o\ : std_logic;
SIGNAL \client_mac[28]~output_o\ : std_logic;
SIGNAL \client_mac[29]~output_o\ : std_logic;
SIGNAL \client_mac[30]~output_o\ : std_logic;
SIGNAL \client_mac[31]~output_o\ : std_logic;
SIGNAL \client_mac[32]~output_o\ : std_logic;
SIGNAL \client_mac[33]~output_o\ : std_logic;
SIGNAL \client_mac[34]~output_o\ : std_logic;
SIGNAL \client_mac[35]~output_o\ : std_logic;
SIGNAL \client_mac[36]~output_o\ : std_logic;
SIGNAL \client_mac[37]~output_o\ : std_logic;
SIGNAL \client_mac[38]~output_o\ : std_logic;
SIGNAL \client_mac[39]~output_o\ : std_logic;
SIGNAL \client_mac[40]~output_o\ : std_logic;
SIGNAL \client_mac[41]~output_o\ : std_logic;
SIGNAL \client_mac[42]~output_o\ : std_logic;
SIGNAL \client_mac[43]~output_o\ : std_logic;
SIGNAL \client_mac[44]~output_o\ : std_logic;
SIGNAL \client_mac[45]~output_o\ : std_logic;
SIGNAL \client_mac[46]~output_o\ : std_logic;
SIGNAL \client_mac[47]~output_o\ : std_logic;
SIGNAL \client_ip[0]~output_o\ : std_logic;
SIGNAL \client_ip[1]~output_o\ : std_logic;
SIGNAL \client_ip[2]~output_o\ : std_logic;
SIGNAL \client_ip[3]~output_o\ : std_logic;
SIGNAL \client_ip[4]~output_o\ : std_logic;
SIGNAL \client_ip[5]~output_o\ : std_logic;
SIGNAL \client_ip[6]~output_o\ : std_logic;
SIGNAL \client_ip[7]~output_o\ : std_logic;
SIGNAL \client_ip[8]~output_o\ : std_logic;
SIGNAL \client_ip[9]~output_o\ : std_logic;
SIGNAL \client_ip[10]~output_o\ : std_logic;
SIGNAL \client_ip[11]~output_o\ : std_logic;
SIGNAL \client_ip[12]~output_o\ : std_logic;
SIGNAL \client_ip[13]~output_o\ : std_logic;
SIGNAL \client_ip[14]~output_o\ : std_logic;
SIGNAL \client_ip[15]~output_o\ : std_logic;
SIGNAL \client_ip[16]~output_o\ : std_logic;
SIGNAL \client_ip[17]~output_o\ : std_logic;
SIGNAL \client_ip[18]~output_o\ : std_logic;
SIGNAL \client_ip[19]~output_o\ : std_logic;
SIGNAL \client_ip[20]~output_o\ : std_logic;
SIGNAL \client_ip[21]~output_o\ : std_logic;
SIGNAL \client_ip[22]~output_o\ : std_logic;
SIGNAL \client_ip[23]~output_o\ : std_logic;
SIGNAL \client_ip[24]~output_o\ : std_logic;
SIGNAL \client_ip[25]~output_o\ : std_logic;
SIGNAL \client_ip[26]~output_o\ : std_logic;
SIGNAL \client_ip[27]~output_o\ : std_logic;
SIGNAL \client_ip[28]~output_o\ : std_logic;
SIGNAL \client_ip[29]~output_o\ : std_logic;
SIGNAL \client_ip[30]~output_o\ : std_logic;
SIGNAL \client_ip[31]~output_o\ : std_logic;
SIGNAL \client_port[0]~output_o\ : std_logic;
SIGNAL \client_port[1]~output_o\ : std_logic;
SIGNAL \client_port[2]~output_o\ : std_logic;
SIGNAL \client_port[3]~output_o\ : std_logic;
SIGNAL \client_port[4]~output_o\ : std_logic;
SIGNAL \client_port[5]~output_o\ : std_logic;
SIGNAL \client_port[6]~output_o\ : std_logic;
SIGNAL \client_port[7]~output_o\ : std_logic;
SIGNAL \client_port[8]~output_o\ : std_logic;
SIGNAL \client_port[9]~output_o\ : std_logic;
SIGNAL \client_port[10]~output_o\ : std_logic;
SIGNAL \client_port[11]~output_o\ : std_logic;
SIGNAL \client_port[12]~output_o\ : std_logic;
SIGNAL \client_port[13]~output_o\ : std_logic;
SIGNAL \client_port[14]~output_o\ : std_logic;
SIGNAL \client_port[15]~output_o\ : std_logic;
SIGNAL \in_ready~output_o\ : std_logic;
SIGNAL \out_data[0]~output_o\ : std_logic;
SIGNAL \out_data[1]~output_o\ : std_logic;
SIGNAL \out_data[2]~output_o\ : std_logic;
SIGNAL \out_data[3]~output_o\ : std_logic;
SIGNAL \out_data[4]~output_o\ : std_logic;
SIGNAL \out_data[5]~output_o\ : std_logic;
SIGNAL \out_data[6]~output_o\ : std_logic;
SIGNAL \out_data[7]~output_o\ : std_logic;
SIGNAL \out_valid~output_o\ : std_logic;
SIGNAL \out_sop~output_o\ : std_logic;
SIGNAL \out_eop~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \in_eop~input_o\ : std_logic;
SIGNAL \in_valid~input_o\ : std_logic;
SIGNAL \tx_pos[0]~7_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \out_ready~input_o\ : std_logic;
SIGNAL \in_data[4]~input_o\ : std_logic;
SIGNAL \rx_cnt[0]~8_combout\ : std_logic;
SIGNAL \in_data[3]~input_o\ : std_logic;
SIGNAL \rx_cnt[1]~11\ : std_logic;
SIGNAL \rx_cnt[2]~14_combout\ : std_logic;
SIGNAL \rx_cnt[7]~13_combout\ : std_logic;
SIGNAL \rx_cnt[2]~15\ : std_logic;
SIGNAL \rx_cnt[3]~16_combout\ : std_logic;
SIGNAL \rx_dest_port[15]~1_combout\ : std_logic;
SIGNAL \rx_cnt[3]~17\ : std_logic;
SIGNAL \rx_cnt[4]~18_combout\ : std_logic;
SIGNAL \rx_cnt[4]~19\ : std_logic;
SIGNAL \rx_cnt[5]~20_combout\ : std_logic;
SIGNAL \rx_cnt[5]~21\ : std_logic;
SIGNAL \rx_cnt[6]~22_combout\ : std_logic;
SIGNAL \rx_cnt[6]~23\ : std_logic;
SIGNAL \rx_cnt[7]~24_combout\ : std_logic;
SIGNAL \port_valid~0_combout\ : std_logic;
SIGNAL \rx_dest_port[15]~2_combout\ : std_logic;
SIGNAL \rx_dest_port[15]~3_combout\ : std_logic;
SIGNAL \in_data[5]~input_o\ : std_logic;
SIGNAL \in_data[2]~input_o\ : std_logic;
SIGNAL \rx_dest_port[12]~feeder_combout\ : std_logic;
SIGNAL \port_valid~5_combout\ : std_logic;
SIGNAL \in_data[1]~input_o\ : std_logic;
SIGNAL \in_data[0]~input_o\ : std_logic;
SIGNAL \in_data[7]~input_o\ : std_logic;
SIGNAL \port_valid~6_combout\ : std_logic;
SIGNAL \in_data[6]~input_o\ : std_logic;
SIGNAL \rx_dest_port[15]~feeder_combout\ : std_logic;
SIGNAL \port_valid~4_combout\ : std_logic;
SIGNAL \port_valid~7_combout\ : std_logic;
SIGNAL \in_sop~input_o\ : std_logic;
SIGNAL \mac_valid~16_combout\ : std_logic;
SIGNAL \port_valid~1_combout\ : std_logic;
SIGNAL \port_valid~2_combout\ : std_logic;
SIGNAL \port_valid~3_combout\ : std_logic;
SIGNAL \port_valid~8_combout\ : std_logic;
SIGNAL \port_valid~q\ : std_logic;
SIGNAL \rx_dest_ip[23]~1_combout\ : std_logic;
SIGNAL \rx_dest_ip[23]~0_combout\ : std_logic;
SIGNAL \rx_dest_ip[23]~2_combout\ : std_logic;
SIGNAL \rx_dest_ip[2]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_ip[4]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_ip[3]~feeder_combout\ : std_logic;
SIGNAL \ip_valid~6_combout\ : std_logic;
SIGNAL \rx_dest_ip[8]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_ip[1]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_ip[9]~feeder_combout\ : std_logic;
SIGNAL \ip_valid~5_combout\ : std_logic;
SIGNAL \rx_dest_ip[14]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_ip[15]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_ip[23]~feeder_combout\ : std_logic;
SIGNAL \ip_valid~0_combout\ : std_logic;
SIGNAL \rx_dest_ip[13]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_ip[21]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_ip[12]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_ip[10]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_ip[11]~feeder_combout\ : std_logic;
SIGNAL \ip_valid~1_combout\ : std_logic;
SIGNAL \ip_valid~3_combout\ : std_logic;
SIGNAL \rx_dest_ip[16]~feeder_combout\ : std_logic;
SIGNAL \ip_valid~2_combout\ : std_logic;
SIGNAL \ip_valid~4_combout\ : std_logic;
SIGNAL \ip_valid~7_combout\ : std_logic;
SIGNAL \ip_valid~8_combout\ : std_logic;
SIGNAL \ip_valid~9_combout\ : std_logic;
SIGNAL \ip_valid~q\ : std_logic;
SIGNAL \mac_valid~0_combout\ : std_logic;
SIGNAL \rx_dest_mac[39]~0_combout\ : std_logic;
SIGNAL \rx_dest_port[15]~0_combout\ : std_logic;
SIGNAL \rx_dest_mac[39]~1_combout\ : std_logic;
SIGNAL \rx_dest_mac[16]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[1]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[9]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[17]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[25]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[10]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[18]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[26]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[3]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[11]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[19]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[27]~feeder_combout\ : std_logic;
SIGNAL \mac_valid~4_combout\ : std_logic;
SIGNAL \rx_dest_mac[35]~feeder_combout\ : std_logic;
SIGNAL \mac_valid~2_combout\ : std_logic;
SIGNAL \rx_dest_mac[14]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[22]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[30]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[4]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[12]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[20]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[29]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[7]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[15]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[23]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[31]~feeder_combout\ : std_logic;
SIGNAL \mac_valid~3_combout\ : std_logic;
SIGNAL \rx_dest_mac[39]~feeder_combout\ : std_logic;
SIGNAL \rx_dest_mac[38]~feeder_combout\ : std_logic;
SIGNAL \mac_valid~1_combout\ : std_logic;
SIGNAL \mac_valid~5_combout\ : std_logic;
SIGNAL \mac_valid~6_combout\ : std_logic;
SIGNAL \mac_valid~12_combout\ : std_logic;
SIGNAL \mac_valid~14_combout\ : std_logic;
SIGNAL \mac_valid~13_combout\ : std_logic;
SIGNAL \mac_valid~10_combout\ : std_logic;
SIGNAL \mac_valid~7_combout\ : std_logic;
SIGNAL \mac_valid~9_combout\ : std_logic;
SIGNAL \mac_valid~8_combout\ : std_logic;
SIGNAL \mac_valid~11_combout\ : std_logic;
SIGNAL \mac_valid~15_combout\ : std_logic;
SIGNAL \mac_valid~17_combout\ : std_logic;
SIGNAL \mac_valid~q\ : std_logic;
SIGNAL \syn_received~2_combout\ : std_logic;
SIGNAL \syn_received~3_combout\ : std_logic;
SIGNAL \syn_received~q\ : std_logic;
SIGNAL \rx_cnt[7]~12_combout\ : std_logic;
SIGNAL \rx_cnt[0]~9\ : std_logic;
SIGNAL \rx_cnt[1]~10_combout\ : std_logic;
SIGNAL \syn_received~0_combout\ : std_logic;
SIGNAL \c_mac[0]~1_combout\ : std_logic;
SIGNAL \syn_received~1_combout\ : std_logic;
SIGNAL \next_state.ESTABLISHED~0_combout\ : std_logic;
SIGNAL \next_state.ESTABLISHED~q\ : std_logic;
SIGNAL \Selector1~3_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \Selector1~4_combout\ : std_logic;
SIGNAL \Selector1~5_combout\ : std_logic;
SIGNAL \state.CLOSED~q\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \state.LISTEN~q\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \Selector14~1_combout\ : std_logic;
SIGNAL \Selector14~2_combout\ : std_logic;
SIGNAL \tx_active~q\ : std_logic;
SIGNAL \tx_byte[1]~1_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \state.SYN_RCVD~q\ : std_logic;
SIGNAL \tx_pos[0]~8\ : std_logic;
SIGNAL \tx_pos[1]~9_combout\ : std_logic;
SIGNAL \tx_pos[1]~10\ : std_logic;
SIGNAL \tx_pos[2]~14_combout\ : std_logic;
SIGNAL \tx_pos[2]~15\ : std_logic;
SIGNAL \tx_pos[3]~16_combout\ : std_logic;
SIGNAL \tx_pos[3]~17\ : std_logic;
SIGNAL \tx_pos[4]~18_combout\ : std_logic;
SIGNAL \tx_pos[4]~19\ : std_logic;
SIGNAL \tx_pos[5]~20_combout\ : std_logic;
SIGNAL \tx_pos[5]~21\ : std_logic;
SIGNAL \tx_pos[6]~22_combout\ : std_logic;
SIGNAL \tx_pos[6]~12_combout\ : std_logic;
SIGNAL \Equal10~0_combout\ : std_logic;
SIGNAL \tx_pos[6]~11_combout\ : std_logic;
SIGNAL \tx_pos[6]~13_combout\ : std_logic;
SIGNAL \Equal10~1_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \state.WAIT_ACK~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \state.ESTABLISHED~0_combout\ : std_logic;
SIGNAL \state.ESTABLISHED~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \is_connected~reg0_q\ : std_logic;
SIGNAL \c_mac[0]~feeder_combout\ : std_logic;
SIGNAL \c_mac[0]~0_combout\ : std_logic;
SIGNAL \c_mac[0]~2_combout\ : std_logic;
SIGNAL \c_mac[1]~feeder_combout\ : std_logic;
SIGNAL \c_mac[2]~feeder_combout\ : std_logic;
SIGNAL \c_mac[3]~feeder_combout\ : std_logic;
SIGNAL \c_mac[4]~feeder_combout\ : std_logic;
SIGNAL \c_mac[5]~feeder_combout\ : std_logic;
SIGNAL \c_mac[7]~feeder_combout\ : std_logic;
SIGNAL \c_mac[8]~feeder_combout\ : std_logic;
SIGNAL \c_mac[9]~feeder_combout\ : std_logic;
SIGNAL \c_mac[10]~feeder_combout\ : std_logic;
SIGNAL \c_mac[11]~feeder_combout\ : std_logic;
SIGNAL \c_mac[12]~feeder_combout\ : std_logic;
SIGNAL \c_mac[13]~feeder_combout\ : std_logic;
SIGNAL \c_mac[14]~feeder_combout\ : std_logic;
SIGNAL \c_mac[18]~feeder_combout\ : std_logic;
SIGNAL \c_mac[19]~feeder_combout\ : std_logic;
SIGNAL \c_mac[20]~feeder_combout\ : std_logic;
SIGNAL \c_mac[21]~feeder_combout\ : std_logic;
SIGNAL \c_mac[22]~feeder_combout\ : std_logic;
SIGNAL \c_mac[23]~feeder_combout\ : std_logic;
SIGNAL \c_mac[24]~feeder_combout\ : std_logic;
SIGNAL \c_mac[25]~feeder_combout\ : std_logic;
SIGNAL \c_mac[26]~feeder_combout\ : std_logic;
SIGNAL \c_mac[27]~feeder_combout\ : std_logic;
SIGNAL \c_mac[29]~feeder_combout\ : std_logic;
SIGNAL \c_mac[30]~feeder_combout\ : std_logic;
SIGNAL \c_mac[32]~feeder_combout\ : std_logic;
SIGNAL \c_mac[34]~feeder_combout\ : std_logic;
SIGNAL \c_mac[35]~feeder_combout\ : std_logic;
SIGNAL \c_mac[36]~feeder_combout\ : std_logic;
SIGNAL \c_mac[38]~feeder_combout\ : std_logic;
SIGNAL \c_mac[39]~feeder_combout\ : std_logic;
SIGNAL \c_mac[40]~feeder_combout\ : std_logic;
SIGNAL \c_mac[41]~feeder_combout\ : std_logic;
SIGNAL \c_mac[43]~feeder_combout\ : std_logic;
SIGNAL \c_mac[44]~feeder_combout\ : std_logic;
SIGNAL \c_mac[46]~feeder_combout\ : std_logic;
SIGNAL \c_ip[0]~feeder_combout\ : std_logic;
SIGNAL \c_port[0]~0_combout\ : std_logic;
SIGNAL \c_port[0]~1_combout\ : std_logic;
SIGNAL \c_ip[0]~0_combout\ : std_logic;
SIGNAL \c_ip[1]~feeder_combout\ : std_logic;
SIGNAL \c_ip[3]~feeder_combout\ : std_logic;
SIGNAL \c_ip[4]~feeder_combout\ : std_logic;
SIGNAL \c_ip[5]~feeder_combout\ : std_logic;
SIGNAL \c_ip[6]~feeder_combout\ : std_logic;
SIGNAL \c_ip[8]~feeder_combout\ : std_logic;
SIGNAL \c_ip[9]~feeder_combout\ : std_logic;
SIGNAL \c_ip[10]~feeder_combout\ : std_logic;
SIGNAL \c_ip[11]~feeder_combout\ : std_logic;
SIGNAL \c_ip[12]~feeder_combout\ : std_logic;
SIGNAL \c_ip[13]~feeder_combout\ : std_logic;
SIGNAL \c_ip[15]~feeder_combout\ : std_logic;
SIGNAL \c_ip[16]~feeder_combout\ : std_logic;
SIGNAL \c_ip[17]~feeder_combout\ : std_logic;
SIGNAL \c_ip[18]~feeder_combout\ : std_logic;
SIGNAL \c_ip[20]~feeder_combout\ : std_logic;
SIGNAL \c_ip[21]~feeder_combout\ : std_logic;
SIGNAL \c_ip[24]~feeder_combout\ : std_logic;
SIGNAL \c_ip[25]~feeder_combout\ : std_logic;
SIGNAL \c_ip[26]~feeder_combout\ : std_logic;
SIGNAL \c_ip[28]~feeder_combout\ : std_logic;
SIGNAL \c_ip[30]~feeder_combout\ : std_logic;
SIGNAL \c_ip[31]~feeder_combout\ : std_logic;
SIGNAL \c_port[0]~2_combout\ : std_logic;
SIGNAL \c_port[1]~feeder_combout\ : std_logic;
SIGNAL \c_port[3]~feeder_combout\ : std_logic;
SIGNAL \c_port[4]~feeder_combout\ : std_logic;
SIGNAL \c_port[5]~feeder_combout\ : std_logic;
SIGNAL \c_port[7]~feeder_combout\ : std_logic;
SIGNAL \c_port[9]~feeder_combout\ : std_logic;
SIGNAL \c_port[11]~feeder_combout\ : std_logic;
SIGNAL \c_port[12]~feeder_combout\ : std_logic;
SIGNAL \c_port[13]~feeder_combout\ : std_logic;
SIGNAL \c_port[14]~feeder_combout\ : std_logic;
SIGNAL \c_port[15]~feeder_combout\ : std_logic;
SIGNAL \Equal9~0_combout\ : std_logic;
SIGNAL \Equal9~1_combout\ : std_logic;
SIGNAL \tx_byte[1]~feeder_combout\ : std_logic;
SIGNAL \tx_byte[1]~0_combout\ : std_logic;
SIGNAL \out_sop~0_combout\ : std_logic;
SIGNAL \out_sop~1_combout\ : std_logic;
SIGNAL \out_eop~0_combout\ : std_logic;
SIGNAL c_ip : std_logic_vector(31 DOWNTO 0);
SIGNAL tx_pos : std_logic_vector(6 DOWNTO 0);
SIGNAL rx_cnt : std_logic_vector(7 DOWNTO 0);
SIGNAL c_mac : std_logic_vector(47 DOWNTO 0);
SIGNAL c_port : std_logic_vector(15 DOWNTO 0);
SIGNAL tx_byte : std_logic_vector(7 DOWNTO 0);
SIGNAL rx_dest_mac : std_logic_vector(47 DOWNTO 0);
SIGNAL rx_dest_ip : std_logic_vector(31 DOWNTO 0);
SIGNAL rx_dest_port : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_state.SYN_RCVD~q\ : std_logic;
SIGNAL \ALT_INV_tx_active~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
is_connected <= ww_is_connected;
client_mac <= ww_client_mac;
client_ip <= ww_client_ip;
client_port <= ww_client_port;
ww_in_data <= in_data;
ww_in_valid <= in_valid;
ww_in_sop <= in_sop;
ww_in_eop <= in_eop;
in_ready <= ww_in_ready;
out_data <= ww_out_data;
out_valid <= ww_out_valid;
out_sop <= ww_out_sop;
out_eop <= ww_out_eop;
ww_out_ready <= out_ready;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_state.SYN_RCVD~q\ <= NOT \state.SYN_RCVD~q\;
\ALT_INV_tx_active~q\ <= NOT \tx_active~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y18_N23
\is_connected~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \is_connected~reg0_q\,
	devoe => ww_devoe,
	o => \is_connected~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\client_mac[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(0),
	devoe => ww_devoe,
	o => \client_mac[0]~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\client_mac[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(1),
	devoe => ww_devoe,
	o => \client_mac[1]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\client_mac[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(2),
	devoe => ww_devoe,
	o => \client_mac[2]~output_o\);

-- Location: IOOBUF_X11_Y24_N9
\client_mac[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(3),
	devoe => ww_devoe,
	o => \client_mac[3]~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\client_mac[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(4),
	devoe => ww_devoe,
	o => \client_mac[4]~output_o\);

-- Location: IOOBUF_X1_Y24_N2
\client_mac[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(5),
	devoe => ww_devoe,
	o => \client_mac[5]~output_o\);

-- Location: IOOBUF_X21_Y24_N2
\client_mac[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(6),
	devoe => ww_devoe,
	o => \client_mac[6]~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\client_mac[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(7),
	devoe => ww_devoe,
	o => \client_mac[7]~output_o\);

-- Location: IOOBUF_X11_Y0_N9
\client_mac[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(8),
	devoe => ww_devoe,
	o => \client_mac[8]~output_o\);

-- Location: IOOBUF_X7_Y0_N9
\client_mac[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(9),
	devoe => ww_devoe,
	o => \client_mac[9]~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\client_mac[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(10),
	devoe => ww_devoe,
	o => \client_mac[10]~output_o\);

-- Location: IOOBUF_X5_Y24_N23
\client_mac[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(11),
	devoe => ww_devoe,
	o => \client_mac[11]~output_o\);

-- Location: IOOBUF_X0_Y7_N16
\client_mac[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(12),
	devoe => ww_devoe,
	o => \client_mac[12]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\client_mac[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(13),
	devoe => ww_devoe,
	o => \client_mac[13]~output_o\);

-- Location: IOOBUF_X13_Y24_N9
\client_mac[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(14),
	devoe => ww_devoe,
	o => \client_mac[14]~output_o\);

-- Location: IOOBUF_X21_Y24_N9
\client_mac[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(15),
	devoe => ww_devoe,
	o => \client_mac[15]~output_o\);

-- Location: IOOBUF_X11_Y0_N2
\client_mac[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(16),
	devoe => ww_devoe,
	o => \client_mac[16]~output_o\);

-- Location: IOOBUF_X32_Y24_N23
\client_mac[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(17),
	devoe => ww_devoe,
	o => \client_mac[17]~output_o\);

-- Location: IOOBUF_X7_Y24_N9
\client_mac[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(18),
	devoe => ww_devoe,
	o => \client_mac[18]~output_o\);

-- Location: IOOBUF_X13_Y24_N2
\client_mac[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(19),
	devoe => ww_devoe,
	o => \client_mac[19]~output_o\);

-- Location: IOOBUF_X32_Y24_N9
\client_mac[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(20),
	devoe => ww_devoe,
	o => \client_mac[20]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\client_mac[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(21),
	devoe => ww_devoe,
	o => \client_mac[21]~output_o\);

-- Location: IOOBUF_X25_Y24_N16
\client_mac[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(22),
	devoe => ww_devoe,
	o => \client_mac[22]~output_o\);

-- Location: IOOBUF_X25_Y24_N9
\client_mac[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(23),
	devoe => ww_devoe,
	o => \client_mac[23]~output_o\);

-- Location: IOOBUF_X0_Y4_N16
\client_mac[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(24),
	devoe => ww_devoe,
	o => \client_mac[24]~output_o\);

-- Location: IOOBUF_X34_Y19_N2
\client_mac[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(25),
	devoe => ww_devoe,
	o => \client_mac[25]~output_o\);

-- Location: IOOBUF_X21_Y24_N16
\client_mac[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(26),
	devoe => ww_devoe,
	o => \client_mac[26]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\client_mac[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(27),
	devoe => ww_devoe,
	o => \client_mac[27]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\client_mac[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(28),
	devoe => ww_devoe,
	o => \client_mac[28]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\client_mac[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(29),
	devoe => ww_devoe,
	o => \client_mac[29]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\client_mac[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(30),
	devoe => ww_devoe,
	o => \client_mac[30]~output_o\);

-- Location: IOOBUF_X21_Y0_N9
\client_mac[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(31),
	devoe => ww_devoe,
	o => \client_mac[31]~output_o\);

-- Location: IOOBUF_X25_Y0_N16
\client_mac[32]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(32),
	devoe => ww_devoe,
	o => \client_mac[32]~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\client_mac[33]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(33),
	devoe => ww_devoe,
	o => \client_mac[33]~output_o\);

-- Location: IOOBUF_X11_Y24_N2
\client_mac[34]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(34),
	devoe => ww_devoe,
	o => \client_mac[34]~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\client_mac[35]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(35),
	devoe => ww_devoe,
	o => \client_mac[35]~output_o\);

-- Location: IOOBUF_X16_Y0_N16
\client_mac[36]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(36),
	devoe => ww_devoe,
	o => \client_mac[36]~output_o\);

-- Location: IOOBUF_X34_Y18_N2
\client_mac[37]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(37),
	devoe => ww_devoe,
	o => \client_mac[37]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\client_mac[38]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(38),
	devoe => ww_devoe,
	o => \client_mac[38]~output_o\);

-- Location: IOOBUF_X25_Y24_N23
\client_mac[39]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(39),
	devoe => ww_devoe,
	o => \client_mac[39]~output_o\);

-- Location: IOOBUF_X9_Y0_N16
\client_mac[40]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(40),
	devoe => ww_devoe,
	o => \client_mac[40]~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\client_mac[41]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(41),
	devoe => ww_devoe,
	o => \client_mac[41]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\client_mac[42]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(42),
	devoe => ww_devoe,
	o => \client_mac[42]~output_o\);

-- Location: IOOBUF_X25_Y24_N2
\client_mac[43]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(43),
	devoe => ww_devoe,
	o => \client_mac[43]~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\client_mac[44]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(44),
	devoe => ww_devoe,
	o => \client_mac[44]~output_o\);

-- Location: IOOBUF_X34_Y18_N16
\client_mac[45]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(45),
	devoe => ww_devoe,
	o => \client_mac[45]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\client_mac[46]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(46),
	devoe => ww_devoe,
	o => \client_mac[46]~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\client_mac[47]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_mac(47),
	devoe => ww_devoe,
	o => \client_mac[47]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\client_ip[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(0),
	devoe => ww_devoe,
	o => \client_ip[0]~output_o\);

-- Location: IOOBUF_X0_Y10_N16
\client_ip[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(1),
	devoe => ww_devoe,
	o => \client_ip[1]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\client_ip[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(2),
	devoe => ww_devoe,
	o => \client_ip[2]~output_o\);

-- Location: IOOBUF_X34_Y17_N16
\client_ip[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(3),
	devoe => ww_devoe,
	o => \client_ip[3]~output_o\);

-- Location: IOOBUF_X3_Y24_N2
\client_ip[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(4),
	devoe => ww_devoe,
	o => \client_ip[4]~output_o\);

-- Location: IOOBUF_X7_Y24_N2
\client_ip[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(5),
	devoe => ww_devoe,
	o => \client_ip[5]~output_o\);

-- Location: IOOBUF_X9_Y0_N2
\client_ip[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(6),
	devoe => ww_devoe,
	o => \client_ip[6]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\client_ip[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(7),
	devoe => ww_devoe,
	o => \client_ip[7]~output_o\);

-- Location: IOOBUF_X9_Y0_N23
\client_ip[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(8),
	devoe => ww_devoe,
	o => \client_ip[8]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\client_ip[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(9),
	devoe => ww_devoe,
	o => \client_ip[9]~output_o\);

-- Location: IOOBUF_X7_Y24_N16
\client_ip[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(10),
	devoe => ww_devoe,
	o => \client_ip[10]~output_o\);

-- Location: IOOBUF_X13_Y0_N23
\client_ip[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(11),
	devoe => ww_devoe,
	o => \client_ip[11]~output_o\);

-- Location: IOOBUF_X0_Y23_N9
\client_ip[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(12),
	devoe => ww_devoe,
	o => \client_ip[12]~output_o\);

-- Location: IOOBUF_X0_Y22_N2
\client_ip[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(13),
	devoe => ww_devoe,
	o => \client_ip[13]~output_o\);

-- Location: IOOBUF_X0_Y21_N9
\client_ip[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(14),
	devoe => ww_devoe,
	o => \client_ip[14]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\client_ip[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(15),
	devoe => ww_devoe,
	o => \client_ip[15]~output_o\);

-- Location: IOOBUF_X0_Y9_N2
\client_ip[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(16),
	devoe => ww_devoe,
	o => \client_ip[16]~output_o\);

-- Location: IOOBUF_X1_Y24_N9
\client_ip[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(17),
	devoe => ww_devoe,
	o => \client_ip[17]~output_o\);

-- Location: IOOBUF_X3_Y24_N23
\client_ip[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(18),
	devoe => ww_devoe,
	o => \client_ip[18]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\client_ip[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(19),
	devoe => ww_devoe,
	o => \client_ip[19]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\client_ip[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(20),
	devoe => ww_devoe,
	o => \client_ip[20]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\client_ip[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(21),
	devoe => ww_devoe,
	o => \client_ip[21]~output_o\);

-- Location: IOOBUF_X3_Y24_N16
\client_ip[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(22),
	devoe => ww_devoe,
	o => \client_ip[22]~output_o\);

-- Location: IOOBUF_X0_Y10_N2
\client_ip[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(23),
	devoe => ww_devoe,
	o => \client_ip[23]~output_o\);

-- Location: IOOBUF_X0_Y8_N2
\client_ip[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(24),
	devoe => ww_devoe,
	o => \client_ip[24]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\client_ip[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(25),
	devoe => ww_devoe,
	o => \client_ip[25]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\client_ip[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(26),
	devoe => ww_devoe,
	o => \client_ip[26]~output_o\);

-- Location: IOOBUF_X13_Y0_N16
\client_ip[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(27),
	devoe => ww_devoe,
	o => \client_ip[27]~output_o\);

-- Location: IOOBUF_X0_Y7_N23
\client_ip[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(28),
	devoe => ww_devoe,
	o => \client_ip[28]~output_o\);

-- Location: IOOBUF_X3_Y24_N9
\client_ip[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(29),
	devoe => ww_devoe,
	o => \client_ip[29]~output_o\);

-- Location: IOOBUF_X5_Y24_N2
\client_ip[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(30),
	devoe => ww_devoe,
	o => \client_ip[30]~output_o\);

-- Location: IOOBUF_X0_Y4_N23
\client_ip[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_ip(31),
	devoe => ww_devoe,
	o => \client_ip[31]~output_o\);

-- Location: IOOBUF_X5_Y24_N9
\client_port[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(0),
	devoe => ww_devoe,
	o => \client_port[0]~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\client_port[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(1),
	devoe => ww_devoe,
	o => \client_port[1]~output_o\);

-- Location: IOOBUF_X30_Y24_N9
\client_port[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(2),
	devoe => ww_devoe,
	o => \client_port[2]~output_o\);

-- Location: IOOBUF_X34_Y17_N23
\client_port[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(3),
	devoe => ww_devoe,
	o => \client_port[3]~output_o\);

-- Location: IOOBUF_X18_Y24_N9
\client_port[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(4),
	devoe => ww_devoe,
	o => \client_port[4]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\client_port[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(5),
	devoe => ww_devoe,
	o => \client_port[5]~output_o\);

-- Location: IOOBUF_X34_Y19_N9
\client_port[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(6),
	devoe => ww_devoe,
	o => \client_port[6]~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\client_port[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(7),
	devoe => ww_devoe,
	o => \client_port[7]~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\client_port[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(8),
	devoe => ww_devoe,
	o => \client_port[8]~output_o\);

-- Location: IOOBUF_X0_Y8_N9
\client_port[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(9),
	devoe => ww_devoe,
	o => \client_port[9]~output_o\);

-- Location: IOOBUF_X9_Y0_N9
\client_port[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(10),
	devoe => ww_devoe,
	o => \client_port[10]~output_o\);

-- Location: IOOBUF_X34_Y11_N9
\client_port[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(11),
	devoe => ww_devoe,
	o => \client_port[11]~output_o\);

-- Location: IOOBUF_X23_Y24_N23
\client_port[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(12),
	devoe => ww_devoe,
	o => \client_port[12]~output_o\);

-- Location: IOOBUF_X28_Y24_N16
\client_port[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(13),
	devoe => ww_devoe,
	o => \client_port[13]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\client_port[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(14),
	devoe => ww_devoe,
	o => \client_port[14]~output_o\);

-- Location: IOOBUF_X16_Y24_N2
\client_port[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => c_port(15),
	devoe => ww_devoe,
	o => \client_port[15]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\in_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_tx_active~q\,
	devoe => ww_devoe,
	o => \in_ready~output_o\);

-- Location: IOOBUF_X34_Y6_N16
\out_data[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_data[0]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\out_data[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => tx_byte(1),
	devoe => ww_devoe,
	o => \out_data[1]~output_o\);

-- Location: IOOBUF_X30_Y0_N9
\out_data[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_data[2]~output_o\);

-- Location: IOOBUF_X34_Y7_N9
\out_data[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_data[3]~output_o\);

-- Location: IOOBUF_X7_Y0_N16
\out_data[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => tx_byte(4),
	devoe => ww_devoe,
	o => \out_data[4]~output_o\);

-- Location: IOOBUF_X25_Y0_N9
\out_data[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_data[5]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\out_data[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_data[6]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\out_data[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_data[7]~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\out_valid~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tx_active~q\,
	devoe => ww_devoe,
	o => \out_valid~output_o\);

-- Location: IOOBUF_X0_Y22_N16
\out_sop~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \out_sop~1_combout\,
	devoe => ww_devoe,
	o => \out_sop~output_o\);

-- Location: IOOBUF_X0_Y23_N2
\out_eop~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \out_eop~0_combout\,
	devoe => ww_devoe,
	o => \out_eop~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G2
\clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X5_Y24_N15
\in_eop~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_eop,
	o => \in_eop~input_o\);

-- Location: IOIBUF_X11_Y0_N15
\in_valid~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_valid,
	o => \in_valid~input_o\);

-- Location: LCCOMB_X11_Y19_N6
\tx_pos[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_pos[0]~7_combout\ = tx_pos(0) $ (VCC)
-- \tx_pos[0]~8\ = CARRY(tx_pos(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_pos(0),
	datad => VCC,
	combout => \tx_pos[0]~7_combout\,
	cout => \tx_pos[0]~8\);

-- Location: IOIBUF_X0_Y11_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: IOIBUF_X11_Y24_N22
\out_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_out_ready,
	o => \out_ready~input_o\);

-- Location: IOIBUF_X0_Y19_N15
\in_data[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_data(4),
	o => \in_data[4]~input_o\);

-- Location: LCCOMB_X12_Y18_N12
\rx_cnt[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_cnt[0]~8_combout\ = rx_cnt(0) $ (VCC)
-- \rx_cnt[0]~9\ = CARRY(rx_cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rx_cnt(0),
	datad => VCC,
	combout => \rx_cnt[0]~8_combout\,
	cout => \rx_cnt[0]~9\);

-- Location: IOIBUF_X13_Y24_N22
\in_data[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_data(3),
	o => \in_data[3]~input_o\);

-- Location: LCCOMB_X12_Y18_N14
\rx_cnt[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_cnt[1]~10_combout\ = (rx_cnt(1) & (!\rx_cnt[0]~9\)) # (!rx_cnt(1) & ((\rx_cnt[0]~9\) # (GND)))
-- \rx_cnt[1]~11\ = CARRY((!\rx_cnt[0]~9\) # (!rx_cnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(1),
	datad => VCC,
	cin => \rx_cnt[0]~9\,
	combout => \rx_cnt[1]~10_combout\,
	cout => \rx_cnt[1]~11\);

-- Location: LCCOMB_X12_Y18_N16
\rx_cnt[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_cnt[2]~14_combout\ = (rx_cnt(2) & (\rx_cnt[1]~11\ $ (GND))) # (!rx_cnt(2) & (!\rx_cnt[1]~11\ & VCC))
-- \rx_cnt[2]~15\ = CARRY((rx_cnt(2) & !\rx_cnt[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(2),
	datad => VCC,
	cin => \rx_cnt[1]~11\,
	combout => \rx_cnt[2]~14_combout\,
	cout => \rx_cnt[2]~15\);

-- Location: LCCOMB_X11_Y18_N16
\rx_cnt[7]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_cnt[7]~13_combout\ = (\in_valid~input_o\ & ((\state.LISTEN~q\) # (\state.WAIT_ACK~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.LISTEN~q\,
	datac => \in_valid~input_o\,
	datad => \state.WAIT_ACK~q\,
	combout => \rx_cnt[7]~13_combout\);

-- Location: FF_X12_Y18_N17
\rx_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_cnt[2]~14_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \rx_cnt[7]~12_combout\,
	ena => \rx_cnt[7]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_cnt(2));

-- Location: LCCOMB_X12_Y18_N18
\rx_cnt[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_cnt[3]~16_combout\ = (rx_cnt(3) & (!\rx_cnt[2]~15\)) # (!rx_cnt(3) & ((\rx_cnt[2]~15\) # (GND)))
-- \rx_cnt[3]~17\ = CARRY((!\rx_cnt[2]~15\) # (!rx_cnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rx_cnt(3),
	datad => VCC,
	cin => \rx_cnt[2]~15\,
	combout => \rx_cnt[3]~16_combout\,
	cout => \rx_cnt[3]~17\);

-- Location: FF_X12_Y18_N19
\rx_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_cnt[3]~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \rx_cnt[7]~12_combout\,
	ena => \rx_cnt[7]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_cnt(3));

-- Location: LCCOMB_X13_Y18_N4
\rx_dest_port[15]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_port[15]~1_combout\ = (!rx_cnt(1) & (rx_cnt(3) & (!\reset~input_o\ & !rx_cnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(1),
	datab => rx_cnt(3),
	datac => \reset~input_o\,
	datad => rx_cnt(0),
	combout => \rx_dest_port[15]~1_combout\);

-- Location: LCCOMB_X12_Y18_N20
\rx_cnt[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_cnt[4]~18_combout\ = (rx_cnt(4) & (\rx_cnt[3]~17\ $ (GND))) # (!rx_cnt(4) & (!\rx_cnt[3]~17\ & VCC))
-- \rx_cnt[4]~19\ = CARRY((rx_cnt(4) & !\rx_cnt[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(4),
	datad => VCC,
	cin => \rx_cnt[3]~17\,
	combout => \rx_cnt[4]~18_combout\,
	cout => \rx_cnt[4]~19\);

-- Location: FF_X12_Y18_N21
\rx_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_cnt[4]~18_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \rx_cnt[7]~12_combout\,
	ena => \rx_cnt[7]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_cnt(4));

-- Location: LCCOMB_X12_Y18_N22
\rx_cnt[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_cnt[5]~20_combout\ = (rx_cnt(5) & (!\rx_cnt[4]~19\)) # (!rx_cnt(5) & ((\rx_cnt[4]~19\) # (GND)))
-- \rx_cnt[5]~21\ = CARRY((!\rx_cnt[4]~19\) # (!rx_cnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rx_cnt(5),
	datad => VCC,
	cin => \rx_cnt[4]~19\,
	combout => \rx_cnt[5]~20_combout\,
	cout => \rx_cnt[5]~21\);

-- Location: FF_X12_Y18_N23
\rx_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_cnt[5]~20_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \rx_cnt[7]~12_combout\,
	ena => \rx_cnt[7]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_cnt(5));

-- Location: LCCOMB_X12_Y18_N24
\rx_cnt[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_cnt[6]~22_combout\ = (rx_cnt(6) & (\rx_cnt[5]~21\ $ (GND))) # (!rx_cnt(6) & (!\rx_cnt[5]~21\ & VCC))
-- \rx_cnt[6]~23\ = CARRY((rx_cnt(6) & !\rx_cnt[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(6),
	datad => VCC,
	cin => \rx_cnt[5]~21\,
	combout => \rx_cnt[6]~22_combout\,
	cout => \rx_cnt[6]~23\);

-- Location: FF_X12_Y18_N25
\rx_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_cnt[6]~22_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \rx_cnt[7]~12_combout\,
	ena => \rx_cnt[7]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_cnt(6));

-- Location: LCCOMB_X12_Y18_N26
\rx_cnt[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_cnt[7]~24_combout\ = \rx_cnt[6]~23\ $ (rx_cnt(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => rx_cnt(7),
	cin => \rx_cnt[6]~23\,
	combout => \rx_cnt[7]~24_combout\);

-- Location: FF_X12_Y18_N27
\rx_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_cnt[7]~24_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \rx_cnt[7]~12_combout\,
	ena => \rx_cnt[7]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_cnt(7));

-- Location: LCCOMB_X12_Y18_N4
\port_valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \port_valid~0_combout\ = (\in_valid~input_o\ & (!rx_cnt(6) & (!rx_cnt(7) & !rx_cnt(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in_valid~input_o\,
	datab => rx_cnt(6),
	datac => rx_cnt(7),
	datad => rx_cnt(4),
	combout => \port_valid~0_combout\);

-- Location: LCCOMB_X13_Y18_N18
\rx_dest_port[15]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_port[15]~2_combout\ = (\state.LISTEN~q\ & rx_cnt(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.LISTEN~q\,
	datad => rx_cnt(5),
	combout => \rx_dest_port[15]~2_combout\);

-- Location: LCCOMB_X13_Y18_N22
\rx_dest_port[15]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_port[15]~3_combout\ = (rx_cnt(2) & (\rx_dest_port[15]~1_combout\ & (\port_valid~0_combout\ & \rx_dest_port[15]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(2),
	datab => \rx_dest_port[15]~1_combout\,
	datac => \port_valid~0_combout\,
	datad => \rx_dest_port[15]~2_combout\,
	combout => \rx_dest_port[15]~3_combout\);

-- Location: FF_X13_Y18_N27
\rx_dest_port[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[3]~input_o\,
	sload => VCC,
	ena => \rx_dest_port[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_port(11));

-- Location: IOIBUF_X9_Y24_N15
\in_data[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_data(5),
	o => \in_data[5]~input_o\);

-- Location: FF_X13_Y18_N15
\rx_dest_port[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[5]~input_o\,
	sload => VCC,
	ena => \rx_dest_port[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_port(13));

-- Location: IOIBUF_X0_Y21_N22
\in_data[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_data(2),
	o => \in_data[2]~input_o\);

-- Location: FF_X13_Y18_N11
\rx_dest_port[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[2]~input_o\,
	sload => VCC,
	ena => \rx_dest_port[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_port(10));

-- Location: LCCOMB_X13_Y18_N24
\rx_dest_port[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_port[12]~feeder_combout\ = \in_data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[4]~input_o\,
	combout => \rx_dest_port[12]~feeder_combout\);

-- Location: FF_X13_Y18_N25
\rx_dest_port[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_port[12]~feeder_combout\,
	ena => \rx_dest_port[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_port(12));

-- Location: LCCOMB_X13_Y18_N10
\port_valid~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \port_valid~5_combout\ = (rx_dest_port(11) & (!rx_dest_port(13) & (rx_dest_port(10) & rx_dest_port(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_port(11),
	datab => rx_dest_port(13),
	datac => rx_dest_port(10),
	datad => rx_dest_port(12),
	combout => \port_valid~5_combout\);

-- Location: IOIBUF_X0_Y9_N8
\in_data[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_data(1),
	o => \in_data[1]~input_o\);

-- Location: FF_X13_Y18_N7
\rx_dest_port[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[1]~input_o\,
	sload => VCC,
	ena => \rx_dest_port[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_port(9));

-- Location: IOIBUF_X0_Y11_N22
\in_data[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_data(0),
	o => \in_data[0]~input_o\);

-- Location: FF_X13_Y18_N1
\rx_dest_port[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[0]~input_o\,
	sload => VCC,
	ena => \rx_dest_port[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_port(8));

-- Location: IOIBUF_X0_Y19_N22
\in_data[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_data(7),
	o => \in_data[7]~input_o\);

-- Location: LCCOMB_X13_Y18_N0
\port_valid~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \port_valid~6_combout\ = (rx_dest_port(9) & (!\in_data[0]~input_o\ & (rx_dest_port(8) & \in_data[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_port(9),
	datab => \in_data[0]~input_o\,
	datac => rx_dest_port(8),
	datad => \in_data[7]~input_o\,
	combout => \port_valid~6_combout\);

-- Location: IOIBUF_X9_Y24_N22
\in_data[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_data(6),
	o => \in_data[6]~input_o\);

-- Location: FF_X13_Y18_N13
\rx_dest_port[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[6]~input_o\,
	sload => VCC,
	ena => \rx_dest_port[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_port(14));

-- Location: LCCOMB_X13_Y18_N16
\rx_dest_port[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_port[15]~feeder_combout\ = \in_data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[7]~input_o\,
	combout => \rx_dest_port[15]~feeder_combout\);

-- Location: FF_X13_Y18_N17
\rx_dest_port[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_port[15]~feeder_combout\,
	ena => \rx_dest_port[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_port(15));

-- Location: LCCOMB_X13_Y18_N12
\port_valid~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \port_valid~4_combout\ = (rx_cnt(2) & (\in_data[4]~input_o\ & (!rx_dest_port(14) & !rx_dest_port(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(2),
	datab => \in_data[4]~input_o\,
	datac => rx_dest_port(14),
	datad => rx_dest_port(15),
	combout => \port_valid~4_combout\);

-- Location: LCCOMB_X13_Y18_N30
\port_valid~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \port_valid~7_combout\ = (\port_valid~5_combout\ & (\port_valid~6_combout\ & \port_valid~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \port_valid~5_combout\,
	datab => \port_valid~6_combout\,
	datad => \port_valid~4_combout\,
	combout => \port_valid~7_combout\);

-- Location: IOIBUF_X7_Y0_N22
\in_sop~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_sop,
	o => \in_sop~input_o\);

-- Location: LCCOMB_X11_Y17_N16
\mac_valid~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~16_combout\ = (!\in_valid~input_o\) # (!\in_sop~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \in_sop~input_o\,
	datad => \in_valid~input_o\,
	combout => \mac_valid~16_combout\);

-- Location: LCCOMB_X12_Y17_N14
\port_valid~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \port_valid~1_combout\ = (!\in_data[1]~input_o\ & (!\in_data[3]~input_o\ & (!rx_cnt(1) & rx_cnt(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in_data[1]~input_o\,
	datab => \in_data[3]~input_o\,
	datac => rx_cnt(1),
	datad => rx_cnt(3),
	combout => \port_valid~1_combout\);

-- Location: LCCOMB_X12_Y17_N24
\port_valid~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \port_valid~2_combout\ = (rx_cnt(0) & (!\in_data[5]~input_o\ & (\port_valid~1_combout\ & \port_valid~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(0),
	datab => \in_data[5]~input_o\,
	datac => \port_valid~1_combout\,
	datad => \port_valid~0_combout\,
	combout => \port_valid~2_combout\);

-- Location: LCCOMB_X11_Y17_N10
\port_valid~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \port_valid~3_combout\ = (!\in_data[2]~input_o\ & (!\in_data[6]~input_o\ & (rx_cnt(5) & \port_valid~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in_data[2]~input_o\,
	datab => \in_data[6]~input_o\,
	datac => rx_cnt(5),
	datad => \port_valid~2_combout\,
	combout => \port_valid~3_combout\);

-- Location: LCCOMB_X11_Y17_N22
\port_valid~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \port_valid~8_combout\ = (\port_valid~7_combout\ & ((\port_valid~3_combout\) # ((\mac_valid~16_combout\ & \port_valid~q\)))) # (!\port_valid~7_combout\ & (\mac_valid~16_combout\ & (\port_valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \port_valid~7_combout\,
	datab => \mac_valid~16_combout\,
	datac => \port_valid~q\,
	datad => \port_valid~3_combout\,
	combout => \port_valid~8_combout\);

-- Location: FF_X11_Y17_N23
port_valid : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \port_valid~8_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \state.LISTEN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_valid~q\);

-- Location: LCCOMB_X9_Y18_N14
\rx_dest_ip[23]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[23]~1_combout\ = (\state.LISTEN~q\ & ((!rx_cnt(0)) # (!rx_cnt(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(3),
	datac => \state.LISTEN~q\,
	datad => rx_cnt(0),
	combout => \rx_dest_ip[23]~1_combout\);

-- Location: LCCOMB_X9_Y18_N18
\rx_dest_ip[23]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[23]~0_combout\ = (!\reset~input_o\ & ((rx_cnt(3) & (!rx_cnt(1) & !rx_cnt(2))) # (!rx_cnt(3) & (rx_cnt(1) & rx_cnt(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(3),
	datab => \reset~input_o\,
	datac => rx_cnt(1),
	datad => rx_cnt(2),
	combout => \rx_dest_ip[23]~0_combout\);

-- Location: LCCOMB_X9_Y18_N4
\rx_dest_ip[23]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[23]~2_combout\ = (\port_valid~0_combout\ & (rx_cnt(5) & (\rx_dest_ip[23]~1_combout\ & \rx_dest_ip[23]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \port_valid~0_combout\,
	datab => rx_cnt(5),
	datac => \rx_dest_ip[23]~1_combout\,
	datad => \rx_dest_ip[23]~0_combout\,
	combout => \rx_dest_ip[23]~2_combout\);

-- Location: FF_X10_Y18_N11
\rx_dest_ip[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[5]~input_o\,
	sload => VCC,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(5));

-- Location: LCCOMB_X10_Y18_N4
\rx_dest_ip[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[2]~feeder_combout\ = \in_data[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[2]~input_o\,
	combout => \rx_dest_ip[2]~feeder_combout\);

-- Location: FF_X10_Y18_N5
\rx_dest_ip[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[2]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(2));

-- Location: LCCOMB_X10_Y18_N8
\rx_dest_ip[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[4]~feeder_combout\ = \in_data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[4]~input_o\,
	combout => \rx_dest_ip[4]~feeder_combout\);

-- Location: FF_X10_Y18_N9
\rx_dest_ip[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[4]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(4));

-- Location: LCCOMB_X10_Y18_N2
\rx_dest_ip[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[3]~feeder_combout\ = \in_data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[3]~input_o\,
	combout => \rx_dest_ip[3]~feeder_combout\);

-- Location: FF_X10_Y18_N3
\rx_dest_ip[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[3]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(3));

-- Location: LCCOMB_X10_Y18_N22
\ip_valid~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ip_valid~6_combout\ = (!rx_dest_ip(5) & (!rx_dest_ip(2) & (!rx_dest_ip(4) & !rx_dest_ip(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_ip(5),
	datab => rx_dest_ip(2),
	datac => rx_dest_ip(4),
	datad => rx_dest_ip(3),
	combout => \ip_valid~6_combout\);

-- Location: FF_X10_Y18_N29
\rx_dest_ip[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[0]~input_o\,
	sload => VCC,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(0));

-- Location: LCCOMB_X10_Y18_N6
\rx_dest_ip[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[8]~feeder_combout\ = rx_dest_ip(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_ip(0),
	combout => \rx_dest_ip[8]~feeder_combout\);

-- Location: FF_X10_Y18_N7
\rx_dest_ip[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[8]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(8));

-- Location: LCCOMB_X10_Y18_N18
\rx_dest_ip[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[1]~feeder_combout\ = \in_data[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[1]~input_o\,
	combout => \rx_dest_ip[1]~feeder_combout\);

-- Location: FF_X10_Y18_N19
\rx_dest_ip[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[1]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(1));

-- Location: LCCOMB_X10_Y18_N0
\rx_dest_ip[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[9]~feeder_combout\ = rx_dest_ip(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_ip(1),
	combout => \rx_dest_ip[9]~feeder_combout\);

-- Location: FF_X10_Y18_N1
\rx_dest_ip[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[9]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(9));

-- Location: FF_X10_Y18_N31
\rx_dest_ip[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[6]~input_o\,
	sload => VCC,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(6));

-- Location: FF_X10_Y18_N25
\rx_dest_ip[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[7]~input_o\,
	sload => VCC,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(7));

-- Location: LCCOMB_X10_Y18_N16
\ip_valid~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ip_valid~5_combout\ = (!rx_dest_ip(8) & (!rx_dest_ip(9) & (!rx_dest_ip(6) & !rx_dest_ip(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_ip(8),
	datab => rx_dest_ip(9),
	datac => rx_dest_ip(6),
	datad => rx_dest_ip(7),
	combout => \ip_valid~5_combout\);

-- Location: LCCOMB_X9_Y18_N10
\rx_dest_ip[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[14]~feeder_combout\ = rx_dest_ip(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => rx_dest_ip(6),
	combout => \rx_dest_ip[14]~feeder_combout\);

-- Location: FF_X9_Y18_N11
\rx_dest_ip[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[14]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(14));

-- Location: FF_X10_Y18_N13
\rx_dest_ip[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_ip(14),
	sload => VCC,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(22));

-- Location: LCCOMB_X9_Y18_N20
\rx_dest_ip[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[15]~feeder_combout\ = rx_dest_ip(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_ip(7),
	combout => \rx_dest_ip[15]~feeder_combout\);

-- Location: FF_X9_Y18_N21
\rx_dest_ip[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[15]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(15));

-- Location: LCCOMB_X9_Y18_N30
\rx_dest_ip[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[23]~feeder_combout\ = rx_dest_ip(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_ip(15),
	combout => \rx_dest_ip[23]~feeder_combout\);

-- Location: FF_X9_Y18_N31
\rx_dest_ip[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[23]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(23));

-- Location: LCCOMB_X10_Y18_N12
\ip_valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ip_valid~0_combout\ = (!\in_data[7]~input_o\ & (\in_data[0]~input_o\ & (rx_dest_ip(22) & rx_dest_ip(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in_data[7]~input_o\,
	datab => \in_data[0]~input_o\,
	datac => rx_dest_ip(22),
	datad => rx_dest_ip(23),
	combout => \ip_valid~0_combout\);

-- Location: LCCOMB_X9_Y18_N28
\rx_dest_ip[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[13]~feeder_combout\ = rx_dest_ip(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => rx_dest_ip(5),
	combout => \rx_dest_ip[13]~feeder_combout\);

-- Location: FF_X9_Y18_N29
\rx_dest_ip[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[13]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(13));

-- Location: LCCOMB_X9_Y18_N12
\rx_dest_ip[21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[21]~feeder_combout\ = rx_dest_ip(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_ip(13),
	combout => \rx_dest_ip[21]~feeder_combout\);

-- Location: FF_X9_Y18_N13
\rx_dest_ip[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[21]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(21));

-- Location: LCCOMB_X9_Y18_N22
\rx_dest_ip[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[12]~feeder_combout\ = rx_dest_ip(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => rx_dest_ip(4),
	combout => \rx_dest_ip[12]~feeder_combout\);

-- Location: FF_X9_Y18_N23
\rx_dest_ip[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[12]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(12));

-- Location: FF_X9_Y18_N17
\rx_dest_ip[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_ip(12),
	sload => VCC,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(20));

-- Location: LCCOMB_X9_Y18_N8
\rx_dest_ip[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[10]~feeder_combout\ = rx_dest_ip(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_ip(2),
	combout => \rx_dest_ip[10]~feeder_combout\);

-- Location: FF_X9_Y18_N9
\rx_dest_ip[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[10]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(10));

-- Location: FF_X9_Y18_N7
\rx_dest_ip[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_ip(10),
	sload => VCC,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(18));

-- Location: LCCOMB_X9_Y18_N26
\rx_dest_ip[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[11]~feeder_combout\ = rx_dest_ip(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_ip(3),
	combout => \rx_dest_ip[11]~feeder_combout\);

-- Location: FF_X9_Y18_N27
\rx_dest_ip[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[11]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(11));

-- Location: FF_X9_Y18_N1
\rx_dest_ip[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_ip(11),
	sload => VCC,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(19));

-- Location: LCCOMB_X9_Y18_N6
\ip_valid~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ip_valid~1_combout\ = (!rx_dest_ip(21) & (!rx_dest_ip(20) & (!rx_dest_ip(18) & !rx_dest_ip(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_ip(21),
	datab => rx_dest_ip(20),
	datac => rx_dest_ip(18),
	datad => rx_dest_ip(19),
	combout => \ip_valid~1_combout\);

-- Location: LCCOMB_X9_Y18_N16
\ip_valid~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ip_valid~3_combout\ = (rx_dest_ip(11) & (!rx_dest_ip(10) & (!rx_dest_ip(12) & rx_dest_ip(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_ip(11),
	datab => rx_dest_ip(10),
	datac => rx_dest_ip(12),
	datad => rx_dest_ip(13),
	combout => \ip_valid~3_combout\);

-- Location: LCCOMB_X9_Y18_N24
\rx_dest_ip[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_ip[16]~feeder_combout\ = rx_dest_ip(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_ip(8),
	combout => \rx_dest_ip[16]~feeder_combout\);

-- Location: FF_X9_Y18_N25
\rx_dest_ip[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_ip[16]~feeder_combout\,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(16));

-- Location: FF_X9_Y18_N3
\rx_dest_ip[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_ip(9),
	sload => VCC,
	ena => \rx_dest_ip[23]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_ip(17));

-- Location: LCCOMB_X9_Y18_N2
\ip_valid~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ip_valid~2_combout\ = (!rx_dest_ip(14) & (!rx_dest_ip(16) & (!rx_dest_ip(17) & rx_dest_ip(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_ip(14),
	datab => rx_dest_ip(16),
	datac => rx_dest_ip(17),
	datad => rx_dest_ip(15),
	combout => \ip_valid~2_combout\);

-- Location: LCCOMB_X10_Y18_N14
\ip_valid~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ip_valid~4_combout\ = (\ip_valid~0_combout\ & (\ip_valid~1_combout\ & (\ip_valid~3_combout\ & \ip_valid~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ip_valid~0_combout\,
	datab => \ip_valid~1_combout\,
	datac => \ip_valid~3_combout\,
	datad => \ip_valid~2_combout\,
	combout => \ip_valid~4_combout\);

-- Location: LCCOMB_X10_Y18_N20
\ip_valid~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ip_valid~7_combout\ = (!rx_cnt(2) & (rx_dest_ip(0) & (!\in_data[4]~input_o\ & !rx_dest_ip(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(2),
	datab => rx_dest_ip(0),
	datac => \in_data[4]~input_o\,
	datad => rx_dest_ip(1),
	combout => \ip_valid~7_combout\);

-- Location: LCCOMB_X10_Y18_N26
\ip_valid~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ip_valid~8_combout\ = (\ip_valid~6_combout\ & (\ip_valid~5_combout\ & (\ip_valid~4_combout\ & \ip_valid~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ip_valid~6_combout\,
	datab => \ip_valid~5_combout\,
	datac => \ip_valid~4_combout\,
	datad => \ip_valid~7_combout\,
	combout => \ip_valid~8_combout\);

-- Location: LCCOMB_X11_Y17_N20
\ip_valid~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ip_valid~9_combout\ = (\ip_valid~8_combout\ & ((\port_valid~3_combout\) # ((\mac_valid~16_combout\ & \ip_valid~q\)))) # (!\ip_valid~8_combout\ & (\mac_valid~16_combout\ & (\ip_valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ip_valid~8_combout\,
	datab => \mac_valid~16_combout\,
	datac => \ip_valid~q\,
	datad => \port_valid~3_combout\,
	combout => \ip_valid~9_combout\);

-- Location: FF_X11_Y17_N21
ip_valid : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ip_valid~9_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \state.LISTEN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ip_valid~q\);

-- Location: LCCOMB_X13_Y18_N28
\mac_valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~0_combout\ = (rx_cnt(2) & (!\in_data[7]~input_o\ & (\in_data[0]~input_o\ & \in_data[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(2),
	datab => \in_data[7]~input_o\,
	datac => \in_data[0]~input_o\,
	datad => \in_data[4]~input_o\,
	combout => \mac_valid~0_combout\);

-- Location: LCCOMB_X12_Y18_N8
\rx_dest_mac[39]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[39]~0_combout\ = (rx_cnt(3) & (((!rx_cnt(0) & !rx_cnt(1))) # (!rx_cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(0),
	datab => rx_cnt(2),
	datac => rx_cnt(1),
	datad => rx_cnt(3),
	combout => \rx_dest_mac[39]~0_combout\);

-- Location: LCCOMB_X12_Y18_N10
\rx_dest_port[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_port[15]~0_combout\ = (!\reset~input_o\ & (\port_valid~0_combout\ & \state.LISTEN~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \port_valid~0_combout\,
	datad => \state.LISTEN~q\,
	combout => \rx_dest_port[15]~0_combout\);

-- Location: LCCOMB_X12_Y18_N30
\rx_dest_mac[39]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[39]~1_combout\ = (!rx_cnt(5) & (\rx_dest_mac[39]~0_combout\ & \rx_dest_port[15]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rx_cnt(5),
	datac => \rx_dest_mac[39]~0_combout\,
	datad => \rx_dest_port[15]~0_combout\,
	combout => \rx_dest_mac[39]~1_combout\);

-- Location: FF_X12_Y16_N23
\rx_dest_mac[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[0]~input_o\,
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(0));

-- Location: FF_X12_Y16_N5
\rx_dest_mac[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_mac(0),
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(8));

-- Location: LCCOMB_X12_Y17_N26
\rx_dest_mac[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[16]~feeder_combout\ = rx_dest_mac(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(8),
	combout => \rx_dest_mac[16]~feeder_combout\);

-- Location: FF_X12_Y17_N27
\rx_dest_mac[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[16]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(16));

-- Location: FF_X12_Y17_N23
\rx_dest_mac[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_mac(16),
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(24));

-- Location: LCCOMB_X12_Y16_N20
\rx_dest_mac[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[1]~feeder_combout\ = \in_data[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[1]~input_o\,
	combout => \rx_dest_mac[1]~feeder_combout\);

-- Location: FF_X12_Y16_N21
\rx_dest_mac[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[1]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(1));

-- Location: LCCOMB_X12_Y16_N2
\rx_dest_mac[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[9]~feeder_combout\ = rx_dest_mac(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(1),
	combout => \rx_dest_mac[9]~feeder_combout\);

-- Location: FF_X12_Y16_N3
\rx_dest_mac[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[9]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(9));

-- Location: LCCOMB_X13_Y17_N22
\rx_dest_mac[17]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[17]~feeder_combout\ = rx_dest_mac(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(9),
	combout => \rx_dest_mac[17]~feeder_combout\);

-- Location: FF_X13_Y17_N23
\rx_dest_mac[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[17]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(17));

-- Location: LCCOMB_X12_Y17_N4
\rx_dest_mac[25]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[25]~feeder_combout\ = rx_dest_mac(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(17),
	combout => \rx_dest_mac[25]~feeder_combout\);

-- Location: FF_X12_Y17_N5
\rx_dest_mac[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[25]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(25));

-- Location: FF_X12_Y16_N25
\rx_dest_mac[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[2]~input_o\,
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(2));

-- Location: LCCOMB_X12_Y16_N8
\rx_dest_mac[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[10]~feeder_combout\ = rx_dest_mac(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(2),
	combout => \rx_dest_mac[10]~feeder_combout\);

-- Location: FF_X12_Y16_N9
\rx_dest_mac[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[10]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(10));

-- Location: LCCOMB_X12_Y17_N0
\rx_dest_mac[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[18]~feeder_combout\ = rx_dest_mac(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => rx_dest_mac(10),
	combout => \rx_dest_mac[18]~feeder_combout\);

-- Location: FF_X12_Y17_N1
\rx_dest_mac[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[18]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(18));

-- Location: LCCOMB_X12_Y16_N0
\rx_dest_mac[26]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[26]~feeder_combout\ = rx_dest_mac(18)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(18),
	combout => \rx_dest_mac[26]~feeder_combout\);

-- Location: FF_X12_Y16_N1
\rx_dest_mac[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[26]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(26));

-- Location: LCCOMB_X12_Y16_N18
\rx_dest_mac[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[3]~feeder_combout\ = \in_data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[3]~input_o\,
	combout => \rx_dest_mac[3]~feeder_combout\);

-- Location: FF_X12_Y16_N19
\rx_dest_mac[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[3]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(3));

-- Location: LCCOMB_X12_Y16_N6
\rx_dest_mac[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[11]~feeder_combout\ = rx_dest_mac(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(3),
	combout => \rx_dest_mac[11]~feeder_combout\);

-- Location: FF_X12_Y16_N7
\rx_dest_mac[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[11]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(11));

-- Location: LCCOMB_X12_Y17_N6
\rx_dest_mac[19]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[19]~feeder_combout\ = rx_dest_mac(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(11),
	combout => \rx_dest_mac[19]~feeder_combout\);

-- Location: FF_X12_Y17_N7
\rx_dest_mac[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[19]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(19));

-- Location: LCCOMB_X12_Y17_N2
\rx_dest_mac[27]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[27]~feeder_combout\ = rx_dest_mac(19)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(19),
	combout => \rx_dest_mac[27]~feeder_combout\);

-- Location: FF_X12_Y17_N3
\rx_dest_mac[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[27]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(27));

-- Location: LCCOMB_X12_Y17_N30
\mac_valid~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~4_combout\ = (rx_dest_mac(24) & (!rx_dest_mac(25) & (!rx_dest_mac(26) & !rx_dest_mac(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_mac(24),
	datab => rx_dest_mac(25),
	datac => rx_dest_mac(26),
	datad => rx_dest_mac(27),
	combout => \mac_valid~4_combout\);

-- Location: LCCOMB_X12_Y17_N12
\rx_dest_mac[35]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[35]~feeder_combout\ = rx_dest_mac(27)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(27),
	combout => \rx_dest_mac[35]~feeder_combout\);

-- Location: FF_X12_Y17_N13
\rx_dest_mac[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[35]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(35));

-- Location: FF_X12_Y17_N9
\rx_dest_mac[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_mac(25),
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(33));

-- Location: FF_X12_Y17_N21
\rx_dest_mac[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_mac(24),
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(32));

-- Location: FF_X12_Y17_N31
\rx_dest_mac[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_mac(26),
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(34));

-- Location: LCCOMB_X12_Y17_N20
\mac_valid~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~2_combout\ = (!rx_dest_mac(35) & (!rx_dest_mac(33) & (!rx_dest_mac(32) & !rx_dest_mac(34))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_mac(35),
	datab => rx_dest_mac(33),
	datac => rx_dest_mac(32),
	datad => rx_dest_mac(34),
	combout => \mac_valid~2_combout\);

-- Location: FF_X11_Y18_N13
\rx_dest_mac[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[6]~input_o\,
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(6));

-- Location: LCCOMB_X13_Y17_N28
\rx_dest_mac[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[14]~feeder_combout\ = rx_dest_mac(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(6),
	combout => \rx_dest_mac[14]~feeder_combout\);

-- Location: FF_X13_Y17_N29
\rx_dest_mac[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[14]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(14));

-- Location: LCCOMB_X13_Y17_N20
\rx_dest_mac[22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[22]~feeder_combout\ = rx_dest_mac(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(14),
	combout => \rx_dest_mac[22]~feeder_combout\);

-- Location: FF_X13_Y17_N21
\rx_dest_mac[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[22]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(22));

-- Location: LCCOMB_X13_Y17_N12
\rx_dest_mac[30]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[30]~feeder_combout\ = rx_dest_mac(22)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(22),
	combout => \rx_dest_mac[30]~feeder_combout\);

-- Location: FF_X13_Y17_N13
\rx_dest_mac[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[30]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(30));

-- Location: LCCOMB_X11_Y18_N30
\rx_dest_mac[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[4]~feeder_combout\ = \in_data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[4]~input_o\,
	combout => \rx_dest_mac[4]~feeder_combout\);

-- Location: FF_X11_Y18_N31
\rx_dest_mac[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[4]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(4));

-- Location: LCCOMB_X13_Y17_N10
\rx_dest_mac[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[12]~feeder_combout\ = rx_dest_mac(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(4),
	combout => \rx_dest_mac[12]~feeder_combout\);

-- Location: FF_X13_Y17_N11
\rx_dest_mac[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[12]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(12));

-- Location: LCCOMB_X13_Y17_N8
\rx_dest_mac[20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[20]~feeder_combout\ = rx_dest_mac(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(12),
	combout => \rx_dest_mac[20]~feeder_combout\);

-- Location: FF_X13_Y17_N9
\rx_dest_mac[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[20]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(20));

-- Location: FF_X13_Y17_N5
\rx_dest_mac[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_mac(20),
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(28));

-- Location: FF_X12_Y17_N29
\rx_dest_mac[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[5]~input_o\,
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(5));

-- Location: FF_X13_Y17_N27
\rx_dest_mac[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_mac(5),
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(13));

-- Location: FF_X13_Y17_N1
\rx_dest_mac[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_mac(13),
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(21));

-- Location: LCCOMB_X13_Y17_N14
\rx_dest_mac[29]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[29]~feeder_combout\ = rx_dest_mac(21)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(21),
	combout => \rx_dest_mac[29]~feeder_combout\);

-- Location: FF_X13_Y17_N15
\rx_dest_mac[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[29]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(29));

-- Location: LCCOMB_X11_Y17_N4
\rx_dest_mac[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[7]~feeder_combout\ = \in_data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[7]~input_o\,
	combout => \rx_dest_mac[7]~feeder_combout\);

-- Location: FF_X11_Y17_N5
\rx_dest_mac[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[7]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(7));

-- Location: LCCOMB_X13_Y17_N24
\rx_dest_mac[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[15]~feeder_combout\ = rx_dest_mac(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(7),
	combout => \rx_dest_mac[15]~feeder_combout\);

-- Location: FF_X13_Y17_N25
\rx_dest_mac[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[15]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(15));

-- Location: LCCOMB_X13_Y17_N6
\rx_dest_mac[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[23]~feeder_combout\ = rx_dest_mac(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(15),
	combout => \rx_dest_mac[23]~feeder_combout\);

-- Location: FF_X13_Y17_N7
\rx_dest_mac[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[23]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(23));

-- Location: LCCOMB_X13_Y17_N16
\rx_dest_mac[31]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[31]~feeder_combout\ = rx_dest_mac(23)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(23),
	combout => \rx_dest_mac[31]~feeder_combout\);

-- Location: FF_X13_Y17_N17
\rx_dest_mac[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[31]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(31));

-- Location: LCCOMB_X13_Y17_N2
\mac_valid~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~3_combout\ = (!rx_dest_mac(30) & (rx_dest_mac(28) & (!rx_dest_mac(29) & !rx_dest_mac(31))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_mac(30),
	datab => rx_dest_mac(28),
	datac => rx_dest_mac(29),
	datad => rx_dest_mac(31),
	combout => \mac_valid~3_combout\);

-- Location: LCCOMB_X13_Y17_N30
\rx_dest_mac[39]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[39]~feeder_combout\ = rx_dest_mac(31)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(31),
	combout => \rx_dest_mac[39]~feeder_combout\);

-- Location: FF_X13_Y17_N31
\rx_dest_mac[39]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[39]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(39));

-- Location: LCCOMB_X13_Y17_N18
\rx_dest_mac[38]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_dest_mac[38]~feeder_combout\ = rx_dest_mac(30)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rx_dest_mac(30),
	combout => \rx_dest_mac[38]~feeder_combout\);

-- Location: FF_X13_Y17_N19
\rx_dest_mac[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_dest_mac[38]~feeder_combout\,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(38));

-- Location: FF_X12_Y17_N11
\rx_dest_mac[36]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_mac(28),
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(36));

-- Location: FF_X13_Y17_N3
\rx_dest_mac[37]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => rx_dest_mac(29),
	sload => VCC,
	ena => \rx_dest_mac[39]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_dest_mac(37));

-- Location: LCCOMB_X12_Y17_N10
\mac_valid~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~1_combout\ = (!rx_dest_mac(39) & (!rx_dest_mac(38) & (!rx_dest_mac(36) & !rx_dest_mac(37))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_mac(39),
	datab => rx_dest_mac(38),
	datac => rx_dest_mac(36),
	datad => rx_dest_mac(37),
	combout => \mac_valid~1_combout\);

-- Location: LCCOMB_X12_Y17_N18
\mac_valid~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~5_combout\ = (\mac_valid~4_combout\ & (\mac_valid~2_combout\ & (\mac_valid~3_combout\ & \mac_valid~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mac_valid~4_combout\,
	datab => \mac_valid~2_combout\,
	datac => \mac_valid~3_combout\,
	datad => \mac_valid~1_combout\,
	combout => \mac_valid~5_combout\);

-- Location: LCCOMB_X12_Y17_N8
\mac_valid~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~6_combout\ = (\mac_valid~0_combout\ & (\port_valid~2_combout\ & \mac_valid~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mac_valid~0_combout\,
	datab => \port_valid~2_combout\,
	datad => \mac_valid~5_combout\,
	combout => \mac_valid~6_combout\);

-- Location: LCCOMB_X11_Y17_N30
\mac_valid~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~12_combout\ = (!rx_dest_mac(7) & (!rx_dest_mac(5) & (!rx_dest_mac(4) & rx_dest_mac(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_mac(7),
	datab => rx_dest_mac(5),
	datac => rx_dest_mac(4),
	datad => rx_dest_mac(6),
	combout => \mac_valid~12_combout\);

-- Location: LCCOMB_X11_Y17_N28
\mac_valid~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~14_combout\ = (\in_data[2]~input_o\ & (\in_data[6]~input_o\ & !rx_cnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in_data[2]~input_o\,
	datab => \in_data[6]~input_o\,
	datac => rx_cnt(5),
	combout => \mac_valid~14_combout\);

-- Location: LCCOMB_X12_Y16_N24
\mac_valid~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~13_combout\ = (!rx_dest_mac(0) & (!rx_dest_mac(1) & (rx_dest_mac(2) & !rx_dest_mac(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_mac(0),
	datab => rx_dest_mac(1),
	datac => rx_dest_mac(2),
	datad => rx_dest_mac(3),
	combout => \mac_valid~13_combout\);

-- Location: LCCOMB_X12_Y16_N10
\mac_valid~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~10_combout\ = (!rx_dest_mac(11) & (!rx_dest_mac(10) & (rx_dest_mac(8) & rx_dest_mac(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_mac(11),
	datab => rx_dest_mac(10),
	datac => rx_dest_mac(8),
	datad => rx_dest_mac(9),
	combout => \mac_valid~10_combout\);

-- Location: LCCOMB_X13_Y17_N4
\mac_valid~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~7_combout\ = (!rx_dest_mac(23) & (!rx_dest_mac(22) & (!rx_dest_mac(20) & rx_dest_mac(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_mac(23),
	datab => rx_dest_mac(22),
	datac => rx_dest_mac(20),
	datad => rx_dest_mac(21),
	combout => \mac_valid~7_combout\);

-- Location: LCCOMB_X13_Y17_N0
\mac_valid~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~9_combout\ = (rx_dest_mac(12) & (!rx_dest_mac(15) & (rx_dest_mac(13) & !rx_dest_mac(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_mac(12),
	datab => rx_dest_mac(15),
	datac => rx_dest_mac(13),
	datad => rx_dest_mac(14),
	combout => \mac_valid~9_combout\);

-- Location: LCCOMB_X12_Y17_N22
\mac_valid~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~8_combout\ = (!rx_dest_mac(19) & (!rx_dest_mac(18) & (!rx_dest_mac(16) & rx_dest_mac(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_dest_mac(19),
	datab => rx_dest_mac(18),
	datac => rx_dest_mac(16),
	datad => rx_dest_mac(17),
	combout => \mac_valid~8_combout\);

-- Location: LCCOMB_X11_Y17_N18
\mac_valid~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~11_combout\ = (\mac_valid~10_combout\ & (\mac_valid~7_combout\ & (\mac_valid~9_combout\ & \mac_valid~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mac_valid~10_combout\,
	datab => \mac_valid~7_combout\,
	datac => \mac_valid~9_combout\,
	datad => \mac_valid~8_combout\,
	combout => \mac_valid~11_combout\);

-- Location: LCCOMB_X11_Y17_N14
\mac_valid~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~15_combout\ = (\mac_valid~12_combout\ & (\mac_valid~14_combout\ & (\mac_valid~13_combout\ & \mac_valid~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mac_valid~12_combout\,
	datab => \mac_valid~14_combout\,
	datac => \mac_valid~13_combout\,
	datad => \mac_valid~11_combout\,
	combout => \mac_valid~15_combout\);

-- Location: LCCOMB_X12_Y17_N16
\mac_valid~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \mac_valid~17_combout\ = (\mac_valid~16_combout\ & ((\mac_valid~q\) # ((\mac_valid~6_combout\ & \mac_valid~15_combout\)))) # (!\mac_valid~16_combout\ & (\mac_valid~6_combout\ & ((\mac_valid~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mac_valid~16_combout\,
	datab => \mac_valid~6_combout\,
	datac => \mac_valid~q\,
	datad => \mac_valid~15_combout\,
	combout => \mac_valid~17_combout\);

-- Location: FF_X12_Y17_N17
mac_valid : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \mac_valid~17_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \state.LISTEN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mac_valid~q\);

-- Location: LCCOMB_X11_Y17_N0
\syn_received~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \syn_received~2_combout\ = (\port_valid~q\ & (\ip_valid~q\ & (\in_data[1]~input_o\ & \mac_valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \port_valid~q\,
	datab => \ip_valid~q\,
	datac => \in_data[1]~input_o\,
	datad => \mac_valid~q\,
	combout => \syn_received~2_combout\);

-- Location: LCCOMB_X11_Y18_N24
\syn_received~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \syn_received~3_combout\ = (\syn_received~q\) # ((\state.LISTEN~q\ & (\syn_received~2_combout\ & \syn_received~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.LISTEN~q\,
	datab => \syn_received~2_combout\,
	datac => \syn_received~q\,
	datad => \syn_received~1_combout\,
	combout => \syn_received~3_combout\);

-- Location: FF_X11_Y18_N25
syn_received : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \syn_received~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \syn_received~q\);

-- Location: LCCOMB_X11_Y18_N18
\rx_cnt[7]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_cnt[7]~12_combout\ = ((\state.LISTEN~q\ & (\in_eop~input_o\ & !\syn_received~q\))) # (!\in_valid~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.LISTEN~q\,
	datab => \in_valid~input_o\,
	datac => \in_eop~input_o\,
	datad => \syn_received~q\,
	combout => \rx_cnt[7]~12_combout\);

-- Location: FF_X12_Y18_N13
\rx_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_cnt[0]~8_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \rx_cnt[7]~12_combout\,
	ena => \rx_cnt[7]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_cnt(0));

-- Location: FF_X12_Y18_N15
\rx_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rx_cnt[1]~10_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \rx_cnt[7]~12_combout\,
	ena => \rx_cnt[7]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_cnt(1));

-- Location: LCCOMB_X12_Y19_N30
\syn_received~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \syn_received~0_combout\ = (rx_cnt(2) & (rx_cnt(5) & (rx_cnt(4) & !rx_cnt(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(2),
	datab => rx_cnt(5),
	datac => rx_cnt(4),
	datad => rx_cnt(3),
	combout => \syn_received~0_combout\);

-- Location: LCCOMB_X13_Y18_N2
\c_mac[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[0]~1_combout\ = (!rx_cnt(7) & (\in_valid~input_o\ & !rx_cnt(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(7),
	datab => \in_valid~input_o\,
	datad => rx_cnt(6),
	combout => \c_mac[0]~1_combout\);

-- Location: LCCOMB_X12_Y19_N20
\syn_received~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \syn_received~1_combout\ = (rx_cnt(1) & (rx_cnt(0) & (\syn_received~0_combout\ & \c_mac[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(1),
	datab => rx_cnt(0),
	datac => \syn_received~0_combout\,
	datad => \c_mac[0]~1_combout\,
	combout => \syn_received~1_combout\);

-- Location: LCCOMB_X12_Y19_N0
\next_state.ESTABLISHED~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.ESTABLISHED~0_combout\ = (\next_state.ESTABLISHED~q\) # ((\state.WAIT_ACK~q\ & (\in_data[4]~input_o\ & \syn_received~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.WAIT_ACK~q\,
	datab => \in_data[4]~input_o\,
	datac => \next_state.ESTABLISHED~q\,
	datad => \syn_received~1_combout\,
	combout => \next_state.ESTABLISHED~0_combout\);

-- Location: FF_X12_Y19_N1
\next_state.ESTABLISHED\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \next_state.ESTABLISHED~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.ESTABLISHED~q\);

-- Location: LCCOMB_X11_Y18_N14
\Selector1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~3_combout\ = (!\state.ESTABLISHED~q\ & (\state.CLOSED~q\ & !\state.WAIT_ACK~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.ESTABLISHED~q\,
	datac => \state.CLOSED~q\,
	datad => \state.WAIT_ACK~q\,
	combout => \Selector1~3_combout\);

-- Location: LCCOMB_X11_Y18_N10
\Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (!\state.WAIT_ACK~q\ & (((\syn_received~q\ & !\state.SYN_RCVD~q\)) # (!\state.CLOSED~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.CLOSED~q\,
	datab => \syn_received~q\,
	datac => \state.SYN_RCVD~q\,
	datad => \state.WAIT_ACK~q\,
	combout => \Selector1~1_combout\);

-- Location: LCCOMB_X11_Y18_N4
\Selector1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (!\state.ESTABLISHED~q\ & (\in_valid~input_o\ & (\in_eop~input_o\ & \Selector1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.ESTABLISHED~q\,
	datab => \in_valid~input_o\,
	datac => \in_eop~input_o\,
	datad => \Selector1~1_combout\,
	combout => \Selector1~2_combout\);

-- Location: LCCOMB_X11_Y18_N20
\Selector1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~4_combout\ = (\Selector1~2_combout\) # ((\Equal10~1_combout\ & (\Selector1~3_combout\ & \tx_byte[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal10~1_combout\,
	datab => \Selector1~3_combout\,
	datac => \Selector1~2_combout\,
	datad => \tx_byte[1]~1_combout\,
	combout => \Selector1~4_combout\);

-- Location: LCCOMB_X11_Y18_N8
\Selector1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~5_combout\ = (\Selector1~0_combout\ & (\next_state.ESTABLISHED~q\)) # (!\Selector1~0_combout\ & (((\state.CLOSED~q\) # (\Selector1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~0_combout\,
	datab => \next_state.ESTABLISHED~q\,
	datac => \state.CLOSED~q\,
	datad => \Selector1~4_combout\,
	combout => \Selector1~5_combout\);

-- Location: FF_X11_Y18_N9
\state.CLOSED\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector1~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.CLOSED~q\);

-- Location: LCCOMB_X10_Y19_N14
\process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (\in_eop~input_o\ & \in_valid~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in_eop~input_o\,
	datac => \in_valid~input_o\,
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X11_Y18_N6
\Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\process_0~0_combout\ & (((\state.LISTEN~q\ & !\syn_received~q\)) # (!\state.CLOSED~q\))) # (!\process_0~0_combout\ & (((\state.LISTEN~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.CLOSED~q\,
	datab => \process_0~0_combout\,
	datac => \state.LISTEN~q\,
	datad => \syn_received~q\,
	combout => \Selector2~0_combout\);

-- Location: FF_X11_Y18_N7
\state.LISTEN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector2~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.LISTEN~q\);

-- Location: LCCOMB_X11_Y18_N22
\Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (\state.LISTEN~q\ & (\in_valid~input_o\ & (\in_eop~input_o\ & \syn_received~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.LISTEN~q\,
	datab => \in_valid~input_o\,
	datac => \in_eop~input_o\,
	datad => \syn_received~q\,
	combout => \Selector14~0_combout\);

-- Location: LCCOMB_X11_Y19_N4
\Selector14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~1_combout\ = (\tx_active~q\ & (((!\out_ready~input_o\)) # (!\state.SYN_RCVD~q\))) # (!\tx_active~q\ & (!\state.SYN_RCVD~q\ & ((\Selector14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_active~q\,
	datab => \state.SYN_RCVD~q\,
	datac => \out_ready~input_o\,
	datad => \Selector14~0_combout\,
	combout => \Selector14~1_combout\);

-- Location: LCCOMB_X10_Y19_N12
\Selector14~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~2_combout\ = (\Selector14~1_combout\) # ((!\Equal10~1_combout\ & \tx_active~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal10~1_combout\,
	datac => \tx_active~q\,
	datad => \Selector14~1_combout\,
	combout => \Selector14~2_combout\);

-- Location: FF_X10_Y19_N13
tx_active : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector14~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_active~q\);

-- Location: LCCOMB_X11_Y19_N24
\tx_byte[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_byte[1]~1_combout\ = (\state.SYN_RCVD~q\ & (\out_ready~input_o\ & \tx_active~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.SYN_RCVD~q\,
	datac => \out_ready~input_o\,
	datad => \tx_active~q\,
	combout => \tx_byte[1]~1_combout\);

-- Location: LCCOMB_X11_Y19_N26
\Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\state.SYN_RCVD~q\ & (((!\state.WAIT_ACK~q\ & \state.CLOSED~q\)) # (!\process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \state.WAIT_ACK~q\,
	datac => \state.CLOSED~q\,
	datad => \state.SYN_RCVD~q\,
	combout => \Selector3~1_combout\);

-- Location: LCCOMB_X11_Y19_N28
\Selector3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\Equal10~1_combout\ & (!\tx_byte[1]~1_combout\ & ((\Selector3~1_combout\) # (\Selector14~0_combout\)))) # (!\Equal10~1_combout\ & (((\Selector3~1_combout\) # (\Selector14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal10~1_combout\,
	datab => \tx_byte[1]~1_combout\,
	datac => \Selector3~1_combout\,
	datad => \Selector14~0_combout\,
	combout => \Selector3~2_combout\);

-- Location: FF_X11_Y19_N29
\state.SYN_RCVD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector3~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.SYN_RCVD~q\);

-- Location: LCCOMB_X11_Y19_N8
\tx_pos[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_pos[1]~9_combout\ = (tx_pos(1) & (!\tx_pos[0]~8\)) # (!tx_pos(1) & ((\tx_pos[0]~8\) # (GND)))
-- \tx_pos[1]~10\ = CARRY((!\tx_pos[0]~8\) # (!tx_pos(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_pos(1),
	datad => VCC,
	cin => \tx_pos[0]~8\,
	combout => \tx_pos[1]~9_combout\,
	cout => \tx_pos[1]~10\);

-- Location: FF_X11_Y19_N9
\tx_pos[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \tx_pos[1]~9_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_state.SYN_RCVD~q\,
	ena => \tx_pos[6]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_pos(1));

-- Location: LCCOMB_X11_Y19_N10
\tx_pos[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_pos[2]~14_combout\ = (tx_pos(2) & (\tx_pos[1]~10\ $ (GND))) # (!tx_pos(2) & (!\tx_pos[1]~10\ & VCC))
-- \tx_pos[2]~15\ = CARRY((tx_pos(2) & !\tx_pos[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_pos(2),
	datad => VCC,
	cin => \tx_pos[1]~10\,
	combout => \tx_pos[2]~14_combout\,
	cout => \tx_pos[2]~15\);

-- Location: FF_X11_Y19_N11
\tx_pos[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \tx_pos[2]~14_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_state.SYN_RCVD~q\,
	ena => \tx_pos[6]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_pos(2));

-- Location: LCCOMB_X11_Y19_N12
\tx_pos[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_pos[3]~16_combout\ = (tx_pos(3) & (!\tx_pos[2]~15\)) # (!tx_pos(3) & ((\tx_pos[2]~15\) # (GND)))
-- \tx_pos[3]~17\ = CARRY((!\tx_pos[2]~15\) # (!tx_pos(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => tx_pos(3),
	datad => VCC,
	cin => \tx_pos[2]~15\,
	combout => \tx_pos[3]~16_combout\,
	cout => \tx_pos[3]~17\);

-- Location: FF_X11_Y19_N13
\tx_pos[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \tx_pos[3]~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_state.SYN_RCVD~q\,
	ena => \tx_pos[6]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_pos(3));

-- Location: LCCOMB_X11_Y19_N14
\tx_pos[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_pos[4]~18_combout\ = (tx_pos(4) & (\tx_pos[3]~17\ $ (GND))) # (!tx_pos(4) & (!\tx_pos[3]~17\ & VCC))
-- \tx_pos[4]~19\ = CARRY((tx_pos(4) & !\tx_pos[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_pos(4),
	datad => VCC,
	cin => \tx_pos[3]~17\,
	combout => \tx_pos[4]~18_combout\,
	cout => \tx_pos[4]~19\);

-- Location: FF_X11_Y19_N15
\tx_pos[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \tx_pos[4]~18_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_state.SYN_RCVD~q\,
	ena => \tx_pos[6]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_pos(4));

-- Location: LCCOMB_X11_Y19_N16
\tx_pos[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_pos[5]~20_combout\ = (tx_pos(5) & (!\tx_pos[4]~19\)) # (!tx_pos(5) & ((\tx_pos[4]~19\) # (GND)))
-- \tx_pos[5]~21\ = CARRY((!\tx_pos[4]~19\) # (!tx_pos(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => tx_pos(5),
	datad => VCC,
	cin => \tx_pos[4]~19\,
	combout => \tx_pos[5]~20_combout\,
	cout => \tx_pos[5]~21\);

-- Location: FF_X11_Y19_N17
\tx_pos[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \tx_pos[5]~20_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_state.SYN_RCVD~q\,
	ena => \tx_pos[6]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_pos(5));

-- Location: LCCOMB_X11_Y19_N18
\tx_pos[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_pos[6]~22_combout\ = \tx_pos[5]~21\ $ (!tx_pos(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => tx_pos(6),
	cin => \tx_pos[5]~21\,
	combout => \tx_pos[6]~22_combout\);

-- Location: FF_X11_Y19_N19
\tx_pos[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \tx_pos[6]~22_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_state.SYN_RCVD~q\,
	ena => \tx_pos[6]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_pos(6));

-- Location: LCCOMB_X11_Y19_N22
\tx_pos[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_pos[6]~12_combout\ = (tx_pos(0) & (!tx_pos(5) & tx_pos(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_pos(0),
	datab => tx_pos(5),
	datad => tx_pos(6),
	combout => \tx_pos[6]~12_combout\);

-- Location: LCCOMB_X11_Y19_N20
\Equal10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal10~0_combout\ = (!tx_pos(3) & (!tx_pos(1) & (!tx_pos(4) & !tx_pos(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_pos(3),
	datab => tx_pos(1),
	datac => tx_pos(4),
	datad => tx_pos(2),
	combout => \Equal10~0_combout\);

-- Location: LCCOMB_X11_Y18_N0
\tx_pos[6]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_pos[6]~11_combout\ = (((!\syn_received~q\) # (!\in_eop~input_o\)) # (!\in_valid~input_o\)) # (!\state.LISTEN~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.LISTEN~q\,
	datab => \in_valid~input_o\,
	datac => \in_eop~input_o\,
	datad => \syn_received~q\,
	combout => \tx_pos[6]~11_combout\);

-- Location: LCCOMB_X11_Y19_N0
\tx_pos[6]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_pos[6]~13_combout\ = ((\tx_byte[1]~1_combout\ & ((!\Equal10~0_combout\) # (!\tx_pos[6]~12_combout\)))) # (!\tx_pos[6]~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_pos[6]~12_combout\,
	datab => \Equal10~0_combout\,
	datac => \tx_byte[1]~1_combout\,
	datad => \tx_pos[6]~11_combout\,
	combout => \tx_pos[6]~13_combout\);

-- Location: FF_X11_Y19_N7
\tx_pos[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \tx_pos[0]~7_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_state.SYN_RCVD~q\,
	ena => \tx_pos[6]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_pos(0));

-- Location: LCCOMB_X11_Y19_N30
\Equal10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal10~1_combout\ = (tx_pos(0) & (tx_pos(6) & (!tx_pos(5) & \Equal10~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_pos(0),
	datab => tx_pos(6),
	datac => tx_pos(5),
	datad => \Equal10~0_combout\,
	combout => \Equal10~1_combout\);

-- Location: LCCOMB_X11_Y18_N2
\Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\Equal10~1_combout\ & ((\tx_byte[1]~1_combout\) # ((!\process_0~0_combout\ & \state.WAIT_ACK~q\)))) # (!\Equal10~1_combout\ & (!\process_0~0_combout\ & (\state.WAIT_ACK~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal10~1_combout\,
	datab => \process_0~0_combout\,
	datac => \state.WAIT_ACK~q\,
	datad => \tx_byte[1]~1_combout\,
	combout => \Selector4~0_combout\);

-- Location: FF_X11_Y18_N3
\state.WAIT_ACK\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector4~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.WAIT_ACK~q\);

-- Location: LCCOMB_X11_Y18_N12
\Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\in_eop~input_o\ & (\in_valid~input_o\ & \state.WAIT_ACK~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in_eop~input_o\,
	datab => \in_valid~input_o\,
	datad => \state.WAIT_ACK~q\,
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X11_Y18_N26
\state.ESTABLISHED~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.ESTABLISHED~0_combout\ = (\Selector1~0_combout\ & (\next_state.ESTABLISHED~q\)) # (!\Selector1~0_combout\ & (((\state.ESTABLISHED~q\ & !\Selector1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~0_combout\,
	datab => \next_state.ESTABLISHED~q\,
	datac => \state.ESTABLISHED~q\,
	datad => \Selector1~4_combout\,
	combout => \state.ESTABLISHED~0_combout\);

-- Location: FF_X11_Y18_N27
\state.ESTABLISHED\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \state.ESTABLISHED~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.ESTABLISHED~q\);

-- Location: LCCOMB_X11_Y18_N28
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\state.ESTABLISHED~q\) # ((\state.CLOSED~q\ & \is_connected~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.ESTABLISHED~q\,
	datab => \state.CLOSED~q\,
	datac => \is_connected~reg0_q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X11_Y18_N29
\is_connected~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \is_connected~reg0_q\);

-- Location: LCCOMB_X13_Y16_N12
\c_mac[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[0]~feeder_combout\ = \in_data[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[0]~input_o\,
	combout => \c_mac[0]~feeder_combout\);

-- Location: LCCOMB_X13_Y18_N8
\c_mac[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[0]~0_combout\ = (rx_cnt(4) & (((!rx_cnt(2) & !rx_cnt(3))))) # (!rx_cnt(4) & (rx_cnt(1) & (rx_cnt(2) & rx_cnt(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(1),
	datab => rx_cnt(4),
	datac => rx_cnt(2),
	datad => rx_cnt(3),
	combout => \c_mac[0]~0_combout\);

-- Location: LCCOMB_X13_Y18_N20
\c_mac[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[0]~2_combout\ = (\state.LISTEN~q\ & (!rx_cnt(5) & (\c_mac[0]~0_combout\ & \c_mac[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.LISTEN~q\,
	datab => rx_cnt(5),
	datac => \c_mac[0]~0_combout\,
	datad => \c_mac[0]~1_combout\,
	combout => \c_mac[0]~2_combout\);

-- Location: FF_X13_Y16_N13
\c_mac[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(0));

-- Location: LCCOMB_X14_Y17_N28
\c_mac[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[1]~feeder_combout\ = \in_data[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[1]~input_o\,
	combout => \c_mac[1]~feeder_combout\);

-- Location: FF_X14_Y17_N29
\c_mac[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(1));

-- Location: LCCOMB_X13_Y16_N30
\c_mac[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[2]~feeder_combout\ = \in_data[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[2]~input_o\,
	combout => \c_mac[2]~feeder_combout\);

-- Location: FF_X13_Y16_N31
\c_mac[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(2));

-- Location: LCCOMB_X13_Y20_N0
\c_mac[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[3]~feeder_combout\ = \in_data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[3]~input_o\,
	combout => \c_mac[3]~feeder_combout\);

-- Location: FF_X13_Y20_N1
\c_mac[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[3]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(3));

-- Location: LCCOMB_X14_Y18_N20
\c_mac[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[4]~feeder_combout\ = \in_data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[4]~input_o\,
	combout => \c_mac[4]~feeder_combout\);

-- Location: FF_X14_Y18_N21
\c_mac[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(4));

-- Location: LCCOMB_X14_Y18_N10
\c_mac[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[5]~feeder_combout\ = \in_data[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[5]~input_o\,
	combout => \c_mac[5]~feeder_combout\);

-- Location: FF_X14_Y18_N11
\c_mac[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(5));

-- Location: FF_X14_Y20_N21
\c_mac[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(6));

-- Location: LCCOMB_X14_Y20_N22
\c_mac[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[7]~feeder_combout\ = \in_data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[7]~input_o\,
	combout => \c_mac[7]~feeder_combout\);

-- Location: FF_X14_Y20_N23
\c_mac[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[7]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(7));

-- Location: LCCOMB_X13_Y16_N8
\c_mac[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[8]~feeder_combout\ = c_mac(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(0),
	combout => \c_mac[8]~feeder_combout\);

-- Location: FF_X13_Y16_N9
\c_mac[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[8]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(8));

-- Location: LCCOMB_X14_Y17_N30
\c_mac[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[9]~feeder_combout\ = c_mac(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(1),
	combout => \c_mac[9]~feeder_combout\);

-- Location: FF_X14_Y17_N31
\c_mac[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[9]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(9));

-- Location: LCCOMB_X13_Y20_N2
\c_mac[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[10]~feeder_combout\ = c_mac(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => c_mac(2),
	combout => \c_mac[10]~feeder_combout\);

-- Location: FF_X13_Y20_N3
\c_mac[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[10]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(10));

-- Location: LCCOMB_X13_Y20_N12
\c_mac[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[11]~feeder_combout\ = c_mac(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(3),
	combout => \c_mac[11]~feeder_combout\);

-- Location: FF_X13_Y20_N13
\c_mac[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[11]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(11));

-- Location: LCCOMB_X14_Y18_N16
\c_mac[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[12]~feeder_combout\ = c_mac(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(4),
	combout => \c_mac[12]~feeder_combout\);

-- Location: FF_X14_Y18_N17
\c_mac[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[12]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(12));

-- Location: LCCOMB_X14_Y18_N2
\c_mac[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[13]~feeder_combout\ = c_mac(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(5),
	combout => \c_mac[13]~feeder_combout\);

-- Location: FF_X14_Y18_N3
\c_mac[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[13]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(13));

-- Location: LCCOMB_X14_Y20_N16
\c_mac[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[14]~feeder_combout\ = c_mac(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(6),
	combout => \c_mac[14]~feeder_combout\);

-- Location: FF_X14_Y20_N17
\c_mac[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[14]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(14));

-- Location: FF_X14_Y20_N7
\c_mac[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_mac(7),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(15));

-- Location: FF_X13_Y16_N11
\c_mac[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_mac(8),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(16));

-- Location: FF_X14_Y17_N1
\c_mac[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_mac(9),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(17));

-- Location: LCCOMB_X13_Y20_N10
\c_mac[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[18]~feeder_combout\ = c_mac(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(10),
	combout => \c_mac[18]~feeder_combout\);

-- Location: FF_X13_Y20_N11
\c_mac[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[18]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(18));

-- Location: LCCOMB_X13_Y20_N16
\c_mac[19]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[19]~feeder_combout\ = c_mac(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(11),
	combout => \c_mac[19]~feeder_combout\);

-- Location: FF_X13_Y20_N17
\c_mac[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[19]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(19));

-- Location: LCCOMB_X14_Y18_N4
\c_mac[20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[20]~feeder_combout\ = c_mac(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(12),
	combout => \c_mac[20]~feeder_combout\);

-- Location: FF_X14_Y18_N5
\c_mac[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[20]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(20));

-- Location: LCCOMB_X14_Y18_N18
\c_mac[21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[21]~feeder_combout\ = c_mac(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(13),
	combout => \c_mac[21]~feeder_combout\);

-- Location: FF_X14_Y18_N19
\c_mac[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[21]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(21));

-- Location: LCCOMB_X14_Y20_N24
\c_mac[22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[22]~feeder_combout\ = c_mac(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(14),
	combout => \c_mac[22]~feeder_combout\);

-- Location: FF_X14_Y20_N25
\c_mac[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[22]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(22));

-- Location: LCCOMB_X14_Y20_N30
\c_mac[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[23]~feeder_combout\ = c_mac(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(15),
	combout => \c_mac[23]~feeder_combout\);

-- Location: FF_X14_Y20_N31
\c_mac[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[23]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(23));

-- Location: LCCOMB_X13_Y16_N28
\c_mac[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[24]~feeder_combout\ = c_mac(16)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(16),
	combout => \c_mac[24]~feeder_combout\);

-- Location: FF_X13_Y16_N29
\c_mac[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[24]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(24));

-- Location: LCCOMB_X13_Y19_N8
\c_mac[25]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[25]~feeder_combout\ = c_mac(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(17),
	combout => \c_mac[25]~feeder_combout\);

-- Location: FF_X13_Y19_N9
\c_mac[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[25]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(25));

-- Location: LCCOMB_X13_Y20_N18
\c_mac[26]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[26]~feeder_combout\ = c_mac(18)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(18),
	combout => \c_mac[26]~feeder_combout\);

-- Location: FF_X13_Y20_N19
\c_mac[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[26]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(26));

-- Location: LCCOMB_X13_Y20_N24
\c_mac[27]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[27]~feeder_combout\ = c_mac(19)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(19),
	combout => \c_mac[27]~feeder_combout\);

-- Location: FF_X13_Y20_N25
\c_mac[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[27]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(27));

-- Location: FF_X14_Y18_N29
\c_mac[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_mac(20),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(28));

-- Location: LCCOMB_X14_Y18_N30
\c_mac[29]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[29]~feeder_combout\ = c_mac(21)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(21),
	combout => \c_mac[29]~feeder_combout\);

-- Location: FF_X14_Y18_N31
\c_mac[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[29]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(29));

-- Location: LCCOMB_X14_Y20_N28
\c_mac[30]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[30]~feeder_combout\ = c_mac(22)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(22),
	combout => \c_mac[30]~feeder_combout\);

-- Location: FF_X14_Y20_N29
\c_mac[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[30]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(30));

-- Location: FF_X14_Y20_N19
\c_mac[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_mac(23),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(31));

-- Location: LCCOMB_X13_Y16_N2
\c_mac[32]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[32]~feeder_combout\ = c_mac(24)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(24),
	combout => \c_mac[32]~feeder_combout\);

-- Location: FF_X13_Y16_N3
\c_mac[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[32]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(32));

-- Location: FF_X13_Y19_N23
\c_mac[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_mac(25),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(33));

-- Location: LCCOMB_X13_Y20_N26
\c_mac[34]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[34]~feeder_combout\ = c_mac(26)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(26),
	combout => \c_mac[34]~feeder_combout\);

-- Location: FF_X13_Y20_N27
\c_mac[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[34]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(34));

-- Location: LCCOMB_X13_Y20_N20
\c_mac[35]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[35]~feeder_combout\ = c_mac(27)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(27),
	combout => \c_mac[35]~feeder_combout\);

-- Location: FF_X13_Y20_N21
\c_mac[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[35]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(35));

-- Location: LCCOMB_X14_Y18_N0
\c_mac[36]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[36]~feeder_combout\ = c_mac(28)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(28),
	combout => \c_mac[36]~feeder_combout\);

-- Location: FF_X14_Y18_N1
\c_mac[36]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[36]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(36));

-- Location: FF_X14_Y18_N23
\c_mac[37]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_mac(29),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(37));

-- Location: LCCOMB_X14_Y20_N12
\c_mac[38]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[38]~feeder_combout\ = c_mac(30)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(30),
	combout => \c_mac[38]~feeder_combout\);

-- Location: FF_X14_Y20_N13
\c_mac[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[38]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(38));

-- Location: LCCOMB_X14_Y20_N26
\c_mac[39]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[39]~feeder_combout\ = c_mac(31)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(31),
	combout => \c_mac[39]~feeder_combout\);

-- Location: FF_X14_Y20_N27
\c_mac[39]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[39]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(39));

-- Location: LCCOMB_X13_Y16_N4
\c_mac[40]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[40]~feeder_combout\ = c_mac(32)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(32),
	combout => \c_mac[40]~feeder_combout\);

-- Location: FF_X13_Y16_N5
\c_mac[40]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[40]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(40));

-- Location: LCCOMB_X13_Y16_N22
\c_mac[41]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[41]~feeder_combout\ = c_mac(33)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(33),
	combout => \c_mac[41]~feeder_combout\);

-- Location: FF_X13_Y16_N23
\c_mac[41]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[41]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(41));

-- Location: FF_X13_Y20_N31
\c_mac[42]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_mac(34),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(42));

-- Location: LCCOMB_X14_Y20_N8
\c_mac[43]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[43]~feeder_combout\ = c_mac(35)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(35),
	combout => \c_mac[43]~feeder_combout\);

-- Location: FF_X14_Y20_N9
\c_mac[43]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[43]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(43));

-- Location: LCCOMB_X14_Y18_N12
\c_mac[44]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[44]~feeder_combout\ = c_mac(36)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(36),
	combout => \c_mac[44]~feeder_combout\);

-- Location: FF_X14_Y18_N13
\c_mac[44]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[44]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(44));

-- Location: FF_X14_Y18_N27
\c_mac[45]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_mac(37),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(45));

-- Location: LCCOMB_X14_Y20_N10
\c_mac[46]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_mac[46]~feeder_combout\ = c_mac(38)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_mac(38),
	combout => \c_mac[46]~feeder_combout\);

-- Location: FF_X14_Y20_N11
\c_mac[46]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_mac[46]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(46));

-- Location: FF_X14_Y20_N5
\c_mac[47]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_mac(39),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_mac[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_mac(47));

-- Location: LCCOMB_X13_Y16_N16
\c_ip[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[0]~feeder_combout\ = \in_data[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[0]~input_o\,
	combout => \c_ip[0]~feeder_combout\);

-- Location: LCCOMB_X12_Y18_N6
\c_port[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[0]~0_combout\ = (rx_cnt(5) & ((rx_cnt(1)) # (rx_cnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(5),
	datac => rx_cnt(1),
	datad => rx_cnt(2),
	combout => \c_port[0]~0_combout\);

-- Location: LCCOMB_X12_Y18_N0
\c_port[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[0]~1_combout\ = (\state.LISTEN~q\ & (\port_valid~0_combout\ & \c_port[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.LISTEN~q\,
	datac => \port_valid~0_combout\,
	datad => \c_port[0]~0_combout\,
	combout => \c_port[0]~1_combout\);

-- Location: LCCOMB_X12_Y18_N2
\c_ip[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[0]~0_combout\ = (!rx_cnt(3) & (\c_port[0]~1_combout\ & ((!rx_cnt(2)) # (!rx_cnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rx_cnt(1),
	datab => rx_cnt(3),
	datac => rx_cnt(2),
	datad => \c_port[0]~1_combout\,
	combout => \c_ip[0]~0_combout\);

-- Location: FF_X13_Y16_N17
\c_ip[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(0));

-- Location: LCCOMB_X7_Y18_N0
\c_ip[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[1]~feeder_combout\ = \in_data[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[1]~input_o\,
	combout => \c_ip[1]~feeder_combout\);

-- Location: FF_X7_Y18_N1
\c_ip[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(1));

-- Location: FF_X11_Y20_N1
\c_ip[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(2));

-- Location: LCCOMB_X13_Y16_N18
\c_ip[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[3]~feeder_combout\ = \in_data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[3]~input_o\,
	combout => \c_ip[3]~feeder_combout\);

-- Location: FF_X13_Y16_N19
\c_ip[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[3]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(3));

-- Location: LCCOMB_X7_Y18_N10
\c_ip[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[4]~feeder_combout\ = \in_data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[4]~input_o\,
	combout => \c_ip[4]~feeder_combout\);

-- Location: FF_X7_Y18_N11
\c_ip[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(4));

-- Location: LCCOMB_X11_Y20_N10
\c_ip[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[5]~feeder_combout\ = \in_data[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[5]~input_o\,
	combout => \c_ip[5]~feeder_combout\);

-- Location: FF_X11_Y20_N11
\c_ip[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(5));

-- Location: LCCOMB_X11_Y20_N4
\c_ip[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[6]~feeder_combout\ = \in_data[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[6]~input_o\,
	combout => \c_ip[6]~feeder_combout\);

-- Location: FF_X11_Y20_N5
\c_ip[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[6]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(6));

-- Location: FF_X7_Y18_N21
\c_ip[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(7));

-- Location: LCCOMB_X13_Y16_N0
\c_ip[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[8]~feeder_combout\ = c_ip(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(0),
	combout => \c_ip[8]~feeder_combout\);

-- Location: FF_X13_Y16_N1
\c_ip[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[8]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(8));

-- Location: LCCOMB_X7_Y18_N18
\c_ip[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[9]~feeder_combout\ = c_ip(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(1),
	combout => \c_ip[9]~feeder_combout\);

-- Location: FF_X7_Y18_N19
\c_ip[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[9]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(9));

-- Location: LCCOMB_X11_Y20_N18
\c_ip[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[10]~feeder_combout\ = c_ip(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(2),
	combout => \c_ip[10]~feeder_combout\);

-- Location: FF_X11_Y20_N19
\c_ip[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[10]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(10));

-- Location: LCCOMB_X13_Y16_N26
\c_ip[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[11]~feeder_combout\ = c_ip(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(3),
	combout => \c_ip[11]~feeder_combout\);

-- Location: FF_X13_Y16_N27
\c_ip[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[11]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(11));

-- Location: LCCOMB_X7_Y18_N24
\c_ip[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[12]~feeder_combout\ = c_ip(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(4),
	combout => \c_ip[12]~feeder_combout\);

-- Location: FF_X7_Y18_N25
\c_ip[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[12]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(12));

-- Location: LCCOMB_X11_Y20_N12
\c_ip[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[13]~feeder_combout\ = c_ip(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(5),
	combout => \c_ip[13]~feeder_combout\);

-- Location: FF_X11_Y20_N13
\c_ip[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[13]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(13));

-- Location: FF_X11_Y20_N27
\c_ip[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_ip(6),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(14));

-- Location: LCCOMB_X7_Y18_N22
\c_ip[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[15]~feeder_combout\ = c_ip(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(7),
	combout => \c_ip[15]~feeder_combout\);

-- Location: FF_X7_Y18_N23
\c_ip[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[15]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(15));

-- Location: LCCOMB_X13_Y16_N20
\c_ip[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[16]~feeder_combout\ = c_ip(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(8),
	combout => \c_ip[16]~feeder_combout\);

-- Location: FF_X13_Y16_N21
\c_ip[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[16]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(16));

-- Location: LCCOMB_X7_Y18_N12
\c_ip[17]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[17]~feeder_combout\ = c_ip(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(9),
	combout => \c_ip[17]~feeder_combout\);

-- Location: FF_X7_Y18_N13
\c_ip[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[17]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(17));

-- Location: LCCOMB_X11_Y20_N24
\c_ip[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[18]~feeder_combout\ = c_ip(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(10),
	combout => \c_ip[18]~feeder_combout\);

-- Location: FF_X11_Y20_N25
\c_ip[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[18]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(18));

-- Location: FF_X13_Y16_N15
\c_ip[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_ip(11),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(19));

-- Location: LCCOMB_X7_Y18_N2
\c_ip[20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[20]~feeder_combout\ = c_ip(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(12),
	combout => \c_ip[20]~feeder_combout\);

-- Location: FF_X7_Y18_N3
\c_ip[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[20]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(20));

-- Location: LCCOMB_X11_Y20_N22
\c_ip[21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[21]~feeder_combout\ = c_ip(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(13),
	combout => \c_ip[21]~feeder_combout\);

-- Location: FF_X11_Y20_N23
\c_ip[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[21]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(21));

-- Location: FF_X11_Y20_N21
\c_ip[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_ip(14),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(22));

-- Location: FF_X7_Y18_N29
\c_ip[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_ip(15),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(23));

-- Location: LCCOMB_X13_Y16_N24
\c_ip[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[24]~feeder_combout\ = c_ip(16)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(16),
	combout => \c_ip[24]~feeder_combout\);

-- Location: FF_X13_Y16_N25
\c_ip[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[24]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(24));

-- Location: LCCOMB_X7_Y18_N30
\c_ip[25]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[25]~feeder_combout\ = c_ip(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(17),
	combout => \c_ip[25]~feeder_combout\);

-- Location: FF_X7_Y18_N31
\c_ip[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[25]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(25));

-- Location: LCCOMB_X11_Y20_N2
\c_ip[26]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[26]~feeder_combout\ = c_ip(18)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(18),
	combout => \c_ip[26]~feeder_combout\);

-- Location: FF_X11_Y20_N3
\c_ip[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[26]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(26));

-- Location: FF_X13_Y16_N7
\c_ip[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_ip(19),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(27));

-- Location: LCCOMB_X7_Y18_N8
\c_ip[28]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[28]~feeder_combout\ = c_ip(20)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(20),
	combout => \c_ip[28]~feeder_combout\);

-- Location: FF_X7_Y18_N9
\c_ip[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[28]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(28));

-- Location: FF_X11_Y20_N29
\c_ip[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_ip(21),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(29));

-- Location: LCCOMB_X11_Y20_N6
\c_ip[30]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[30]~feeder_combout\ = c_ip(22)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(22),
	combout => \c_ip[30]~feeder_combout\);

-- Location: FF_X11_Y20_N7
\c_ip[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[30]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(30));

-- Location: LCCOMB_X7_Y18_N26
\c_ip[31]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_ip[31]~feeder_combout\ = c_ip(23)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_ip(23),
	combout => \c_ip[31]~feeder_combout\);

-- Location: FF_X7_Y18_N27
\c_ip[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_ip[31]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_ip[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_ip(31));

-- Location: LCCOMB_X12_Y18_N28
\c_port[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[0]~2_combout\ = (rx_cnt(3) & (!rx_cnt(2) & \c_port[0]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rx_cnt(3),
	datac => rx_cnt(2),
	datad => \c_port[0]~1_combout\,
	combout => \c_port[0]~2_combout\);

-- Location: FF_X13_Y18_N29
\c_port[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(0));

-- Location: LCCOMB_X12_Y16_N28
\c_port[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[1]~feeder_combout\ = \in_data[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[1]~input_o\,
	combout => \c_port[1]~feeder_combout\);

-- Location: FF_X12_Y16_N29
\c_port[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(1));

-- Location: FF_X12_Y16_N27
\c_port[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(2));

-- Location: LCCOMB_X12_Y16_N12
\c_port[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[3]~feeder_combout\ = \in_data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[3]~input_o\,
	combout => \c_port[3]~feeder_combout\);

-- Location: FF_X12_Y16_N13
\c_port[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[3]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(3));

-- Location: LCCOMB_X14_Y18_N24
\c_port[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[4]~feeder_combout\ = \in_data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[4]~input_o\,
	combout => \c_port[4]~feeder_combout\);

-- Location: FF_X14_Y18_N25
\c_port[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(4));

-- Location: LCCOMB_X14_Y18_N6
\c_port[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[5]~feeder_combout\ = \in_data[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[5]~input_o\,
	combout => \c_port[5]~feeder_combout\);

-- Location: FF_X14_Y18_N7
\c_port[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(5));

-- Location: FF_X13_Y19_N13
\c_port[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \in_data[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(6));

-- Location: LCCOMB_X13_Y19_N2
\c_port[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[7]~feeder_combout\ = \in_data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \in_data[7]~input_o\,
	combout => \c_port[7]~feeder_combout\);

-- Location: FF_X13_Y19_N3
\c_port[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[7]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(7));

-- Location: FF_X13_Y18_N3
\c_port[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_port(0),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(8));

-- Location: LCCOMB_X12_Y16_N14
\c_port[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[9]~feeder_combout\ = c_port(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_port(1),
	combout => \c_port[9]~feeder_combout\);

-- Location: FF_X12_Y16_N15
\c_port[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[9]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(9));

-- Location: FF_X12_Y16_N17
\c_port[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => c_port(2),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(10));

-- Location: LCCOMB_X12_Y16_N30
\c_port[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[11]~feeder_combout\ = c_port(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_port(3),
	combout => \c_port[11]~feeder_combout\);

-- Location: FF_X12_Y16_N31
\c_port[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[11]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(11));

-- Location: LCCOMB_X14_Y18_N8
\c_port[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[12]~feeder_combout\ = c_port(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_port(4),
	combout => \c_port[12]~feeder_combout\);

-- Location: FF_X14_Y18_N9
\c_port[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[12]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(12));

-- Location: LCCOMB_X14_Y18_N14
\c_port[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[13]~feeder_combout\ = c_port(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_port(5),
	combout => \c_port[13]~feeder_combout\);

-- Location: FF_X14_Y18_N15
\c_port[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[13]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(13));

-- Location: LCCOMB_X13_Y19_N0
\c_port[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[14]~feeder_combout\ = c_port(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_port(6),
	combout => \c_port[14]~feeder_combout\);

-- Location: FF_X13_Y19_N1
\c_port[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[14]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(14));

-- Location: LCCOMB_X13_Y19_N26
\c_port[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_port[15]~feeder_combout\ = c_port(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => c_port(7),
	combout => \c_port[15]~feeder_combout\);

-- Location: FF_X13_Y19_N27
\c_port[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \c_port[15]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \c_port[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => c_port(15));

-- Location: LCCOMB_X11_Y19_N2
\Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal9~0_combout\ = (tx_pos(2) & (tx_pos(0) & (tx_pos(1) & !tx_pos(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tx_pos(2),
	datab => tx_pos(0),
	datac => tx_pos(1),
	datad => tx_pos(3),
	combout => \Equal9~0_combout\);

-- Location: LCCOMB_X10_Y19_N20
\Equal9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal9~1_combout\ = (\Equal9~0_combout\ & (tx_pos(5) & (tx_pos(4) & !tx_pos(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal9~0_combout\,
	datab => tx_pos(5),
	datac => tx_pos(4),
	datad => tx_pos(6),
	combout => \Equal9~1_combout\);

-- Location: LCCOMB_X10_Y19_N26
\tx_byte[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_byte[1]~feeder_combout\ = \Equal9~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Equal9~1_combout\,
	combout => \tx_byte[1]~feeder_combout\);

-- Location: LCCOMB_X10_Y19_N16
\tx_byte[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_byte[1]~0_combout\ = (\tx_active~q\ & (!\reset~input_o\ & (\out_ready~input_o\ & \state.SYN_RCVD~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_active~q\,
	datab => \reset~input_o\,
	datac => \out_ready~input_o\,
	datad => \state.SYN_RCVD~q\,
	combout => \tx_byte[1]~0_combout\);

-- Location: FF_X10_Y19_N27
\tx_byte[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \tx_byte[1]~feeder_combout\,
	ena => \tx_byte[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_byte(1));

-- Location: FF_X10_Y19_N21
\tx_byte[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Equal9~1_combout\,
	ena => \tx_byte[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_byte(4));

-- Location: LCCOMB_X10_Y19_N18
\out_sop~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \out_sop~0_combout\ = (\tx_active~q\ & (!tx_pos(6) & !tx_pos(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_active~q\,
	datab => tx_pos(6),
	datad => tx_pos(0),
	combout => \out_sop~0_combout\);

-- Location: LCCOMB_X10_Y19_N28
\out_sop~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \out_sop~1_combout\ = (\out_sop~0_combout\ & (\Equal10~0_combout\ & !tx_pos(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \out_sop~0_combout\,
	datac => \Equal10~0_combout\,
	datad => tx_pos(5),
	combout => \out_sop~1_combout\);

-- Location: LCCOMB_X10_Y19_N2
\out_eop~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \out_eop~0_combout\ = (\tx_active~q\ & \Equal10~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_active~q\,
	datac => \Equal10~1_combout\,
	combout => \out_eop~0_combout\);

ww_is_connected <= \is_connected~output_o\;

ww_client_mac(0) <= \client_mac[0]~output_o\;

ww_client_mac(1) <= \client_mac[1]~output_o\;

ww_client_mac(2) <= \client_mac[2]~output_o\;

ww_client_mac(3) <= \client_mac[3]~output_o\;

ww_client_mac(4) <= \client_mac[4]~output_o\;

ww_client_mac(5) <= \client_mac[5]~output_o\;

ww_client_mac(6) <= \client_mac[6]~output_o\;

ww_client_mac(7) <= \client_mac[7]~output_o\;

ww_client_mac(8) <= \client_mac[8]~output_o\;

ww_client_mac(9) <= \client_mac[9]~output_o\;

ww_client_mac(10) <= \client_mac[10]~output_o\;

ww_client_mac(11) <= \client_mac[11]~output_o\;

ww_client_mac(12) <= \client_mac[12]~output_o\;

ww_client_mac(13) <= \client_mac[13]~output_o\;

ww_client_mac(14) <= \client_mac[14]~output_o\;

ww_client_mac(15) <= \client_mac[15]~output_o\;

ww_client_mac(16) <= \client_mac[16]~output_o\;

ww_client_mac(17) <= \client_mac[17]~output_o\;

ww_client_mac(18) <= \client_mac[18]~output_o\;

ww_client_mac(19) <= \client_mac[19]~output_o\;

ww_client_mac(20) <= \client_mac[20]~output_o\;

ww_client_mac(21) <= \client_mac[21]~output_o\;

ww_client_mac(22) <= \client_mac[22]~output_o\;

ww_client_mac(23) <= \client_mac[23]~output_o\;

ww_client_mac(24) <= \client_mac[24]~output_o\;

ww_client_mac(25) <= \client_mac[25]~output_o\;

ww_client_mac(26) <= \client_mac[26]~output_o\;

ww_client_mac(27) <= \client_mac[27]~output_o\;

ww_client_mac(28) <= \client_mac[28]~output_o\;

ww_client_mac(29) <= \client_mac[29]~output_o\;

ww_client_mac(30) <= \client_mac[30]~output_o\;

ww_client_mac(31) <= \client_mac[31]~output_o\;

ww_client_mac(32) <= \client_mac[32]~output_o\;

ww_client_mac(33) <= \client_mac[33]~output_o\;

ww_client_mac(34) <= \client_mac[34]~output_o\;

ww_client_mac(35) <= \client_mac[35]~output_o\;

ww_client_mac(36) <= \client_mac[36]~output_o\;

ww_client_mac(37) <= \client_mac[37]~output_o\;

ww_client_mac(38) <= \client_mac[38]~output_o\;

ww_client_mac(39) <= \client_mac[39]~output_o\;

ww_client_mac(40) <= \client_mac[40]~output_o\;

ww_client_mac(41) <= \client_mac[41]~output_o\;

ww_client_mac(42) <= \client_mac[42]~output_o\;

ww_client_mac(43) <= \client_mac[43]~output_o\;

ww_client_mac(44) <= \client_mac[44]~output_o\;

ww_client_mac(45) <= \client_mac[45]~output_o\;

ww_client_mac(46) <= \client_mac[46]~output_o\;

ww_client_mac(47) <= \client_mac[47]~output_o\;

ww_client_ip(0) <= \client_ip[0]~output_o\;

ww_client_ip(1) <= \client_ip[1]~output_o\;

ww_client_ip(2) <= \client_ip[2]~output_o\;

ww_client_ip(3) <= \client_ip[3]~output_o\;

ww_client_ip(4) <= \client_ip[4]~output_o\;

ww_client_ip(5) <= \client_ip[5]~output_o\;

ww_client_ip(6) <= \client_ip[6]~output_o\;

ww_client_ip(7) <= \client_ip[7]~output_o\;

ww_client_ip(8) <= \client_ip[8]~output_o\;

ww_client_ip(9) <= \client_ip[9]~output_o\;

ww_client_ip(10) <= \client_ip[10]~output_o\;

ww_client_ip(11) <= \client_ip[11]~output_o\;

ww_client_ip(12) <= \client_ip[12]~output_o\;

ww_client_ip(13) <= \client_ip[13]~output_o\;

ww_client_ip(14) <= \client_ip[14]~output_o\;

ww_client_ip(15) <= \client_ip[15]~output_o\;

ww_client_ip(16) <= \client_ip[16]~output_o\;

ww_client_ip(17) <= \client_ip[17]~output_o\;

ww_client_ip(18) <= \client_ip[18]~output_o\;

ww_client_ip(19) <= \client_ip[19]~output_o\;

ww_client_ip(20) <= \client_ip[20]~output_o\;

ww_client_ip(21) <= \client_ip[21]~output_o\;

ww_client_ip(22) <= \client_ip[22]~output_o\;

ww_client_ip(23) <= \client_ip[23]~output_o\;

ww_client_ip(24) <= \client_ip[24]~output_o\;

ww_client_ip(25) <= \client_ip[25]~output_o\;

ww_client_ip(26) <= \client_ip[26]~output_o\;

ww_client_ip(27) <= \client_ip[27]~output_o\;

ww_client_ip(28) <= \client_ip[28]~output_o\;

ww_client_ip(29) <= \client_ip[29]~output_o\;

ww_client_ip(30) <= \client_ip[30]~output_o\;

ww_client_ip(31) <= \client_ip[31]~output_o\;

ww_client_port(0) <= \client_port[0]~output_o\;

ww_client_port(1) <= \client_port[1]~output_o\;

ww_client_port(2) <= \client_port[2]~output_o\;

ww_client_port(3) <= \client_port[3]~output_o\;

ww_client_port(4) <= \client_port[4]~output_o\;

ww_client_port(5) <= \client_port[5]~output_o\;

ww_client_port(6) <= \client_port[6]~output_o\;

ww_client_port(7) <= \client_port[7]~output_o\;

ww_client_port(8) <= \client_port[8]~output_o\;

ww_client_port(9) <= \client_port[9]~output_o\;

ww_client_port(10) <= \client_port[10]~output_o\;

ww_client_port(11) <= \client_port[11]~output_o\;

ww_client_port(12) <= \client_port[12]~output_o\;

ww_client_port(13) <= \client_port[13]~output_o\;

ww_client_port(14) <= \client_port[14]~output_o\;

ww_client_port(15) <= \client_port[15]~output_o\;

ww_in_ready <= \in_ready~output_o\;

ww_out_data(0) <= \out_data[0]~output_o\;

ww_out_data(1) <= \out_data[1]~output_o\;

ww_out_data(2) <= \out_data[2]~output_o\;

ww_out_data(3) <= \out_data[3]~output_o\;

ww_out_data(4) <= \out_data[4]~output_o\;

ww_out_data(5) <= \out_data[5]~output_o\;

ww_out_data(6) <= \out_data[6]~output_o\;

ww_out_data(7) <= \out_data[7]~output_o\;

ww_out_valid <= \out_valid~output_o\;

ww_out_sop <= \out_sop~output_o\;

ww_out_eop <= \out_eop~output_o\;
END structure;


