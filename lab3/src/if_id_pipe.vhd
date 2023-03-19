library ieee;
use ieee.std_logic_1164.all;

entity if_id_pipe is
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
end entity if_id_pipe;

architecture rtl of if_id_pipe is
begin
    process(clk, rst_n, flush)
    begin
        if rst_n = '0' then
            pc_out <= (others => '0');
            instruction_out <= (others => '0');
        elsif CLK'event and CLK = '1' then  -- rising clock edge
	    if flush = '0' then
            	pc_out <= (others => '0');
           	instruction_out <= (others => '0');
            elsif enable = '1' then
                pc_out <= pc_in;
                instruction_out <= instruction_in;

            end if;
        end if;
    end process;
end architecture rtl;
