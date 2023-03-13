library ieee;
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
            rst_n: in std_logic
        );
    end component;

    --signal declarations
    signal clk: std_logic := '0';
    signal rst_n: std_logic := '0';

begin --beh

    --instantiate the dut
    riscv_lite: riscv
    port map(
        clk => clk,
        rst_n => rst_n
    );

    -- Clock generator
    process
    begin  -- process
        clk <= not(clk);
        wait for Ts/2;
    end process;

    -- Reset generator
    process
    begin  -- process
        rst_n <= '0';
        wait for 5*(Ts/2);
        rst_n <= '1';
    end process;
end architecture;