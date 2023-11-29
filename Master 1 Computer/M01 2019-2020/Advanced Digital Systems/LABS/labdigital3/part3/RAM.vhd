library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity ram is
port(   addr: in integer range 0 to 31;   -- 2^5 address lines (rows)
     RW, CS : in std_logic;               
    data_in : in std_logic_vector(3 downto 0);   -- data written in a certain address
   data_out : out std_logic_vector(3 downto 0)); -- data read from a certain address
end ram;

architecture arch of ram is        --1D-1D Array
type ram_array is array (0 to 31) of std_logic_vector(3 downto 0); 
signal my_ram: ram_array;


begin 
process( cs,rw,addr) is
begin
    if cs= '1' then                    -- if the control signal is activated 
 case rw is
 when '1' => data_out <= my_ram(addr); -- performs a read operation 
             
 when '0' => data_out <= "ZZZZ";
             my_ram(addr)<= data_in  ; -- performs a write operation
 end case;
 else                                  -- if the control signal is not activated 
    data_out<= (others => 'Z');        -- the output data a hiZ
 end if;
end process;
 
end arch; 
