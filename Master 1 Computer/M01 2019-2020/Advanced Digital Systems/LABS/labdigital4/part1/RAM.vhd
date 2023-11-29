Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity RAM is
Port( clk, RD, WE: 	 IN std_logic;
	  Addr:  IN std_logic_vector(1 downto 0); 
	  Din:   IN std_logic_vector(7 downto 0);-- data written in a certain address
	  Dout:  OUT std_logic_vector(7 downto 0));-- data read from a certain address
	 
End RAM;

Architecture arch of RAM is    --1D-1D Array
TYPE Ram_a is ARRAY (3 downto 0)of std_logic_vector(7 downto 0);
Signal Ram: Ram_a;
Begin 
	Process(RD, WE, clk)
	Begin
		if (clk'event and clk='1') then
			if (WE='0' and RD='0') then Dout<= "ZZZZZZZZ"; 
			elsif (WE = '1' and RD = '0') then 
				Ram(to_integer(unsigned(addr))) <= Din;
				Dout <= (others => 'Z');
			elsif(WE = '0' and RD = '1') then
				Dout <= Ram(to_integer(unsigned(addr)));
			end if;
		end if;
	end process;
end arch;
	