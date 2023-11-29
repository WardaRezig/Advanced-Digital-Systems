library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ssd is
port(clk, stop : in std_logic ;
          dout : out std_logic_vector(6 downto 0));
end  ssd;

architecture behav of ssd is

type state_type is (a, ab, b,bc, c, cd, d, de, e, ef, f, fa);
signal PS,NS : state_type;
constant time1 : integer := 4; -- 1s lets make it count til 8
constant time2 : integer := 2; --500 ms lets make it count til 4 for simulation
signal counter : integer range 0 to 5;
signal change: std_logic;

begin
         one: process (clk, stop)
              begin
              if stop ='1' then PS <= a;
              elsif  (clk'event and clk='1') then 
              if ((change ='1' and counter= time1) OR
              (change='0' and counter= time2)) then counter <= 0;
              PS<= NS;
              else counter <= counter+1;
              end if; end if;        
              end process one;


        two: PROCESS (ps)
             begin
             case PS is

			when a=> dout <= "0000001";
            change<= '1';
            NS<= ab  ;     
	        when ab=>  dout<="0000011"; 
            change<= '0';
            NS<= b  ;  	   
			when b=>   dout<="0000010";
            change<= '1';
            NS<= bc;        
			when bc=>  dout<="0000110" ;
            change<= '0';
            NS<= c;        
			when c=>   dout<="0000100";
	        change<= '1';
            NS<= cd ;      
		    when cd=>  dout<="0001100";
		    change<= '0';
            NS<= d ;       
		    when d=>   dout<="0001000";
		    change<= '1';
            NS<= de;       
		    when de=>  dout<="0011000"; 
		    change<= '0';
            NS<= e;       
		    when e=>   dout<="0010000";
		    change<= '1';
            NS<= ef;       
		    when ef=>  dout<="1100000"; 
		    change<= '0';
            NS<= f;       
		    when f=>   dout<="1000000";
		    change<= '1';
            NS<= fa  ;     
		    when fa=>  dout<="1000000"; 
		    change<= '0';
            NS<= a ;      
             end case;
         end PROCESS two;
     
end behav;