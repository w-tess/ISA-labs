library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- signed synchronous register
entity reg_n is  
	
	-- N = I/O bit-width
	-- RST_V = reset value on reset
	-- CLK_V = clock value during sample
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
			
end entity reg_n; 
 
architecture behavioral of reg_n is 
begin 

	process (clk) is
	begin  
		if (clk'event and clk = CLK_V) then
			if (rst = RST_V) then
				q <= (others => '0');
			elsif (le = '1') then
				q <= d;
			end if;
		end if;		
	end process; 
	
end architecture behavioral;