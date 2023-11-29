library ieee;
use ieee.std_logic_1164.all;
entity part1_1 is
port (reset, clk :   in std_logic;
      A_out , B_out: out integer range 0 to 15);
end;

architecture arch of part1_1 is
 signal sig_1 : integer := 1;
 signal sig_2 : integer := 2;
 signal sig_3 : integer := 3;
begin 
 process(clk)
variable var_1: integer :=1; 
variable var_2: integer :=2;
variable var_3: integer :=3;
begin
if reset ='1' then A_out<= 0; B_out<= 0;

elsif (clk'event and clk='1') then    var_1:= var_2+ var_3;
									  var_2:= var_1;
									  var_3:= var_2;
	B_out<= var_1+ var_2 + var_3;
                   
								     sig_1<= sig_2+ sig_3;
								     sig_2<= sig_1;
								     sig_3<= sig_2;      
    A_out<= sig_1 + sig_2+ sig_3;
    end if;
    end process;
    end arch;                       
 