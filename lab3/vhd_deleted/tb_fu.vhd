library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_fu is
end entity;

architecture beh of tb_fu is
    constant tco: time:= 10 ns;

    component forwarding_unit is
        port ( 
            rs1_id_ex: in  std_logic_vector(4 downto 0);
            rs2_id_ex: in  std_logic_vector(4 downto 0);
            rd_ex_mem: in  std_logic_vector(4 downto 0);
            rd_mem_wb: in  std_logic_vector(4 downto 0);
            regWrite_ex_mem: in  std_logic;
            regWrite_mem_wb: in  std_logic;
            forwardA: out  std_logic_vector(1 downto 0);
            forwardB: out  std_logic_vector(1 downto 0)
            );
    end component forwarding_unit;

    --signal declarations
    signal sRs1_id_ex: std_logic_vector(4 downto 0) := "00000";
    signal sRs2_id_ex: std_logic_vector(4 downto 0) := "00001";
    signal sRd_ex_mem: std_logic_vector(4 downto 0) := "00010";
    signal sRd_mem_wb: std_logic_vector(4 downto 0) := "00100";
    signal sRegWrite_ex_mem: std_logic := '0';
    signal sRegWrite_mem_wb: std_logic := '0';
    signal sForwardA: std_logic_vector(1 downto 0);
    signal sForwardB: std_logic_vector(1 downto 0);

begin --beh

    --instantiate the dut
    fu: forwarding_unit
    port map(
        rs1_id_ex => sRs1_id_ex,
        rs2_id_ex => sRs2_id_ex,
        rd_ex_mem => sRd_ex_mem,
        rd_mem_wb => sRd_mem_wb,
        regWrite_ex_mem => sRegWrite_ex_mem,
        regWrite_mem_wb => sRegWrite_mem_wb,
        forwardA => sForwardA,
        forwardB => sForwardB
    );

    process
    begin  -- process
        
        wait for tco;
        sRs1_id_ex <= "00010";
        wait for tco;
        sRegWrite_ex_mem <= '1';
        wait for tco;
        sRegWrite_ex_mem <= '0';
        wait for tco;
        sRegWrite_mem_wb <= '1';
        wait for tco;
        sRd_ex_mem <= "10000";
        wait for tco;
        sRs1_id_ex <= "10000";       
        wait for tco;
        sRs2_id_ex <= "10000";
        wait for tco;
        sRegWrite_ex_mem <= '1';
        wait for tco;
        sRd_mem_wb <= "10000";
        wait for tco;
        sRegWrite_mem_wb <= '0';
        wait for tco;
        sRd_ex_mem <= "10000";
        wait for tco;
        sRs1_id_ex <= "10000";       
        wait for tco;
        sRs2_id_ex <= "10000";

    end process;
end architecture;