library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ssram_interface is
  port (
    CLK    : in  std_logic;
    WEN_dm    : in  std_logic;
    WEN_im    : in  std_logic;
    REN_dm   : in std_logic;
    DIN_dm    : in  std_logic_vector(63 downto 0);
    DIN_im    : in  std_logic_vector(31 downto 0);
    ADX_dm    : in  std_logic_vector(10 downto 0);
    ADX_im    : in  std_logic_vector(10 downto 0);
    DOUT_dm    : out std_logic_vector(63 downto 0);
    DOUT_im    : out std_logic_vector(31 downto 0)
  );
end entity ssram_interface;

architecture beh of ssram_interface is

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

  instruction_memory : sram_32_1024_freepdk45
    port map (
      clk0  => CLK,
      csb0  => ADX_im(10),
      web0  => WEN_im,
      addr0 => ADX_im(9 downto 0),
      din0  => DIN_im(31 downto 0),
      dout0 => DOUT_im);

  data_memory0 : sram_32_1024_freepdk45
    port map (
      clk0  => CLK,
      csb0  => ADX_dm(10),
      web0  => WEN_dm,
      addr0 => ADX_dm(9 downto 0),
      din0  => DIN_dm(31 downto 0),
      dout0 => DOUT_dm(31 downto 0));

  data_memory1 : sram_32_1024_freepdk45
    port map (
      clk0  => CLK,
      csb0  => ADX_dm(10),
      web0  => WEN_dm,
      addr0 => ADX_dm(9 downto 0),
      din0  => DIN_dm(63 downto 32),
      dout0 => DOUT_dm(63 downto 32));
 			
end architecture beh;

