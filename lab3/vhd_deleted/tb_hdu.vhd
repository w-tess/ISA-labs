library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_hdu is
end entity;

architecture beh of tb_hdu is
    constant tco: time:= 10 ns;

    component hazard_detection_unit is
        port ( 
            rs1_if_id: in std_logic_vector(4 downto 0);
            rs2_if_id: in std_logic_vector(4 downto 0);
            rd_id_ex: in std_logic_vector(4 downto 0);
            mem_read_id_ex: in std_logic;
            pc_enable: out std_logic;
            if_id_enable: out std_logic;
            control_sel: out std_logic
            );
    end component hazard_detection_unit;

    --signal declarations
    signal sRs1_if_id: std_logic_vector(4 downto 0) := "00000";
    signal sRs2_if_id: std_logic_vector(4 downto 0) := "00001";
    signal sRd_id_ex: std_logic_vector(4 downto 0) := "00010";
    signal sMem_read_id_ex: std_logic := '0';
    signal sPC_enable: std_logic := '1';
    signal sIf_id_en: std_logic;
    signal sControl_sel: std_logic;

begin --beh

    --instantiate the dut
    hdu: hazard_detection_unit
    port map(
        rs1_if_id => sRs1_if_id,
        rs2_if_id => sRs2_if_id,
        rd_id_ex => sRd_id_ex,
        mem_read_id_ex => sMem_read_id_ex,
        pc_enable => sPC_enable,
        if_id_enable => sIf_id_en,
        control_sel => sControl_sel
    );

    process
    begin  -- process
        
        wait for tco;
        sMem_read_id_ex <= '1';
        sRs1_if_id <= "00010";
		  sRs2_if_id <= "00110";	
		  sRd_id_ex <= "10000";
        wait for tco;
        sRd_id_ex <= "00010";
        wait for tco;
		  sRd_id_ex <= "10000";
        wait for tco;
        sRs2_if_id <= "10000";
		  wait for tco;
		  sMem_read_id_ex <= '0';
		  wait;  

    end process;
end architecture;