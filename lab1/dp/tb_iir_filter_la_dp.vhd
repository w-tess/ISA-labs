library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_iir_filter_la_dp is
end entity tb_iir_filter_la_dp;

architecture test of tb_iir_filter_la_dp is
	
	component iir_filter_la_dp is

		generic (
			NB : integer := 9;
			SHAMT : integer := 10
		);

		port (
			din : in signed(NB-1 downto 0);
			a2, a3 : in signed(NB-1 downto 0);
			b0, b1, b2, b3 : in signed(NB-1 downto 0);
			clk, le1, le2, le3 : in std_logic;
			rstn, done : in std_logic;
			vout : out std_logic;
			dout : out signed(NB-1 downto 0)
		);
	end component iir_filter_la_dp;

	signal tb_din : signed(8 downto 0);
	signal tb_a2, tb_a3 : signed(8 downto 0);
	signal tb_b0, tb_b1, tb_b2, tb_b3 : signed(8 downto 0);
	signal tb_le1, tb_le2, tb_le3 : std_logic;
	signal tb_clk, tb_rstn, tb_done : std_logic;
	signal tb_vout : std_logic;
	signal tb_dout : signed(8 downto 0);

begin
	
	DUT : iir_filter_la_dp 
		generic map(NB => 9, SHAMT => 10)
		port map(
			din => tb_din,
			a2 => tb_a2,
			a3 => tb_a3,
			b0 => tb_b0,
			b1 => tb_b1,
			b2 => tb_b2,
			b3 => tb_b3,
			clk => tb_clk,
			le1 => tb_le1,
			le2 => tb_le2,
			le3 => tb_le3,
			rstn => tb_rstn,
			done => tb_done,
			vout => tb_vout,
			dout => tb_dout
		);
	
	clk_gen : process is
	begin
		tb_clk <= '0', '1' after 5 ns;
		wait for 10 ns;
		--if(tb_din'quiet(15 ns) and tb_dout'stable(15 ns)) then
		--	wait;
		--end if;
	end process clk_gen;

	data_gen : process is
	begin
		tb_din <= (others => '0');
		wait for 10 ns;
		tb_din <= (others => '0');
		wait for 10 ns;
		tb_din <= to_signed(79,9);
		wait for 10 ns;
		tb_din <= (others => '0');
		wait for 10 ns;
		tb_din <= to_signed(207,9);
		wait for 10 ns;
		tb_din <= (others => '0');
		wait for 10 ns;
		tb_din <= to_signed(255,9);
		wait for 10 ns;
		tb_din <= (others => '1');
		wait for 10 ns;
		tb_din <= to_signed(207,9);
		wait for 10 ns;
		tb_din <= to_signed(26,9);
		wait for 10 ns;
		tb_din <= to_signed(-74,9);
		wait for 10 ns;
		tb_din <= (others => '1');
		wait for 10 ns;
		tb_din <= to_signed(79,9);
		wait for 10 ns;
		tb_din <= (others => '1');
		wait for 10 ns;
		tb_din <= to_signed(-80,9);
		wait;
	end process data_gen;
	
	ctrl_gen : process is
	begin
		tb_rstn <= '0';	tb_le1 <= '0'; tb_le2 <= '0'; tb_le3 <= '1'; tb_done <= '0'; -- reset
		wait for 10 ns;
		tb_rstn <= '1';	tb_le1 <= '1'; tb_le2 <= '0'; tb_le3 <= '0'; tb_done <= '0'; -- idle
		wait for 10 ns;
		tb_rstn <= '1';	tb_le1 <= '1'; tb_le2 <= '1'; tb_le3 <= '0'; tb_done <= '1'; -- valid
		wait for 80 ns;
		tb_rstn <= '1';	tb_le1 <= '1'; tb_le2 <= '0'; tb_le3 <= '0'; tb_done <= '0'; -- idle
		wait for 20 ns;
		tb_rstn <= '1';	tb_le1 <= '1'; tb_le2 <= '1'; tb_le3 <= '0'; tb_done <= '1'; -- valid
		wait for 60 ns;
		tb_rstn <= '0';	tb_le1 <= '0'; tb_le2 <= '0'; tb_le3 <= '0'; tb_done <= '0'; -- reset
		wait;
	end process ctrl_gen;
	
	tb_a2 <= to_signed(15,9);
	tb_a3 <= to_signed(18,9);
	tb_b0 <= to_signed(52,9);
	tb_b1 <= to_signed(125,9);
	tb_b2 <= to_signed(91,9);
	tb_b3 <= to_signed(19,9);
	
end architecture test;