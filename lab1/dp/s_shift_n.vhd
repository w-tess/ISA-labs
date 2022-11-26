library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- signed shifter on "N" bits
entity s_shift_n is
	
	generic (
		SH : integer := 1;
		N : integer := 8
	);

	port (
		ina : in signed(N-1 downto 0);
		outa : out signed(N-1 downto 0)
	);

end entity s_shift_n;

architecture behavioral of s_shift_n is
begin
	
	shift_proc : process (ina) is
	begin
		if (SH > 0) then
			outa <= shift_left(ina, SH);
		else
			outa <= shift_right(ina, abs(SH));
		end if;
	end process;

end architecture behavioral;