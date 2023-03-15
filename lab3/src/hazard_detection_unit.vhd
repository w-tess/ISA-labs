library ieee;
use ieee.std_logic_1164.all;

entity hazard_detection_unit is
    port(
        rs1_if_id: in std_logic_vector(4 downto 0);
        rs2_if_id: in std_logic_vector(4 downto 0);
        rd_id_ex: in std_logic_vector(4 downto 0);
        mem_read_id_ex: in std_logic;
        pc_enable: out std_logic;
        if_id_enable: out std_logic;
        control_sel: out std_logic
    );
end entity hazard_detection_unit;

architecture beh of hazard_detection_unit is
begin --beh
    
        process(rs1_if_id, rs2_if_id, rd_id_ex, mem_read_id_ex)
        begin
            -- check if either rs1 or rs2 in ID stage matches rd in EX stage
            -- only if instruction will read the memory
            if mem_read_id_ex = '1' and (rd_id_ex = rs1_if_id or rd_id_ex = rs2_if_id) then
                pc_enable <= '0'; -- stall
                -- insert bubble
                if_id_enable <= '0';
                control_sel <= '0';
            else
                pc_enable <= '1';
                if_id_enable <= '1';
                control_sel <= '1';
            end if;
    end process;
end architecture beh;