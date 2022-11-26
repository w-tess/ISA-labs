library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity iir_filter_la is

	generic (
		NBIT: integer := 9);
	port (
		CLK : in std_logic;
		DIN : in signed (NBIT-1 downto 0);
		VIN : in std_logic;
		RST_n : in std_logic;
    	B0 : in signed (NBIT-1 downto 0);
    	B1 : in signed (NBIT-1 downto 0);
    	B2 : in signed (NBIT-1 downto 0);
    	B3 : in signed (NBIT-1 downto 0);
    	A2 : in signed (NBIT-1 downto 0);
    	A3 : in signed (NBIT-1 downto 0);
		VOUT : out std_logic;
    	DOUT : out signed (NBIT-1 downto 0)
	);

end entity iir_filter_la;

architecture str of iir_filter_la is

component cu
	port (
		CLK : in std_logic;
		RST_n : in std_logic;
		VIN : in std_logic;
		LE1 : out std_logic;
		LE2 : out std_logic;
		LE3 : out std_logic;
		RSTN : out std_logic;
		DONE : out std_logic);
end component;

component iir_filter_la_dp
  	port (
   		clk : in std_logic;
   		din : in signed(NBIT-1 downto 0);
   		le1, le2, le3 : in std_logic;
   		rstn, done : in std_logic;
   		b0 : in signed(NBIT-1 downto 0);
   		b1 : in signed(NBIT-1 downto 0);
   		b2 : in signed(NBIT-1 downto 0);
   		b3 : in signed(NBIT-1 downto 0);
   		a2 : in signed(NBIT-1 downto 0);
   		a3 : in signed(NBIT-1 downto 0);
   		vout : out std_logic;
   		dout : out signed(NBIT-1 downto 0));
end component;

signal logic_enable1 : std_logic;
signal logic_enable2 : std_logic;
signal logic_enable3 : std_logic;
signal reset : std_logic;
signal dn : std_logic;
  
begin --str
	
	my_cu: cu
	port map (
		CLK => CLK,
		RST_n => RST_n,
		VIN => VIN,
		LE1 => logic_enable1,
		LE2 => logic_enable2,
		LE3 => logic_enable3,
		RSTN => reset,
		DONE => dn
	);
	
	my_dp: iir_filter_la_dp
	port map (
		clk => CLK,
		din => DIN,
		le1 => logic_enable1,
		le2 => logic_enable2,
		le3 => logic_enable3,
		rstn => reset,
		done => dn,
		b0 => B0,
		b1 => B1,
		b2 => B2,
		b3 => B3,
		a2 => A2,
		a3 => A3,
		vout => VOUT,
		dout => DOUT
	);

end architecture str;
