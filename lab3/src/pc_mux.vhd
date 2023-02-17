library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_mux is
    port ( 
        pc_src: in std_logic;
        pc_inc: in std_logic_vector(10 downto 0);    --increment
        pc_skip : in std_logic_vector(10 downto 0);  --branch or jump
        pc_out: out std_logic_vector(10 downto 0)
        );
end pc_mux;

architecture beh of pc_mux is
begin

    process(pc_inc, pc_skip, pc_src)
    begin
    if pc_src = '1' then
        pc_out <= pc_inc;
    elsif pc_src = '0' then
        pc_out <= pc_skip;
    end if;
    end process;

end beh;