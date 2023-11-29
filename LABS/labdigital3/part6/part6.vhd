library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity part6 is
port(rst,right_s,left_s,hazard,clk : in std_logic;
     D_out:out std_logic_vector(5 downto 0));
end entity;

architecture arch of part6 is
signal counter: std_logic_vector(1 downto 0);-- mod4 counter
signal inputs: std_logic_vector(2 downto 0); --hazard & right_s & left_s

type rom is array(0 to 7) of std_logic_vector(5 downto 0);  --1D-1D Array
constant light: rom:=("000000",  --all lights off
    		          "111111",  -- the left turn
                      "001000",  
    		          "011000",
                      "111000",
    		          "000100",  -- the right turn 
                      "000110",
    		          "000111");
begin
inputs<= hazard & right_s & left_s;
count:process(clk,rst)
begin
if (rst='1' or inputs="000") then counter<= "00";
elsif (clk'event and clk= '1') then counter<= counter+'1';
else counter <= counter;end if; end process;
blink:process(inputs,counter)--
begin
case inputs is

when "000"=> D_out<= light(0);
       
when "001"=> case counter is   --left turn
             when "00"=> D_out<= light(0);
             when "01"=> D_out<= light(2);
             when "10"=> D_out<= light(3);
             when "11"=> D_out<= light(4);
             end case;
when "010"=> case counter is   --right turn
             when "00"=> D_out<= light(0);
             when "01"=> D_out<= light(5);
             when "10"=> D_out<= light(6);
             when "11"=> D_out<= light(7);
             end case;
when "011"=> D_out<= light(1);  --break
when "111"=> D_out<= light(1);  --break
 
when others=>case counter is   --emergency flashers
             when "00"=> D_out<= light(0);
             when "01"=> D_out<= light(1);
             when "10"=> D_out<= light(0);
             when "11"=> D_out<= light(1);
             end case;
end case;
end process;
end architecture;