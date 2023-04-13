library ieee;
library std;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tb_riscv is
end entity;

architecture beh of tb_riscv is
    constant tco: time:= 1 ns;
    constant Ts: time:= 100 ns;

    component riscv is
        port(
            clk: in std_logic;
            rst_n: in std_logic;
	        instruction_load: in std_logic_vector(31 downto 0);
	        instruction_address: in std_logic_vector(10 downto 0);
            data_load: in std_logic_vector(31 downto 0);
            data_address: in std_logic_vector(10 downto 0)
        );
    end component;

    --signal declarations
    signal clk: std_logic := '0';
    signal rst_n_sig: std_logic := '0';
    signal im_ready: std_logic := '0';
    signal dm_ready: std_logic := '0';
    signal iADX: std_logic_vector(10 downto 0) := "11111111100";
    signal iin: std_logic_vector(31 downto 0) := (others => '0');
    signal dADX: std_logic_vector(10 downto 0) := "11111111100";
    signal din: std_logic_vector(31 downto 0) := (others => '0');

begin --beh
    rst_n_sig <= im_ready and dm_ready;
    --instantiate the dut
    riscv_lite: riscv
    port map(
        clk => clk,
        rst_n => rst_n_sig,
        instruction_load => iin,
        instruction_address => iADX,
        data_load => din,
        data_address => dADX
    );

    -- Clock generator
    process
    begin  -- process
        clk <= not(clk);
        wait for Ts/2;
    end process;

--    -- Reset generator
--    process
--    begin  -- process
--        rst_n <= '0';
--        wait for 5*(Ts/2);
--        rst_n <= '1';
--        wait;
--    end process;

-- Process to initialize instructions to memory and to read
  	process (clk)
		FILE fp : text open read_mode is "code.hex";
 		variable read_line : line;
 		variable instruction : std_logic_vector(31 downto 0);
	begin
      	if not endfile(fp) then
		if (clk'event and clk = '0') then  --falling clock edge
			im_ready <= '0';
			readline(fp, read_line);
	      		hread(read_line, instruction);	--content of the line read in -instruction-	
	        iin <= instruction after tco;
			iADX <= iADX + 4 after tco;
		end if;
	else
		im_ready <= '1' after Ts;
	end if;
  	end process;

-- Process to initialize data memory
process (clk)
    FILE fp2 : text open read_mode is "data.hex";
     variable read_line_data : line;
     variable read_data : std_logic_vector(31 downto 0);
begin
    if not endfile(fp2) then
        if (clk'event and clk = '0') then  --falling clock edge
            dm_ready <= '0';
            readline(fp2, read_line_data);
            hread(read_line_data, read_data);	--content of the line read in -data-	
            din <= read_data after tco;
            dADX <= dADX + 4 after tco;
        end if;
        dm_ready <= '1';
    end if;
  end process;
end architecture;