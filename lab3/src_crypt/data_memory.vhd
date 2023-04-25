library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memory is
  port (
    clk : in  std_logic;
    read : in  std_logic;
    data_write : in  std_logic_vector(31 downto 0);
    adx : in  std_logic_vector(10 downto 0);
    dout : out std_logic_vector(31 downto 0)
  );
end entity data_memory;

architecture beh of data_memory is

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
  
begin  -- architecture beh

data_memory_a : sram_32_1024_freepdk45
    port map (
      clk0  => clk,
      csb0  => adx(10),
      web0  => read,
      addr0 => adx(9 downto 0),
      din0  => data_write(31 downto 0),
      dout0 => dout(31 downto 0)
	);

	
end architecture beh;
