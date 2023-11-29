Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Package my_package is  --declaration of the package
 function Byte_to_int(data: std_logic_vector(7 downto 0)) return integer;
 Function parity (data: std_logic_vector) return std_logic;
Procedure trailing_zeros(data: std_logic_vector; signal w: out natural) ;
end package my_package;

package body my_package is -- body of the package
		
	function Byte_to_int(data: std_logic_vector(7 downto 0)) return integer is 
      variable y: natural range 0 to 255:=0;                                    
	begin 
	
	    for i in data'Range loop
		if(data(i)='1') then y:= (y+(2**i));
		end if;
		end loop;
		return y;
	end  Byte_to_int;
		
	Function parity (data: std_logic_vector) return std_logic is 
	 variable y: std_logic :='0';                                 
	begin 
		For i in data'Range Loop
		y := y xor data(i);
		end Loop;
		return y;
	end parity;
	
	Procedure trailing_zeros(data: std_logic_vector; signal w: out natural) is 
	variable y: integer range 0 to 8:=0;                                       
	begin 
	
		for i in data'reverse_range loop
		case data(i) is 
		when '0' => y:= y+1;
		when others => exit;
		end case;
		end loop;
		w <= y;
	end  trailing_zeros;
	
	end package body my_package;