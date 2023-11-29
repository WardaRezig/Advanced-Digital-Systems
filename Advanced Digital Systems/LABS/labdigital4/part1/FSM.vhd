library ieee;
use ieee.std_logic_1164.all;

entity FSM is
	port(
		clk, reset: in std_logic;
		addr: out std_logic_vector (1 downto 0);
		c_ROM, c_RAM, c_READ: out std_logic
	);
end entity;

architecture behave of FSM is
type state is (S1, S2, S3, S4, S5, S6, S7, S8);
signal PS: state;

begin
	process(clk, reset)
	begin
		if(reset= '1') then
			PS <= S1;
		elsif(clk'event and clk='1') then
			case PS is
				when S1 => PS <= S2;
				when S2 => PS <= S3;
				when S3 => PS <= S4;
				when S4 => PS <= S5;
				when S5 => PS <= S6;
				when S6 => PS <= S7;
				when S7 => PS <= S8;
				when S8 => PS <= S1;
			end case;
		end if;
	end process;
	process(PS)
	begin
		case PS is
			when S1 =>
				addr <= "00";
				c_ROM <= '1';
				c_RAM <= '1';
				c_Read <= '0';
			when S2 =>
				addr <= "01";
				c_ROM <= '1';
				c_RAM <= '1';
				c_Read <= '0';
			when S3 =>
				addr <= "10";
				c_ROM <= '1';
				c_RAM <= '1';
				c_Read <= '0';
			when S4 =>
				addr <= "11";
				c_ROM <= '1';
				c_RAM <= '1';
				c_Read <= '0';
			when S5 =>
				addr <= "00";
				c_ROM <= '0';
				c_RAM <= '0';
				c_Read <= '1';
			when S6 =>
				addr <= "01";
				c_ROM <= '0';
				c_RAM <= '0';
				c_Read <= '1';
			when S7 =>
				addr <= "10";
				c_ROM <= '0';
				c_RAM <= '0';
				c_Read <= '1';
			when S8 =>
				addr <= "11";
				c_ROM <= '0';
				c_RAM <= '0';
				c_Read <= '1';
		end case;
	end process;
end architecture;
			