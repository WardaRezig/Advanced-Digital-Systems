Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

Entity T_birds is
Port( 
	  haz, rst,clk:       in std_logic;
	  left_s, right_s:    in std_logic;
	  Dout:               out std_logic_vector(5 downto 0)); -- function 
End T_birds;

Architecture Arch of T_birds is
signal d: std_logic_vector(5 downto 0);
Begin 
	Process(clk, haz, rst, left_s, right_s)
	Begin
		if rst='1' then D<="000000"; --Reset all lights are off
		elsif (clk'event and clk='1') then  
										if(right_s='1' and left_s='1') then D<="111111";   --Brake
					                    elsif haz='1' then D<="000000" after 50 ns,        --Emergency Flashers
											                     "111111" after 50 ns,     -- it remains on for 50ns 
											                     "000000" after 50 ns;     -- it remains off for 5ns
						                elsif (left_s='1') then D<="000000",               -- left turn
																	  "001000" after 50 ns,
																	  "011000" after 50 ns,
																	  "111000" after 50 ns,
																	  "000000" after 50 ns;
						                elsif (right_s='1') then D<="000000",              -- right turn
																	  "000100" after 50 ns,
																	  "000110" after 50 ns,
																	  "000111" after 50 ns,
																	  "000000" after 50 ns;	
										end if;
		end if;
	end process;
	Dout<=d;
end arch;
	