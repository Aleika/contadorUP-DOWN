library ieee;
use ieee.std_logic_1164.all;

entity contadorSincrono is

port (
    Qe: out std_logic_vector(2 downto 0);
    clk: in std_logic
);

end contadorSincrono;

architecture contadorSincronoArch of contadorSincrono is

    component flipFlopJK is
        port(
            J, K, clk,clear, preset: in std_logic;
            Q, Qbar: out std_logic);
    end component;
    
    signal qs, qsb:  std_logic_vector(2 downto 0);

begin
                              
    J2 <= qsb(2) or qs(1) or qs(0);
	 K2 <= qsb(2) and qsb(1) and qsb(0);
	 
	 J1 <= (qsb(2) or qsb(1) or qs(0)) and (qsb(2) or qs(1) or qs(0));
	 K1 <= qs(1) and qsb(0);
	 
	 J0 <= (qsb(2) and qs(0)) or (qs(2)and qs(0));
	 K0 <= qsb(0);
	 
	 S01: flipFlopJK port map (J0, K0 , clk, '1', '1', qs(0), qsb(0)); 
    S02: flipFlopJK port map (J1, K1, clk, '1', '1', qs(1), qsb(1));
    S03: flipFlopJK port map (J2, K2, clk, '1', '1', qs(2), qsb(2));
    
    Qe <= qs;
end contadorSincronoArch;