library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity iir_filter_la_dp is
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
end entity iir_filter_la_dp;

architecture behavioral of iir_filter_la_dp is
	
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
			outc: out signed(N-1 downto 0)
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
	
	type tmp_mpy_t is array(0 to 5) of signed(2*NB-1 downto 0);
	type mpy_t is array(0 to 5) of signed(NB-1 downto 0);
	type add_t is array(0 to 4) of signed(NB-1 downto 0);
	type r_t is array(0 to 10) of signed(NB-1 downto 0);

	signal tmp_mpy : tmp_mpy_t;
	signal mpy, coeff : mpy_t;
	signal add : add_t;
	signal r : r_t;
	
	signal rin : signed(NB-1 downto 0);
	signal rb0, rb1, ra2, rb2, ra3, rb3 : signed(NB-1 downto 0);
	signal tmp_add3 : signed(NB-1 downto 0);
	signal int_le2, int_done : std_logic_vector(0 to 1);

begin
	
	add0_inst : s_adder_n
		generic map(N => NB) 
		port map(ina => rin, inb => add(3), outc => add(0));
	add1_inst : s_adder_n 
		generic map(N => NB)
		port map(ina => r(1), inb => r(3), outc => add(1));
	add2_inst : s_adder_n 
		generic map(N => NB)
		port map(ina => r(4), inb => r(5), outc => add(2));
	add3_inst : s_adder_n 
		generic map(N => NB)
		port map(ina => r(6), inb => r(9), outc => tmp_add3);
	add4_inst : s_adder_n 
		generic map(N => NB)
		port map(ina => r(7), inb => r(10), outc => add(4));

	mpy0_inst : s_multiplier_n 
		generic map(N => NB)
		port map(ina => coeff(0), inb => r(0), outc => tmp_mpy(0)); 
	mpy1_inst : s_multiplier_n
		generic map(N => NB)
		port map(ina => coeff(1), inb => r(2), outc => tmp_mpy(1)); 
	mpy2_inst : s_multiplier_n
		generic map(N => NB)
		port map(ina => coeff(2), inb => r(2), outc => tmp_mpy(2)); 
	mpy3_inst : s_multiplier_n
		generic map(N => NB)
		port map(ina => coeff(3), inb => r(2), outc => tmp_mpy(3)); 
	mpy4_inst : s_multiplier_n
		generic map(N => NB)
		port map(ina => coeff(4), inb => r(8), outc => tmp_mpy(4));
	mpy5_inst : s_multiplier_n
		generic map(N => NB)
		port map(ina => coeff(5), inb => r(8), outc => tmp_mpy(5));

	rin_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => din, rst => rstn, 
				 clk => clk, en => le1, d_out => rin);
	rout_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => add(1), rst => rstn, 
				 clk => clk, en => int_le2(1), d_out => dout);
	r0_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => add(0), rst => rstn, 
				 clk => clk, en => le2, d_out => r(0));
	r1_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => mpy(0), rst => rstn, 
				 clk => clk, en => int_le2(0), d_out => r(1));
	r2_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => add(0), rst => rstn, 
				 clk => clk, en => le2, d_out => r(2));
	r3_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => add(2), rst => rstn, 
				 clk => clk, en => int_le2(0), d_out => r(3));
	r4_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => mpy(1), rst => rstn, 
				 clk => clk, en => le2, d_out => r(4));
	r5_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => add(4), rst => rstn, 
				 clk => clk, en => le2, d_out => r(5));
	r6_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => mpy(2), rst => rstn, 
				 clk => clk, en => le2, d_out => r(6));
	r7_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => mpy(3), rst => rstn, 
				 clk => clk, en => le2, d_out => r(7));
	r8_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => r(2), rst => rstn, 
				 clk => clk, en => le2, d_out => r(8));
	r9_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => mpy(4), rst => rstn, 
				 clk => clk, en => le2, d_out => r(9));
	r10_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => mpy(5), rst => rstn, 
				 clk => clk, en => le2, d_out => r(10));
	rb0_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => b0, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(0));
	rb1_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => b1, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(1));
	ra2_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => a2, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(2));
	rb2_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => b2, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(3));
	ra3_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => a3, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(4));
	rb3_inst : s_reg_n
		generic map(N => NB, RST_V => '0')
		port map(d_in => b3, rst => '1', 
				 clk => clk, en => le3, d_out => coeff(5));
	
	dff0_inst : dff
		generic map(RST_V => '0')
		port map(d_in => le2, clk => clk,
				 rst => rstn, en => le1, d_out => int_le2(0));
	dff1_inst : dff
		generic map(RST_V => '0')
		port map(d_in => int_le2(0), clk => clk,
				 rst => rstn, en => le1, d_out => int_le2(1));
	dff2_inst : dff
		generic map(RST_V => '0')
		port map(d_in => done, clk => clk,
				 rst => rstn, en => le1, d_out => int_done(0));
	dff3_inst : dff
		generic map(RST_V => '0')
		port map(d_in => int_done(0), clk => clk,
				 rst => rstn, en => le1, d_out => int_done(1));
	dff4_inst : dff
		generic map(RST_V => '0')
		port map(d_in => int_done(1), clk => clk,
				 rst => rstn, en => le1, d_out => vout);

	-- shift operation on the output of every
	-- multipier is performed by this process
	shift_op : process (tmp_mpy) is
		variable tmp_shift : signed(2*NB-1 downto 0);
	begin
		for i in tmp_mpy'range loop
			tmp_shift := tmp_mpy(i);
			tmp_shift := shift_right(tmp_shift, SHAMT);
			tmp_shift := shift_left(tmp_shift, SHAMT-NB+1);
			mpy(i) <= tmp_shift(NB-1 downto 0);
		end loop;
	end process;

	add(3) <= -tmp_add3;

end architecture behavioral;