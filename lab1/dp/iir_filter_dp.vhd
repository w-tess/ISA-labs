library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity iir_filter_dp is

	generic (
		NB : integer := 9;
		SHAMT : integer := 11
	);

	port (
		din : in signed(NB-1 downto 0);
		a1, a2 : in signed(NB-1 downto 0);
		b0, b1, b2 : in signed(NB-1 downto 0);
		clk, le1, le2, le3 : in std_logic;
		rstn, done : in std_logic;
		vout : out std_logic;
		dout : out signed(NB-1 downto 0)
	);
end entity iir_filter_dp;

architecture behavioral of iir_filter_dp is
	
	component dff is

		generic(
			RST_V : std_logic := '1';
			CLK_V : std_logic := '1'
		);	
	
		port(
			d_in, clk : in std_logic;
			rst, en : in std_logic;
			d_out : out std_logic
		);
	
	end component dff;

	component s_reg_n is  

		generic (
			N : integer := 8;
			RST_V : std_logic := '1';
			CLK_V : std_logic := '1'
		);
		
		port (
			d_in : in signed(N-1 downto 0);
			rst, clk, en : in std_logic;   
			d_out : out signed(N-1 downto 0)
		);
				
	end component s_reg_n; 

	component s_adder_n is

		generic (
			N : integer := 8
		);
	
		port (
			ina, inb: in signed(N-1 downto 0);
			outc: out signed(N downto 0)
		);
	
	end component s_adder_n;

	component s_multiplier_n is

		generic (
			N : integer := 8
		);
	
		port (
			ina, inb : in signed(N-1 downto 0);
			outc : out signed(2*N-1 downto 0)
		);
	
	end component s_multiplier_n;

	signal xi, yi : signed(NB-1 downto 0);
	signal ff, fb : signed(NB-1 downto 0);
	signal xi_fb  : signed(NB-1 downto 0);
	signal tmp_fb : signed(NB-1 downto 0);
	signal reg1, reg2 : signed(NB-1 downto 0);

	type tmp_mult_t is array(0 to 4) of signed(2*NB-1 downto 0);
	type mult_t is array(0 to 4) of signed(NB-1 downto 0);
	signal tmp_mult : tmp_mult_t;
	signal out_mult, coeff : mult_t;

begin
	
	add0 : s_adder_n 
		generic map(N => NB) 
		port map(ina => xi, inb => fb, outc => xi_fb);
	add1 : s_adder_n 
		generic map(N => NB)
		port map(ina => out_mult(0), inb => ff, outc => yi);
	add2 : s_adder_n 
		generic map(N => NB)
		port map(ina => out_mult(1), inb => out_mult(3), outc => tmp_fb);
	add3 : s_adder_n 
		generic map(N => NB)
		port map(ina => out_mult(2), inb => out_mult(4), outc => ff);

	mult_b0 : s_multiplier_n 
		generic map(N => NB)
		port map(ina => coeff(0), inb => xi_fb, outc => tmp_mult(0)); 
	mult_a1 : s_multiplier_n
		generic map(N => NB)
		port map(ina => coeff(1), inb => reg1, outc => tmp_mult(1)); 
	mult_b1 : s_multiplier_n
		generic map(N => NB)
		port map(ina => coeff(2), inb => reg1, outc => tmp_mult(2)); 
	mult_a2 : s_multiplier_n
		generic map(N => NB)
		port map(ina => coeff(3), inb => reg2, outc => tmp_mult(3)); 
	mult_b2 : s_multiplier_n
		generic map(N => NB)
		port map(ina => coeff(4), inb => reg2, outc => tmp_mult(4)); 
	
	reg_in : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => din, rst => rstn, 
				 clk => clk, en => le1, d_out => xi);
	reg_out : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => yi, rst => rstn, 
				 clk => clk, en => le2, d_out => dout);
	reg_int1 : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => xi_fb, rst => rstn, 
				 clk => clk, en => le2, d_out => reg1);
	reg_int2 : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => reg1, rst => rstn, 
				 clk => clk, en => le2, d_out => reg2);
	reg_b0 : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => b0, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(0));
	reg_a1 : s_reg_n	
		generic map(N => NB, RST_V => '0')
		port map(d_in => a1, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(1));
	reg_b1 : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => b1, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(2));
	reg_a2 : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => a2, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(3));
	reg_b2 : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => b2, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(4));

	dff_out : dff
		generic map(RST_V => '0')
		port map(d_in => done, clk => clk,
				 rst => rstn, en => le2, d_out => vout);

	-- shift operation on the output of every
	-- multipier is performed by this process
	shift_op : process (tmp_mult) is
		variable tmp_shift : signed(2*NB-1 downto 0);
	begin
		for i in tmp_mult'range loop
			tmp_shift := tmp_mult(i);
			tmp_shift := shift_right(tmp_shift, SHAMT);
			tmp_shift := shift_left(tmp_shift, SHAMT-NB+1);
			out_mult(i) <= tmp_shift(NB-1 downto 0);
		end loop;
	end process;

	-- since a1 and a2 coefficients are inverted
	-- invert again the sum operation, the result
	-- represents fb
	fb <= -tmp_fb;

end architecture behavioral;