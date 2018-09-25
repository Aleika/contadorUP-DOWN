library ieee;
use ieee.std_logic_1164.all;

entity conv_bin_7seg is

	port (d: in std_logic_vector(2 downto 0);
			q: out std_logic_vector(6 downto 0));
end conv_bin_7seg;

architecture conv_bin_7segArch of conv_bin_7seg is
begin
	with d select 
		q <= "0000001" when "000",
			  "1001111" when "001",
			  "0010010" when "010",
			  "0000110" when "011",
           "1001100" when "100",
			  "0100100" when "101",
			  "0100000" when "110",
			  "0001101" when "111",
end conv_bin_7segArch