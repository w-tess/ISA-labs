library ieee;
library std;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity testbench is
end entity testbench;

architecture beh of testbench is

constant tco : time := 1 ns;
constant Ts : time := 100 ns;

component ssram_interface is
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
end component ssram_interface;

  -- Signal declarations
  signal clk: std_logic := '0';
  signal wen_dm: std_logic := '0';
  signal wen_im: std_logic := '0';
  signal ren_dm: std_logic := '0';
  signal din_dm: std_logic_vector(63 downto 0) := (others => '0');
  signal din_im: std_logic_vector(31 downto 0) := (others => '0');
  signal adx_dm: std_logic_vector(10 downto 0) := (others => '0');
  signal adx_im: std_logic_vector(10 downto 0) := (others => '1');
  signal dout_dm: std_logic_vector(63 downto 0);
  signal dout_im: std_logic_vector(31 downto 0);

begin

  -- Instantiate the DUT
  dut: ssram_interface
    port map (
      CLK    => clk,
      WEN_dm     => wen_dm,
      WEN_im     => wen_im,
      REN_dm   => ren_dm,
      DIN_dm    => din_dm,
      DIN_im    => din_im,
      ADX_dm    => adx_dm,
      ADX_im    => adx_im,
      DOUT_dm    => dout_dm,
      DOUT_im    => dout_im
    );
    
  -- Clock generator
  process
  begin  -- process
    clk <= not(clk);
    wait for Ts/2;
  end process;
  
  -- Process to write data to memory   
  process (CLK) is
 	FILE bin_file : text open read_mode is "code.bin";
 	variable data_line : line;
 	variable data_word : std_logic_vector(31 downto 0);
 	variable address : INTEGER := 0;	--use of 0 as start address of the im
  begin  -- process
    if CLK'event and CLK = '1' then  -- rising clock edge
      if not ENDFILE(bin_file) then
        readline(bin_file, data_line);
      	hread(data_line, data_word);	--put the content of the line read in data_word
        adx_im <= std_logic_vector(unsigned(adx_im) + 1) after tco;
        wen_im <= '1' after tco;
        din_im <= data_word after tco;
      else
        wen_im <= '0' after tco;
      end if;
    end if;
  end process;

end architecture beh;

