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
        forwardB: out  std_logic_vector(1 downto 0)
        );
end forwarding_unit;

architecture beh of forwarding_unit is
--    signal sForwardA: std_logic_vector(1 downto 0) := "00"; 
--    signal sForwardB: std_logic_vector(1 downto 0) := "00";
begin --beh
    
--    forwardA <= sForwardA;
--    forwardB <= sForwardB;
--    
--    process(rs1_id_ex, rs2_id_ex, rd_ex_mem, rd_mem_wb, regWrite_ex_mem, regWrite_mem_wb)
--        begin
--
--            -- set default values for outputs
--            sForwardA <= "00";
--            sForwardB <= "00";
--            -- check if either rs1 or rs2 in EX stage matches rd in MEM stage
--            -- but only if forwarding instruction will write to a register
--            -- and only if Rd for that instruction is not x0
--            if regWrite_ex_mem = '1' and rd_ex_mem /= "00000" then
--                if rd_ex_mem = rs1_id_ex then
--                    sForwardA <= "10"; -- set forwardA to 01 (from MEM stage)
--                end if;
--                if rd_ex_mem = rs2_id_ex then
--                    sForwardB <= "10"; -- set forwardB to 01 (from MEM stage)
--                end if;
--            end if;
--            
--            -- check if either rs1 or rs2 in EX stage matches rd in WB stage
--            -- but only if forwarding instruction will write to a register
--            -- and only if Rd for that instruction is not x0
--            if regWrite_mem_wb = '1' and rd_mem_wb /= "00000" then
--                -- check also that forwardA & forwardB are not "10" 
--                -- even though it is a condition that can't happen 
--                if rd_mem_wb = rs1_id_ex and sForwardA /= "10" then
--                    sForwardA <= "01"; -- set forwardA to 10 (from WB stage)
--                end if;
--                if rd_mem_wb = rs2_id_ex and sForwardB /= "10" then
--                    sForwardB <= "01"; -- set forwardB to 10 (from WB stage)
--                end if;
--            end if;
--    end process;

forwardA <= "10" when regWrite_ex_mem = '1' and rd_ex_mem /= "00000" and rd_ex_mem = rs1_id_ex else
            "01" when regWrite_mem_wb = '1' and rd_mem_wb /= "00000" and rd_mem_wb = rs1_id_ex else
            "00";

forwardB <= "10" when regWrite_ex_mem = '1' and rd_ex_mem /= "00000" and rd_ex_mem = rs2_id_ex else
            "01" when regWrite_mem_wb = '1' and rd_mem_wb /= "00000" and rd_mem_wb = rs2_id_ex else
            "00";




end beh;