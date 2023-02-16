library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity program_counter is
    port ( 
        clk: in std_logic;
        rst_n: in std_logic;
        mem_rdy: in std_logic;
        pc_src: in std_logic;
        pc_enable: in std_logic;
        pc_inc: in std_logic_vector(10 downto 0);    --increment
        pc_skip : in std_logic_vector(10 downto 0);  --branch or jump
        pc_out: out std_logic_vector(10 downto 0));
end program_counter;

architecture beh of program_counter is
    signal pc : std_logic_vector(10 downto 0);
begin

    -- multiplexer logic
    pc <=   pc_inc when pc_src = '1' else
            pc_skip when pc_src = '0';

    -- register logic
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            pc <= (others => '0');
        elsif clk'event and clk = '1' and mem_rdy = '1' then 
            if pc_enable = '1' then
                pc_out <= pc;
            end if;
        end if;
    end process;

end beh;
