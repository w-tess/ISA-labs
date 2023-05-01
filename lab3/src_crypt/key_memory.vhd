library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity key_memory is
  port (
    clk : in  std_logic;
    rst_n: in  std_logic;
    key_write : in  std_logic_vector(31 downto 0);
    adx_read : in  std_logic_vector(10 downto 0);
    adx_write : in  std_logic_vector(10 downto 0);

    kout : out std_logic_vector(31 downto 0)
  );
end entity key_memory;

architecture beh of key_memory is

-- Signal declarations
signal key_out: std_logic_vector(31 downto 0);
signal sADX: std_logic_vector(10 downto 0);

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

key_memory_a : sram_32_1024_freepdk45
    port map (
      clk0  => clk,
      csb0  => sADX(10),
      web0  => rst_n,
      addr0 => sADX(9 downto 0),
      din0  => key_write(31 downto 0),
      dout0 => key_out
	);

kout <= (others => '0') when adx_read = "00111111100" else key_out;

sADX <= adx_write when rst_n = '0' else
        adx_read when rst_n = '1';

end architecture beh;
