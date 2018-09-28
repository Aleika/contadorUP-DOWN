library ieee;
use ieee.std_logic_1164.all;

entity flipFlopJK is
port(
	J,K : in std_logic;
	reset, enable : in std_logic;
	clk : in std_logic;
	Q, Qbar: out std_logic
);
end flipFlopJK;

architecture flipFlopArch of flipFlopJK is
signal qsignal : std_logic;
begin
	process(clk, reset, enable)
	begin
	if(clk'event and clk = '0') then 
		if(reset = '1' and enable = '0') then
			qsignal <= '0';
		elsif(enable = '1' and reset = '0')	then
			if(J = '0' and K = '1') then
				qsignal <= '1';
			elsif(J = '1' and K = '0') then
				qsignal <= '0';
			elsif(J = '0' and K='0') then
				qsignal <= not qsignal;
			elsif(J = '1' and K='1') then
				qsignal <= qsignal;
			end if;
		end if;
	end if;
	end process;
	Q <= qsignal;
	Qbar <= not qsignal;
end flipFlopArch;