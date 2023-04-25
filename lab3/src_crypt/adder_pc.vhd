library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_pc is
    port (
        pc: in std_logic_vector(10 downto 0);
        pc_inc: out std_logic_vector(10 downto 0)
    );
end entity adder_pc;

architecture rtl of adder_pc is
begin
    pc_inc <= std_logic_vector(unsigned(pc) + 4);
end architecture rtl;
