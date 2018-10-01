library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity conv_bin_7seg is
	Port ( B3,B2,B1,B0 : in STD_LOGIC;
	display: out STD_LOGIC_vector(6 downto 0));
end conv_bin_7seg;
 
architecture Behavioral of conv_bin_7seg is
 
begin
 
display(6) <= not(B0 OR B2 OR (B1 AND B3) OR (NOT B1 AND NOT B3));
display(5) <= not ((NOT B1) OR (NOT B2 AND NOT B3) OR (B2 AND B3));
display(4) <= not (B1 OR NOT B2 OR B3);
display(3) <= not ((NOT B1 AND NOT B3) OR (B2 AND NOT B3) OR (B1 AND NOT B2 AND B3) OR (NOT B1 AND B2) OR B0);
display(2) <= not ((NOT B1 AND NOT B3) OR (B2 AND NOT B3));
display(1) <= not (B0 OR (NOT B2 AND NOT B3) OR (B1 AND NOT B2) OR (B1 AND NOT B3));
display(0) <= not (B0 OR (B1 AND NOT B2) OR ( NOT B1 AND B2) OR (B2 AND NOT B3));
 
end Behavioral;
