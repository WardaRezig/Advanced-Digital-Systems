library ieee;
use ieee.std_logic_1164.all;

entity overall is
	port(
		t_clk, t_reset: in std_logic;
		out_put: out std_logic_vector(7 downto 0);
		t1b, t2b, t3b: out std_logic;
		t4b: out std_logic_vector(7 downto 0);
		t5b: out std_logic_vector(1 downto 0)
	);
end entity;

architecture struct of overall is

component FSM
	port(
		clk, reset: in std_logic;
		addr: out std_logic_vector (1 downto 0);
		c_ROM, c_RAM, c_READ: out std_logic);
end component;

component ROM 
	port( addr : in std_logic_vector(1 downto 0);
		  clk, RD: in std_logic;
		  data_out: out std_logic_vector(7 downto 0));
end component;

component RAM
	Port( clk, RD, WE: 	 IN std_logic;
	  Addr:  IN std_logic_vector(1 downto 0); 
	  Din:   IN std_logic_vector(7 downto 0);
	  Dout:  OUT std_logic_vector(7 downto 0));
end component;

signal t1, t2, t3: std_logic;
signal t4: std_logic_vector(7 downto 0);
signal t5: std_logic_vector(1 downto 0);

begin
	C1: FSM
	port map(clk => t_clk, reset => t_reset, addr => t5, c_ROM => t1, c_RAM => t2, c_Read => t3);
	C2: ROM
	port map(addr => t5, clk => t_clk, RD => t1, data_out => t4);
	C3: RAM
	port map(clk => t_clk, RD => t3, WE => t2, Addr => t5, Din => t4, Dout => out_put);
t1b <= t1;
t2b <= t2;
t3b <= t3;
t4b <= t4;
t5b <= t5;
end architecture;