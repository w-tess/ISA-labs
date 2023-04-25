library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_imm_gen is
end entity;

architecture beh of tb_imm_gen is
    constant tco: time:= 10 ns;

    component immediate_gen is
        port ( 
            instruction : in  STD_LOGIC_VECTOR (31 downto 0);
            immediate   : out STD_LOGIC_VECTOR (63 downto 0)
            );
    end component immediate_gen;

    --signal declarations
    signal sInstruction: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sImmediate : STD_LOGIC_VECTOR (63 downto 0);

begin --beh

    --instantiate the dut
    imm_gen: immediate_gen
    port map( 
        instruction => sInstruction,
        immediate => sImmediate
    );

    process
    begin  -- process
        
        wait for tco;
        sInstruction <= x"10010537";
        wait for tco;
        sInstruction <= x"01c18193";
        wait for tco;
        sInstruction <= x"00c12083";
        wait for tco;

    end process;
end architecture;