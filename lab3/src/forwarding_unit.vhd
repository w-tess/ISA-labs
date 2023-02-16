library ieee;
use ieee.std_logic_1164.all;

entity forwarding_unit is
    Port ( 
        rs1_id_ex: in  std_logic_vector(4 downto 0);
        rs2_id_ex: in  std_logic_vector(4 downto 0);
        rd_ex_mem: in  std_logic_vector(4 downto 0);
        rd_mem_wb: in  std_logic_vector(4 downto 0);
        regWrite_ex_mem: in  std_logic;
        regWrite_mem_wb: in  std_logic;
        forwardA: out  std_logic_vector(1 downto 0);
        forwardB: out  std_logic_vector(1 downto 0));
end forwarding_unit;

architecture beh of forwarding_unit is
begin --beh

    -- set default values for outputs
    forwardA <= "00";
    forwardB <= "00";
    
    process(rs1_id_ex, rs2_id_ex, rd_ex_mem, rd_mem_wb, regWrite_ex_mem, regWrite_mem_wb)
        begin
            -- check if either rs1 or rs2 in EX stage matches rd in MEM stage
            -- but only if forwarding instruction will write to a register
            -- and only if Rd for that instruction is not x0
            if regWrite_ex_mem = '1' and rd_ex_mem /= "00000" then
                if rd_ex_mem = rs1_id_ex then
                    forwardA <= "10"; -- set forwardA to 01 (from MEM stage)
                end if;
                if rd_ex_mem = rs2_id_ex then
                    forwardB <= "10"; -- set forwardB to 01 (from MEM stage)
                end if;
            end if;
            
            -- check if either rs1 or rs2 in EX stage matches rd in WB stage
            -- but only if forwarding instruction will write to a register
            -- and only if Rd for that instruction is not x0
            if regWrite_mem_wb = '1' and rd_mem_wb /= "00000" then
                if rd_mem_wb = rs1_id_ex then
                    forwardA <= "01"; -- set forwardA to 10 (from WB stage)
                end if;
                if rd_mem_wb = rs2_id_ex then
                    forwardB <= "01"; -- set forwardB to 10 (from WB stage)
                end if;
            end if;
    end process;
end beh;