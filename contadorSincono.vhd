library ieee;
use ieee.std_logic_1164.all;

entity contadorSincrono is

port (
	clk, enable, reset : in std_logic;
	S : in std_logic;
	saida : out std_logic_vector (6 downto 0);
	
	 Qe: out std_logic_vector(2 downto 0)
	);

end contadorSincrono;

architecture contadorSincronoArch of contadorSincrono is

    component flipFlopJK is
        port(
				J,K : in std_logic;
				clear, preset : in std_logic;
				clk : in std_logic;
				Q, Qbar: out std_logic
				);
    end component;
	 
	component conv_bin_7seg is
		Port ( B3,B2,B1,B0 : in STD_LOGIC;
		display: out STD_LOGIC_vector(6 downto 0));
	end component;
    
    signal J, K, qs, qsb:  std_logic_vector(2 downto 0);
	 signal 	 ax: std_logic_vector(4 downto 0);

begin        
	 ax(1) <= ((qsb(1) or qsb(0)) and (not S));
	 ax(2) <= ((qs(1) or qs(0)) and S);
	 ax(3) <= (qsb(0) and (not S));
	 ax(4) <= (qs(0) and S);
	 
	 J(2) <= (((ax(1) or ax(2)) and enable) or ((not enable) and reset));
	 K(2) <= (((ax(1) or ax(2)) and enable) or ((not enable) and (not reset)));
	 
	 J(1) <= (((ax(3) or ax(4)) and enable) or ((not enable) and reset));
	 K(1) <= (((ax(3) or ax(4)) and enable) or ((not enable) and (not reset)));
	 
	 J(0) <= ((not enable) and reset);
	 K(0) <= ((not enable) and (not reset));
	 
	 S01: flipFlopJK port map (J(0), K(0), '1', '1', clk, qs(0), qsb(0)); 
    S02: flipFlopJK port map (J(1), K(1), '1', '1', clk, qs(1), qsb(1));
    S03: flipFlopJK port map (J(2), K(2), '1', '1', clk, qs(2), qsb(2));
    
    Qe <= qs;
	 
	 saidaDisplay: conv_bin_7seg port map (qs(2), qs(1), qs(0), '0', saida);

end contadorSincronoArch;
