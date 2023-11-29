library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
              entity mod_16 is
              port ( DIR,rst, clk : in std_logic;
                     clk_slow     : buffer std_logic; -- to visualize the clock divided
                       Q          : out std_logic_vector (3 downto 0));
              end mod_16;
     Architecture behav of mod_16 is
     signal state : std_logic_vector(25 downto 0);
     signal counter : std_logic_vector(3 downto 0);
     begin
                clk_div : process (clk)
                          begin
                          if (clk'event and clk ='1') then 
                          if state = 49999999 then state <= (others =>'0') ;
                          else state <= state+1;end if ;end if;                         
                          end process clk_div;
                          clk_slow <=  state(2);
               mod_16_ud: process ( clk_slow ,rst, dir)
                          begin
                           if rst= '0' then counter <= x"0";
                          elsif( clk_slow' event and clk_slow='1') then 
                             case dir is
                             when '1' =>  counter<= counter+1;
                             when others => counter <= counter-1;
                             end case;
                           end if;  
                          end process mod_16_ud; 
                          Q<= counter;
     end behav;
  