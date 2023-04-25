library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- signed adder on "N" bits
entity adder_n is

	generic (
		N : integer := 12
	);

	port (
		ina, inb : in signed(N-1 downto 0);
		outc : out signed(N-1 downto 0)
	);

end entity adder_n;

architecture behavioral of adder_n is
begin
	
	outc <= ina + inb;
		
end architecture behavioral;