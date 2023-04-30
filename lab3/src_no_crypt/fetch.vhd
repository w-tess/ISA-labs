library ieee;
library std;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity fetch is
    port(
        clk: in std_logic;
        rst_n: in std_logic;
        if_id_enable: in std_logic;
        if_id_flush: in std_logic;
        pc_enable: in std_logic;
        pc_src: in std_logic;
        pc_skip: in std_logic_vector(10 downto 0);
	instruction_load_f: in std_logic_vector(31 downto 0);
	address_load_f: in std_logic_vector(10 downto 0);
	
        pc: out std_logic_vector(10 downto 0);
        instruction: out std_logic_vector(31 downto 0)
    );
end entity;

architecture beh of fetch is

    component instructionMemory
        port (
            clk: in  std_logic;
            rst_n: in  std_logic;
            adx: in  std_logic_vector(10 downto 0);
	    instruction_load_i: in std_logic_vector(31 downto 0);
	    address_load_i: in std_logic_vector(10 downto 0);


            dout: out std_logic_vector(31 downto 0)
          );
        end component instructionMemory;

    component if_id_pipe
        port (
            clk: in std_logic;
            rst_n: in std_logic;
            enable: in std_logic;
            flush: in std_logic;
            pc_in: in std_logic_vector(10 downto 0);
            instruction_in: in std_logic_vector(31 downto 0);
            pc_out: out std_logic_vector(10 downto 0);
            instruction_out: out std_logic_vector(31 downto 0)
        );
    end component if_id_pipe;

    component program_counter
        port ( 
            clk: in std_logic;
            rst_n: in std_logic;
            pc_src: in std_logic;
            pc_enable: in std_logic;
            pc_inc: in std_logic_vector(10 downto 0);    --increment
            pc_skip : in std_logic_vector(10 downto 0);  --branch or jump
            pc_out: out std_logic_vector(10 downto 0)
        );
    end component program_counter;

    component adder_pc
        port (
            pc: in std_logic_vector(10 downto 0);
            pc_inc: out std_logic_vector(10 downto 0)
        );
    end component adder_pc;

    -- Signal declarations
    signal sPC: std_logic_vector(10 downto 0);
    signal sPC_inc: std_logic_vector(10 downto 0);
    signal sInstruction: std_logic_vector(31 downto 0);
    signal sPC_decr: std_logic_vector(10 downto 0);

begin --beh
    sPC_decr <= sPC;

    programCounter: program_counter
    port map(
        clk => clk,
        rst_n => rst_n,
        pc_src => pc_src,
        pc_enable => pc_enable,
        pc_inc => sPC_inc,
        pc_skip => pc_skip,
        pc_out => sPC
    );

    pc_increment: adder_pc
    port map(
        pc => sPC,
        pc_inc => sPC_inc
    );

    if_id_pipelineRegister: if_id_pipe
    port map(
        clk => clk,
        rst_n => rst_n,
        enable => if_id_enable,
        flush => if_id_flush,
        pc_in => sPC_decr,
        instruction_in => sInstruction,
        pc_out => pc,
        instruction_out => instruction
    );
    
    instruction_memory: instructionMemory
    port map(
        clk => clk,
        rst_n => rst_n,
        adx => sPC,
	instruction_load_i => instruction_load_f,
	address_load_i => address_load_f,

        dout => sInstruction
    );

end architecture beh;
