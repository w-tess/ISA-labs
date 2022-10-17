library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- signed adder on "N" bits
entity s_adder_n is

	generic (
		N : integer := 8
	);

	port (
		ina, inb: in signed(N-1 downto 0);
		outc: out signed(N downto 0)
	);

end entity s_adder_n;

architecture behavioral of s_adder_n is
begin
	
	-- resize() does a sign extension 
	outc <= resize(ina, N+1) + resize(inb, N+1);
		
end architecture behavioral;