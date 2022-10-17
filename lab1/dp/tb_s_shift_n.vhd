library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_s_shift_n is
end entity tb_s_shift_n;

architecture test of tb_s_shift_n is
	
	component s_shift_n is
	
		generic (
			SH : integer := 1;
			N : integer := 8
		);
	
		port (
			ina : in signed(N-1 downto 0);
			outa : out signed(N-1 downto 0)
		);
	
	end component s_shift_n;

	signal tb_ina, tb_out0, tb_out1, tb_out2 : signed(7 downto 0);

begin
	
	-- three instantiations to check different shift outputs
	DUT0 : s_shift_n generic map (SH => 2)
					 port map (ina => tb_ina, outa => tb_out0);

	DUT1 : s_shift_n generic map (SH => 5)
					 port map (ina => tb_ina, outa => tb_out1);

	DUT2 : s_shift_n generic map (SH => -3)
					 port map (ina => tb_ina, outa => tb_out2);

	tb_ina <= X"C2", X"36" after 5 ns, X"0A" after 10 ns,
					 X"4D" after 15 ns, X"1F" after 20 ns;
	
end architecture test;