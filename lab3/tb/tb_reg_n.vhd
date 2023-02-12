library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_reg_n is
end entity tb_reg_n;

architecture test of tb_reg_n is
	
	component reg_n is  
		generic (
			N : integer := 12;
			RST_V : std_logic := '1';
			CLK_V : std_logic := '1'
		);
		port (
			d : in signed(N-1 downto 0);   
			rst, clk, le : in std_logic;   
			q : out signed(N-1 downto 0)
		);
	end component reg_n; 

	signal tb_d, tb_q : signed(7 downto 0);
	signal tb_rst, tb_clk, tb_le : std_logic;

begin
	
	DUT : reg_n 
		generic map(N => 8)
		port map(
			d => tb_d, 
			q => tb_q, 
			rst => tb_rst, 
			clk => tb_clk, 
			le => tb_le
		);
	
	clk_gen : process is
	begin
		tb_clk <= '0', '1' after 5 ns;
		wait for 10 ns;
	end process;

	tb_d <= X"D1", X"8A" after 10 ns, X"7B" after 20 ns,
				   X"24" after 30 ns, X"09" after 40 ns;

	tb_rst <= '0', '1' after 50 ns, '0' after 60 ns;

	tb_le <= '1', '0' after 20 ns, '1' after 30 ns;
	
end architecture test;