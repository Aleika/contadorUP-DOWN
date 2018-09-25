use ieee.std_logic_1164.all;

entity contador_updown is

	port (
	clk, reset, enable : in std_logic;
	S : in std_logic;
	saida : out std_logic_vector (6 downto 0)
	);

end contador_updown; 

architecture contador_updownArch of contadorSincrono is

	component contadorSincrono is
		port (
			Qe: out std_logic_vector(2 downto 0);
			clk: in std_logic
			);
	end component;
	
	component conv_bin_7seg is
		port(
			d: in std_logic_vector(2 downto 0);
		   q: out std_logic_vector(6 downto 0));

		);
	end component;
	
	signal qsaida (2 downto 0)
	
	begin
		process(reset, clk)
		
		if (reset = '0') then
			qsaida <= "000";	
		elsif(clk'event and clk = '0') then)
			if(enable ='0') then
				if(S = '0') then
					qsaida <= contadorSincrono port map (qsaida, clk);
				elsif(S='1') then			
				 ---Um contador decrescente pode ser criado de maneira análoga ao crescente, 
				 --- simplesmente usando as saídas invertidas dos FFs. 
					
				end
			end
		end
	
	saida <= qsaida; --- ou saida <= conv_bin_7seg port map (qsaida, saida);
	
end contador_updownArch;