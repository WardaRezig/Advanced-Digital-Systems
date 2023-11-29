library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity rom_array is
port (   addr: in integer range 0 to 15;            -- 2^4 address lines (rows)
         data : out std_logic_vector(7 downto 0));  -- data displayed on the HEX0 of the FPGA (columns)
end entity;
architecture arch of rom_array is

type rom_array is array (0 to 15) of std_logic_vector(7 downto 0);    --1D-1D Array
constant rom: rom_array := (      x"c0",            -- corresponding data for each address
								  x"F9",
								  x"A4",
								  x"B0",
								  x"99",
								  x"92",
								  x"82",
								  x"F8", 
								  x"80",  
								  x"90",
							      x"88",
								  x"83",
								  x"C6",
								  x"A1",
								  x"86",
								  x"8E");  
begin
process(addr)
begin
data <= rom(addr);
end process; end arch;
