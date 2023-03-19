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
    dout: out std_logic_vector(31 downto 0);
	rdy: out  std_logic
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
signal wen: std_logic := '0';
signal din: std_logic_vector(31 downto 0) := (others => '0');
signal sADX: std_logic_vector(10 downto 0) := "11111111100";

begin  -- architecture beh

  instruction_memory : sram_32_1024_freepdk45
    port map (
      clk0  => clk,
      csb0  => sADX(10),
      web0  => wen,
      addr0 => sADX(9 downto 0),
      din0  => din(31 downto 0),
      dout0 => dout(31 downto 0)
	);
 		  
	-- Process to initialize instructions to memory and to read
  	process (clk, rst_n, adx)
		FILE fp : text open read_mode is "code.hex";
 		variable read_line : line;
 		variable instruction : std_logic_vector(31 downto 0);
	begin
		if rst_n = '0' then
			rdy <= '0';
			wen <= '0' after tco;
		elsif (clk'event and clk = '0') or adx'event then  --falling clock edge
      	if not endfile(fp) then
				readline(fp, read_line);
      			hread(read_line, instruction);	--content of the line read in -instruction-
				wen <= '0' after tco;
        		din <= instruction after tco;
				sADX <= sADX + 4 after tco;
			else
				rdy <= '1' after 51 ns;
				wen <= '1';
				sADX <= adx after tco;
			end if;
    	end if;
  	end process;
	
end architecture beh;
