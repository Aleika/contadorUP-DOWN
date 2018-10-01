library ieee;
use ieee.std_logic_1164.all;

entity conv_bin_7seg is
	port
	(
		eA,eB,eC,eD	: in  std_logic;
		display: out std_logic_vector(6 downto 0)

	);
end conv_bin_7seg;
 
architecture conv_bin_7seg of conv_bin_7seg is
 
 
begin
--lógica que implementa o segmento a de um display (0,1,2,3,4,5,6,7,8,9), sem minimização.
-- 0 -> aceso (ON),  1 -> apagado (OFF)
 
display(0) <= (NOT eD AND NOT eC AND NOT eB AND eA) OR  
		(NOT eD AND eC AND NOT eB AND NOT eA);
--implemente a lógica dos demais segmentos do display (0,1,2,3,4,5,6,7,8,9), sem minimização.
display(1) <= (NOT eD AND eC AND NOT eB AND eA) OR (NOT eD AND eC AND eB AND NOT eA);

display(2) <= (NOT eD AND NOT eC AND  eB AND eA);

display(3) <= (NOT eD AND NOT eC AND NOT eB AND eA) OR (NOT eD AND eC AND NOT eB AND NOT eA) OR(NOT eD AND eC AND eB AND  eA);

display(4) <= (NOT eD AND NOT eC AND NOT eB AND  eA) OR  
		(NOT eD AND NOT eC AND  eB AND  eA) OR
                (NOT eD AND eC AND NOT eB AND NOT eA) OR  
		(NOT eD AND eC AND NOT eB AND eA) OR
                (NOT eD AND  eC AND  eB AND  eA) OR  
		( eD AND NOT eC AND NOT eB AND eA);
display(5) <=            (NOT eD AND NOT eC AND NOT eB AND eA) OR  
		(NOT eD AND NOT eC AND  eB AND NOT eA) OR
                (NOT eD AND NOT eC AND eB AND  eA) OR  
		(NOT eD AND  eC AND  eB AND  eA);
display(6) <=            (NOT eD AND NOT eC AND NOT eB AND NOT eA) OR  
		(NOT eD AND NOT eC AND NOT eB AND  eA) OR
                (NOT eD AND  eC AND  eB AND  eA);
 
end conv_bin_7seg;
