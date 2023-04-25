library ieee;
library std;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity instructionMemory is
 port (
	clk: in  std_logic;
	rst_n: in  std_logic;
	adx: in  std_logic_vector(10 downto 0);
	instruction_load_i: in std_logic_vector(31 downto 0);
	address_load_i: in std_logic_vector(10 downto 0);

	dout: out std_logic_vector(31 downto 0)
        );
end entity instructionMemory;

architecture beh of instructionMemory is

  constant tco : time := 1 ns;

  component sram_32_1024_freepdk45
    port (
      clk0    : in  std_logic;
      csb0    : in  std_logic;
      web0    : in  std_logic;
      addr0   : in  std_logic_vector(9 downto 0);
      din0    : in  std_logic_vector(31 downto 0);
      dout0   : out std_logic_vector(31 downto 0)
    );
  end component sram_32_1024_freepdk45;
  
  -- Signal declarations
signal wen: std_logic := '1';
signal data_out: std_logic_vector(31 downto 0) := (others => '0');
signal sADX: std_logic_vector(10 downto 0);

begin  -- architecture beh

  instruction_memory : sram_32_1024_freepdk45
    port map (
      clk0  => clk,
      csb0  => sADX(10),
      web0  => wen,
      addr0 => sADX(9 downto 0),
      din0  => instruction_load_i(31 downto 0),
      dout0 => data_out
	);
 		  
  dout <= (others => '0') when adx = "11111111100" else data_out;

	wen <= '0' when rst_n = '0' else
	       '1' when rst_n = '1';

	sADX <= address_load_i when rst_n = '0' else
	        adx when rst_n = '1';


--	-- Process to allow memory initialization
--  	process
--	begin
--	if rst_n = '0' then
--		wen <= '0';
--		sADX <= address_load_i;
--		
--	else
--    		wen <= '1';
--		sADX <= adx;
--    	end if;
--  	end process;
	
end architecture beh;
