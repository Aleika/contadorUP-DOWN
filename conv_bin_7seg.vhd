library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity conv_bin_7seg is
	Port ( a,b,c : in STD_LOGIC;
	display: out STD_LOGIC_vector(6 downto 0));
end conv_bin_7seg;
 
architecture Behavioral of conv_bin_7seg is
 
begin
 
display(6) <= (a and (not b) and (not c)) or ((not a) and (not b) and c);
display(5) <= (a and (not b) and c) or (a and b and (not c));
display(4) <= ((not a)and b and (not c));
display(3) <= ((not a) and (not b) and c) or (a and (not b) and (not c)) or (a and b and c);
display(2) <= c or (a and (not b));
display(1) <= ((not a ) and c) or ((not a) and b) or (b and c);
display(0) <= ((not a ) and (not b)) or (a and b and c);
 
end Behavioral;
