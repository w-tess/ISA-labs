library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_cu is
end entity;

architecture beh of tb_cu is
    constant tco: time:= 10 ns;

    component control_unit is
        port ( 
            opcode : in STD_LOGIC_VECTOR(6 downto 0);
            funct3 : in STD_LOGIC_VECTOR(2 downto 0);
            funct7 : in STD_LOGIC_VECTOR(6 downto 0);
            data_equal : in std_logic;  -- 1 if greater or equal, 0 if not
            data_greater_equal : in std_logic;  -- 1 if greater or equal, 0 if not
            ex_alu_op : out std_logic_vector(2 downto 0); --"000" => nop, "001" => sub, "010" => xor, "011" => add, "100" => left shift, "101" => right shift, "110" => increment
            ex_opd1_sel : out std_logic; -- 1 for <rs1>,  0 for pc 
            ex_opd2_sel : out std_logic; -- 1 for <rs2>,  0 for imm 
            branch_sel : out std_logic;  -- 1 for <rs1>,  0 for pc 
            pc_src : out std_logic;      -- 1 for pc++, 0 for branch target
            m_mem_read : out std_logic;  -- 1 for reading, 0 for writing
            wb_memtoreg : out std_logic; -- 1 for data(memory), 0 for alu result
            wb_regwrite : out std_logic; -- 1 for writing, 0 for not writing
            if_flush_n_out : out std_logic  -- 0 for cleaning the if/id pipe stage
            );
    end component control_unit;

    --signal declarations
    signal sOpcode : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    signal sFunct3 : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal sFunct7 : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    signal sData_equal : std_logic := '0';
    signal sData_greater_equal : std_logic := '0';
    signal sEx_alu_op : std_logic_vector(2 downto 0);
    signal sEx_opd1_sel : std_logic;
    signal sEx_opd2_sel : std_logic;
    signal sBranch_sel : std_logic;
    signal sPc_src : std_logic;
    signal sM_mem_read : std_logic;
    signal sWb_memtoreg : std_logic;
    signal sWb_regwrite : std_logic;
    signal sIf_flush_n_out : std_logic;

begin --beh

    --instantiate the dut
    cu: control_unit
    port map(
		opcode => sOpcode,
	    funct3 => sFunct3,
	    funct7 => sFunct7,
	    data_equal => sData_equal,
	    data_greater_equal => sData_greater_equal,
        ex_alu_op => sEx_alu_op,
		ex_opd1_sel => sEx_opd1_sel,
		ex_opd2_sel => sEx_opd2_sel,
		branch_sel => sBranch_sel,
		pc_src => sPc_src,  
		m_mem_read => sM_mem_read,
		wb_memtoreg => sWb_memtoreg,
		wb_regwrite => sWb_regwrite,
		if_flush_n_out => sIf_flush_n_out
    );

    process
    begin  -- process
        
        wait for tco;
        sOpcode <= "0010111";
        wait for tco;
        sFunct3 <= "100";
        wait for tco;
        sOpcode <= "0110011";
        wait for tco;
        sFunct7 <= "0000001";
        wait for tco;
        sOpcode <= "0110011";
        wait for tco;
        sFunct3 <= "000";      
        wait for tco;
        sFunct7 <= "0100000";
        wait for tco;
        sOpcode <= "1101111";
        wait for tco;
        sFunct3 <= "111";
        wait for tco;
        sOpcode <= "1100011";
        wait for tco;
        sFunct7 <= "0000010";
        wait for tco;
        sOpcode <= "0000011";
        wait for tco;
        sFunct7 <= "0000010";
        wait for tco;
        sOpcode <= "1100011";        
        wait for tco;
        sFunct3 <= "101";
        wait for tco;
        sData_greater_equal <= '1';
        wait for tco;
        sOpcode <= "1100011";        
        wait for tco;
        sFunct3 <= "001";
        wait for tco;
        sData_equal <= '1';

    end process;
end architecture;