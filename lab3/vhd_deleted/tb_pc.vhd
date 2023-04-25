library ieee;
library std;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tb_pc is
end entity;

architecture beh of tb_pc is
    constant tco: time:= 1 ns;
    constant Ts: time:= 100 ns;

    component program_counter is
        port ( 
            clk: in std_logic;
            rst_n: in std_logic;
            mem_rdy: in std_logic;
            pc_src: in std_logic;
            pc_enable: in std_logic;
            pc_inc: in std_logic_vector(10 downto 0);    --increment
            pc_skip : in std_logic_vector(10 downto 0);  --branch or jump
            pc_out: out std_logic_vector(10 downto 0)
            );
    end component program_counter;

    --signal declarations
    signal clk: std_logic := '0';
    signal rst_n: std_logic := '0';
    signal sMem_rdy: std_logic := '0';
    signal sPC_enable: std_logic := '0';
    signal sPC_src: std_logic := '1';
    signal sPC_skip: std_logic_vector(10 downto 0) := (others => '1');
    signal sPC_inc: std_logic_vector(10 downto 0) := (others => '0');
    signal sPC_out: std_logic_vector(10 downto 0) := (others => '0');

begin --beh

    --instantiate the dut
    my_pc: program_counter
    port map(
        clk => clk,
        rst_n => rst_n,
        mem_rdy => sMem_rdy,
        pc_src => sPC_src,
        pc_enable => sPC_enable,
        pc_inc => sPC_inc,
        pc_skip => sPC_skip,
        pc_out => sPC_out
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
        -- Wait for reset to complete
        wait for tco;

        -- Enable the pc
        sPC_enable <= '1';
        
        -- Wait for 5 clock cycles
        wait for 5*Ts;

        -- Set the program counter source to be the jump\branch
        sPC_skip <= std_logic_vector(to_unsigned(24, sPC_skip'length));
        sPC_src <= '0';

        -- Wait for 5 clock cycles
        wait for 5*Ts;
        
        -- Enable the pc
        sPC_enable <= '0';

        wait for 5*Ts;

        -- Memory ready
        sMem_rdy <= '1';

        -- Enable the pc & change source
        sPC_enable <= '1';
        sPC_src <= '1';
        sPC_inc <= sPC_inc + 1;
        
        -- Wait for 5 clock cycles
        wait for 5*Ts;

        -- Set the program counter source to be the jump\branch
        sPC_skip <= std_logic_vector(to_unsigned(24, sPC_skip'length));
        sPC_src <= '0';
        wait for 5*Ts;
        sPC_skip <= std_logic_vector(to_unsigned(68, sPC_skip'length));
        wait for Ts;
        
    end process;
end architecture;