library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decode_stage is
    Port ( 
    	   clk : in std_logic;
           reset_n : in std_logic;
    	   instruction_in : in std_logic_vector(31 downto 0);
           pc_in : in std_logic_vector(10 downto 0);
           wr_add : in std_logic_vector(4 downto 0);
           regwr_en : in std_logic;
           wr_data : in std_logic_vector(31 downto 0);
           control_sel : in std_logic;
           rddata1 : out std_logic_vector(31 downto 0);
           rddata2 : out std_logic_vector(31 downto 0);
           imm : out std_logic_vector(31 downto 0);
           pc_out : out std_logic_vector(10 downto 0);
           branch_addr : out std_logic_vector(10 downto 0);
           rs1_id : out std_logic_vector(4 downto 0);
           rs2_id : out std_logic_vector(4 downto 0);
           rs1_out : out std_logic_vector(4 downto 0);
           rs2_out : out std_logic_vector(4 downto 0);
           rd : out std_logic_vector(4 downto 0);
           pc_src : out std_logic;
           ex_alu_op : out std_logic_vector(2 downto 0);
           ex_opd1_sel: out std_logic;
           ex_opd2_sel: out std_logic;
           m_mem_read: out std_logic;
           wb_memtoreg: out std_logic;
           wb_regwrite: out std_logic;
           if_flush_n_out : out std_logic
	);
end entity;

architecture str of decode_stage is

  -- Signal declarations   
signal imm_id: std_logic_vector(31 downto 0) := (others => '0');
signal rs1_content_id: std_logic_vector(31 downto 0) := (others => '0');
signal rs2_content_id: std_logic_vector(31 downto 0) := (others => '0');
signal ex_alu_op_id: std_logic_vector(2 downto 0) := (others => '0');
signal ex_opd1_sel_id : std_logic := '0';
signal ex_opd2_sel_id : std_logic := '0';
signal data_greater_equal_id : std_logic := '0';
signal data_equal_id : std_logic := '0';
signal m_mem_read_id : std_logic := '0';
signal wb_memtoreg_id : std_logic := '0';
signal wb_regwrite_id : std_logic := '0';
signal ex_alu_op_mux: std_logic_vector(2 downto 0) := (others => '0');
signal ex_opd1_sel_mux : std_logic := '0';
signal ex_opd2_sel_mux : std_logic := '0';
signal m_mem_read_mux : std_logic := '0';
signal wb_memtoreg_mux : std_logic := '0';
signal wb_regwrite_mux : std_logic := '0';
signal branch_sel_id : std_logic;

component register_file is
    port (
        clk : in std_logic;
        rst_n : in std_logic; 
        rdReg1 : in std_logic_vector(4 downto 0);
        rdReg2 : in std_logic_vector(4 downto 0);
        wrReg : in std_logic_vector(4 downto 0);
        regWrite : in std_logic;
        wrData : in std_logic_vector(31 downto 0);
        rdData1 : out std_logic_vector(31 downto 0);
        rdData2 : out std_logic_vector(31 downto 0)
    );
end component;

component immediate_gen is
    Port ( 
    	instruction : in  STD_LOGIC_VECTOR (31 downto 0);
	    immediate   : out STD_LOGIC_VECTOR (31 downto 0)
        );
end component;

component control_unit is
    Port ( 
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
          
end component;

component id_ex_pipe is
    port (
        clk : in std_logic;
        reset_n : in std_logic;
        enable : in std_logic;
        pc_in : in std_logic_vector(10 downto 0);
        Register1_in : in std_logic_vector(31 downto 0);
        Register2_in : in std_logic_vector(31 downto 0);
        Immediate_in : in std_logic_vector(31 downto 0);
        Rs1_in : in std_logic_vector(4 downto 0);
        Rs2_in : in std_logic_vector(4 downto 0);
        Rd_in : in std_logic_vector(4 downto 0);
        ex_alu_op_in : in std_logic_vector(2 downto 0);
        ex_opd1_sel_in : in std_logic;
        ex_opd2_sel_in : in std_logic;
        m_mem_read_in : in std_logic;
        wb_memtoreg_in : in std_logic;
        wb_regwrite_in : in std_logic;
        pc_out : out std_logic_vector(10 downto 0);
        Register1_out : out std_logic_vector(31 downto 0);
        Register2_out : out std_logic_vector(31 downto 0);
        Immediate_out : out std_logic_vector(31 downto 0);
        Rs1_out : out std_logic_vector(4 downto 0);
        Rs2_out : out std_logic_vector(4 downto 0);
        Rd_out : out std_logic_vector(4 downto 0);
        ex_alu_op_out : out std_logic_vector(2 downto 0);
        ex_opd1_sel_out : out std_logic;
        ex_opd2_sel_out : out std_logic;
        m_mem_read_out : out std_logic;
        wb_memtoreg_out : out std_logic;
        wb_regwrite_out : out std_logic
    );
end component;
       
begin --str

    rs1_id <= instruction_in(19 downto 15);
    rs2_id <= instruction_in(24 downto 20);
	
	ex_alu_op_mux <= ex_alu_op_id when control_sel = '1' else
					 "000" when control_sel = '0';
	ex_opd1_sel_mux <= ex_opd1_sel_id when control_sel = '1' else
					 '-' when control_sel = '0';
	ex_opd2_sel_mux <= ex_opd2_sel_id when control_sel = '1' else
					 '-' when control_sel = '0';
	m_mem_read_mux <= m_mem_read_id when control_sel = '1' else
					 '1' when control_sel = '0';
	wb_memtoreg_mux <= wb_memtoreg_id when control_sel = '1' else
					 '-' when control_sel = '0';
	wb_regwrite_mux <= wb_regwrite_id when control_sel = '1' else
					 '0' when control_sel = '0';
	
	process (rs1_content_id, rs2_content_id)
	begin
		if rs1_content_id = rs2_content_id then
			data_equal_id <= '1';
		else
			data_equal_id <= '0';
		end if;
		if signed(rs1_content_id) >= signed(rs1_content_id) then
			data_greater_equal_id <= '1';
		else
			data_greater_equal_id <= '0';
		end if;
	end process;
	
	process (branch_sel_id, imm_id, rs1_content_id, pc_in)
	begin
		if branch_sel_id = '1' then
			branch_addr <= std_logic_vector(resize(SIGNED(imm_id),11) + resize(signed(rs1_content_id), 11));
		else
			branch_addr <= std_logic_vector(resize(SIGNED(imm_id),11) + signed(pc_in));
		end if;
	end process;

    my_reg_file : register_file
    port map (
        clk => clk,
        rst_n => reset_n,
        rdReg1 => instruction_in(19 downto 15),
        rdReg2 => instruction_in(24 downto 20),
        wrReg => wr_add,
        regWrite => regwr_en,
        wrData => wr_data,
        rdData1 => rs1_content_id,
        rdData2 => rs2_content_id
    );           
     
    my_immediate_gen : immediate_gen
    port map (
    	instruction => instruction_in,
		immediate   => imm_id
    );
    
    my_control_unit : control_unit
    port map (
		opcode => instruction_in(6 downto 0),
		funct3 => instruction_in(14 downto 12),
		funct7 => instruction_in(31 downto 25),
		data_equal => data_equal_id,
		data_greater_equal => data_greater_equal_id,
		ex_alu_op => ex_alu_op_id,
		ex_opd1_sel => ex_opd1_sel_id,
		ex_opd2_sel => ex_opd2_sel_id,
		branch_sel => branch_sel_id,
		pc_src => pc_src,
		m_mem_read => m_mem_read_id,
		wb_memtoreg => wb_memtoreg_id,
		wb_regwrite => wb_regwrite_id,
		if_flush_n_out => if_flush_n_out
    );
    
    
    my_id_ex_pipe : id_ex_pipe
    port map (
        clk => clk,
        reset_n => reset_n,
        enable => '1',
        pc_in => pc_in,
        Register1_in => rs1_content_id,
        Register2_in => rs2_content_id,
        Immediate_in => imm_id,
        Rs1_in => instruction_in(19 downto 15),
        Rs2_in => instruction_in(24 downto 20),
        Rd_in => instruction_in(11 downto 7),
        ex_alu_op_in => ex_alu_op_mux,
        ex_opd1_sel_in => ex_opd1_sel_mux,
        ex_opd2_sel_in => ex_opd2_sel_mux,
        m_mem_read_in => m_mem_read_mux,
        wb_memtoreg_in => wb_memtoreg_mux,
        wb_regwrite_in => wb_regwrite_mux,
        pc_out => pc_out,
        Register1_out => rddata1,
        Register2_out => rddata2,
        Immediate_out => imm,
        Rs1_out => rs1_out,
        Rs2_out => rs2_out,
        Rd_out => rd,
        ex_alu_op_out => ex_alu_op,
        ex_opd1_sel_out => ex_opd1_sel,
        ex_opd2_sel_out => ex_opd2_sel,
        m_mem_read_out => m_mem_read,
        wb_memtoreg_out => wb_memtoreg,
        wb_regwrite_out => wb_regwrite
    );
    
           
end architecture str;
           
