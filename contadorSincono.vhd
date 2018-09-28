library ieee;
use ieee.std_logic_1164.all;

entity contadorSincono is

port (
	clk, clear, preset : in std_logic;
	S : in std_logic;
	saida : out std_logic_vector (6 downto 0);
	
	 Qe: out std_logic_vector(2 downto 0)
	);

end contadorSincono;

architecture contadorSincronoArch of contadorSincono is

    component flipFlopJK is
        port(
           	J,K : in std_logic;
				reset, enable : in std_logic;
				clk : in std_logic;
				Q, Qbar: out std_logic
				);
    end component;
    
    signal J, K, qs, qsb:  std_logic_vector(2 downto 0);

begin
                              
    J(2) <= ((qsb(2) or qs(1) or qs(0)) and not S) or ((qs(2) or qs(1) or qs(0)) and S);
	 K(2) <= ((qsb(2) and qsb(1) and qsb(0)) and not S) or ((qsb(2) or qs(1) or qs(0)) and S);
	 
	 J(1) <= (((qsb(2) or qsb(1) or qs(0)) and (qsb(2) or qs(1) or qs(0))) and not S) or ((qsb(1) and qs(0)) and S);
	 K(1) <= ((qs(1) and qsb(0)) and not S) or ((qs(1) and qs(0)) and S);
	 
	 J(0) <= '0';
	 K(0) <= '0';
	 
	 S01: flipFlopJK port map (J(0), K(0), clk, '0', '0', qs(0), qsb(0)); 
    S02: flipFlopJK port map (J(1), K(1), clk, '0', '0', qs(1), qsb(1));
    S03: flipFlopJK port map (J(2), K(2), clk, '0', '0', qs(2), qsb(2));
    
    Qe <= qs;
end contadorSincronoArch;