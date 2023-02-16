library ieee;
library std;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tb_fetch is
end entity;

architecture beh of tb_fetch is
    constant tco: time:= 1 ns;
    constant Ts: time:= 100 ns;

    component fetch is
        port(
            clk: in std_logic;
            rst_n: in std_logic;
            if_id_enable: in std_logic;
            if_id_flush: in std_logic;
            pc_enable: in std_logic;
            pc_src: in std_logic;
            pc_skip: in std_logic_vector(10 downto 0);
            pc: out std_logic_vector(10 downto 0);
            instruction: out std_logic_vector(31 downto 0)
        );
    end component;

    --signal declarations
    signal clk: std_logic := '0';
    signal rst_n: std_logic := '0';
    signal if_id_enable: std_logic := '0';
    signal if_id_flush: std_logic := '0';
    signal sPC_enable: std_logic := '0';
    signal sPC_src: std_logic := '0';
    signal sPC_skip: std_logic_vector(10 downto 0) := (others => '0');
    signal sPC: std_logic_vector(10 downto 0) := (others => '0');
    signal sInstruction: std_logic_vector(31 downto 0) := (others => '0');

begin --beh

    --instantiate the dut
    fetch_unit: fetch
    port map(
        clk => clk,
        rst_n => rst_n,
        if_id_enable => if_id_enable,
        if_id_flush => if_id_flush,
        pc_enable => sPC_enable,
        pc_src => sPC_src,
        pc_skip => sPC_skip,
        pc => sPC,
        instruction => sInstruction
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

       -- Stimulus process
       Stimulus: process
       begin
           -- Wait for reset to complete
           wait until rst_n = '1';
           wait for tco;
   
           -- Enable the pipeline register & pc
           if_id_flush <= '1';
           sPC_enable <= '1';

           -- Set the program counter source to be the default (sequential)
           sPC_src <= '1';
           
           -- Wait for 5 clock cycles
           wait for 5*Ts;
   
           -- Set the program counter source to be the jump\branch
           sPC_skip <= std_logic_vector(to_unsigned(24, sPC_skip'length));
           sPC_src <= '0';
   
           -- Wait for 5 clock cycles
           wait for 5*Ts;
   
           -- Flush the pipeline register
           if_id_flush <= '0';
           wait for tco;
           if_id_enable <= '0';
           
           -- Wait for one clock cycle
           wait for Ts;
       end process;

end architecture;