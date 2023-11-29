library ieee;
use ieee.std_logic_1164.all;
entity fsm_3 is
port ( clk, rst, w : in std_logic ;
        y          : out std_logic);
        
      end  entity ;
 Architecture behavioral of fsm_3 is
 Type state_type  is (A, B, C, D, E, F, G);
 signal PS : state_type ;
 begin
 transition : PROCESS(rst,clk)
              Begin
              if rst='1' then PS <= A;
              Elsif (clk' event and clk = '1') then

              case PS is
                              
when A=> if (w='1') then PS<= F ;
          else PS <=B;
          end if;                              
                              
when B=> if (w='0') then PS<= B;
          else PS<= C;
          end if;
          
when C=> if (w='1') then PS<= F;
          else PS<= D;
          end if;

when D=> if (w='1') then PS<= C;
          else PS<= E;
          end if;

when E=>  PS<= E;

when F=> if (w='0') then PS<= G;
          else PS<= F;
          end if;
          
when G=> if (w='1') then PS<= C;
          else PS<= E;
          end if;
end case;
end if;
 
          End PROCESS transition;       
          
          
-- y<= '1' when PS = S5 
   --      else '0' ;
   
         out_put:       PROCESS(PS)
                        Begin
                     case PS is
            
              when D => y <= '1';
              when others => y<='0';
              
                     end case;
                        end PROCESS out_put ;
              
 end behavioral;             
                           
                              
                                            
                              
      