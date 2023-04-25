library ieee;
use ieee.std_logic_1164.all;

entity branch_condition_fu is
    Port ( 
        opcode: in  std_logic_vector(6 downto 0);
        rs1_id: in  std_logic_vector(4 downto 0);
        rs2_id: in  std_logic_vector(4 downto 0);
        rd_id_ex: in  std_logic_vector(4 downto 0);
        rd_ex_mem: in  std_logic_vector(4 downto 0);
        regWrite_id_ex: in  std_logic;
        regWrite_ex_mem: in  std_logic;
        
        forward_branch_A: out  std_logic_vector(1 downto 0);
        forward_branch_B: out  std_logic_vector(1 downto 0)
        );
end branch_condition_fu;

architecture beh of branch_condition_fu is


begin --beh

    forward_branch_A <= "01" when rs1_id = rd_id_ex and regWrite_id_ex = '1' and rd_id_ex /= "00000" and opcode = "1100011" else
                        "10" when rs1_id = rd_ex_mem and regWrite_ex_mem = '1' and rd_ex_mem /= "00000" and opcode = "1100011"  else
                        "00";

    forward_branch_B <= "01" when rs2_id = rd_id_ex and regWrite_id_ex = '1' and rd_id_ex /= "00000" and opcode = "1100011" else
                        "10" when rs2_id = rd_ex_mem and regWrite_ex_mem = '1' and rd_ex_mem /= "00000" and opcode = "1100011"  else
                        "00";

end beh;