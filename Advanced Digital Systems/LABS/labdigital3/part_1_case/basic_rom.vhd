library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity basic_rom is -- 'basic' since it has no control signals 
port(  addr: in integer range 0 to 15; -- 2^4 address lines
       data: out std_logic_vector (7 downto 0)); -- data displayed on the HEX0 of the FPGA
end;

architecture arch of basic_rom is
begin
	process(addr)
    begin
         case addr is        -- for each address, a different output is to be displayed
    when 0 => data <= x"c0";
    when 1 => data <= x"F9";
    when 2 => data <= x"A4";
    when 3 => data <= x"B0";
    when 4 => data <= x"99";
    when 5 => data <= x"92";
    when 6 => data <= x"82";
    when 7 => data <= x"F8";
    when 8 => data <= x"80";
    when 9 => data <= x"90";
    when 10 => data <= x"88";
    when 11 => data <= x"83";
    when 12 => data <= x"c6";
    when 13 => data <= x"A1";  
    when 14 => data <= x"86";
    when 15 => data <= x"8E";
    when others => data<= x"ff";
         end case; end process; end arch;    
      

    
    
    

