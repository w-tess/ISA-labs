library ieee;
use ieee.std_logic_1164.all;

entity program_counter is
    port(
        clk: in std_logic;
        rst_n: in std_logic;
        pc_enable: in std_logic;
        pc_src: in std_logic;       -- 1 for pc_inc, 0 for ps_skip
        pc_inc: in std_logic_vector(10 downto 0);    --increment
        pc_skip : in std_logic_vector(10 downto 0);  --branch or jump
        pc_out: out std_logic_vector(10 downto 0)
        ); 
end entity;

architecture beh of program_counter is

signal sPC: std_logic_vector(10 downto 0);

    component pc
        port(
            clk: in std_logic;
            rst_n: in std_logic;
            pc_enable: in std_logic;
            pc_in: in std_logic_vector(10 downto 0);
            pc_out: out std_logic_vector(10 downto 0)
        );
        end component;

    component pc_mux
        port(
            pc_src: in std_logic;
            pc_inc: in std_logic_vector(10 downto 0);    --increment
            pc_skip : in std_logic_vector(10 downto 0);  --branch or jump
            pc_out: out std_logic_vector(10 downto 0)
        );
    end component;

begin --beh
    my_pc: pc
    port map(
        clk => clk,
        rst_n => rst_n,
        pc_enable => pc_enable,
        pc_in => sPC,
        pc_out => pc_out
    );

    my_pc_mux: pc_mux
    port map(
        pc_src => pc_src,
        pc_inc => pc_inc,
        pc_skip => pc_skip,
        pc_out => sPC
    );
end architecture;