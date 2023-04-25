library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity riscv is
    port(
    	clk: in std_logic;
		rst_n: in std_logic;
		instruction_load: in std_logic_vector(31 downto 0);
		instruction_address: in std_logic_vector(10 downto 0);
		data_load: in std_logic_vector(31 downto 0);
		data_address: in std_logic_vector(10 downto 0);
		key_load: in std_logic_vector(31 downto 0);
		key_address: in std_logic_vector(10 downto 0)
    );
end entity riscv;



architecture str of riscv is
  -- Signal declarations   
signal if_id_enable_sig : std_logic;
signal if_id_flush_sig : std_logic;
signal pc_enable_sig : std_logic;
signal pc_src_sig : std_logic;
signal brach_addr_sig : std_logic_vector(10 downto 0);
signal pc_sig: std_logic_vector(10 downto 0);
signal instruction_sig: std_logic_vector(31 downto 0);
signal wr_add_sig : std_logic_vector(4 downto 0);
signal regwr_en_sig : std_logic;
signal wr_data_sig : std_logic_vector(31 downto 0);
signal control_sel_sig : std_logic;
signal rddata1_sig : std_logic_vector(31 downto 0);
signal rddata2_sig : std_logic_vector(31 downto 0);
signal imm_sig : std_logic_vector(31 downto 0);
signal pc_ex_sig : std_logic_vector(10 downto 0);
signal rs1_out_sig : std_logic_vector(4 downto 0);
signal rs2_out_sig : std_logic_vector(4 downto 0);
signal rd_sig : std_logic_vector(4 downto 0);
signal ex_alu_op_sig : std_logic_vector(2 downto 0);
signal ex_opd1_sel_sig : std_logic;
signal ex_opd2_sel_sig : std_logic;
signal m_mem_read_sig : std_logic;
signal wb_memtoreg_sig : std_logic;
signal wb_regwrite_sig : std_logic;
signal forwardA_sig : std_logic_vector(1 downto 0);
signal forwardB_sig : std_logic_vector(1 downto 0);
signal rs1_id_sig : std_logic_vector(4 downto 0);
signal rs2_id_sig : std_logic_vector(4 downto 0);
signal rd_out_sig : std_logic_vector(4 downto 0);
signal alu_result_sig : std_logic_vector(31 downto 0);
signal opd2_sig : std_logic_vector(31 downto 0);
signal m_mem_read_out_sig : std_logic;
signal wb_memtoreg_out_sig : std_logic;
signal wb_regwrite_out_sig : std_logic;

signal alu_result_ex_sig: std_logic_vector(31 downto 0) := (others => '0');

component fetch is
    port(
        clk: in std_logic;
        rst_n: in std_logic;
        if_id_enable: in std_logic;
        if_id_flush: in std_logic;
        pc_enable: in std_logic;
        pc_src: in std_logic;
        pc_skip: in std_logic_vector(10 downto 0);
		instruction_load_f: in std_logic_vector(31 downto 0);
		address_load_f: in std_logic_vector(10 downto 0);
        key_write : in std_logic_vector(31 downto 0);
        adx_key_write : in std_logic_vector(10 downto 0);

        pc: out std_logic_vector(10 downto 0);
        instruction: out std_logic_vector(31 downto 0)
    );
end component;

component decode_stage is
    Port ( 
    	   clk : in std_logic;
           reset_n : in std_logic;
    	   instruction_in : in std_logic_vector(31 downto 0);
           pc_in : in std_logic_vector(10 downto 0);
           wr_add : in std_logic_vector(4 downto 0);
           regwr_en : in std_logic;
           wr_data : in std_logic_vector(31 downto 0);
           control_sel : in std_logic;
		   rd_ex_mem : in std_logic_vector(4 downto 0);
           alu_result_ex : in std_logic_vector(31 downto 0);
           alu_result_mem : in std_logic_vector(31 downto 0);
           regWrite_mem : in std_logic;

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
end component;

component ex_stage is
    Port ( 
    	clk : in std_logic;
        reset_n : in std_logic;
    	pc_in : in std_logic_vector(10 downto 0);
    	rs1_data : in std_logic_vector(31 downto 0);
    	rs2_data : in std_logic_vector(31 downto 0);
    	imm : in std_logic_vector(31 downto 0);
    	forward_wb : in std_logic_vector(31 downto 0);
    	rd_in : in std_logic_vector(4 downto 0);
    	forwardA : in std_logic_vector(1 downto 0);
    	forwardB : in std_logic_vector(1 downto 0);
    	ex_alu_op : in std_logic_vector(2 downto 0);
		ex_opd1_sel: in std_logic;
		ex_opd2_sel: in std_logic;
		m_mem_read: in std_logic;
		wb_memtoreg: in std_logic;
		wb_regwrite: in std_logic;
		rd_out : out std_logic_vector(4 downto 0);
		alu_result : out std_logic_vector(31 downto 0);
		opd2 : out std_logic_vector(31 downto 0);
		m_mem_read_out : out std_logic;
		wb_memtoreg_out : out std_logic;
		wb_regwrite_out : out std_logic;
        alu_result_ex : out std_logic_vector(31 downto 0)
        );
end component;

component mem_stage is
    Port ( 
    	clk : in std_logic;
        reset_n : in std_logic;
    	rd_in : in  std_logic_vector(4 downto 0);
    	Alu_result_in : in std_logic_vector(31 downto 0);
        Opd2_in : in std_logic_vector(31 downto 0);
        m_mem_read_in : in std_logic;
        wb_memtoreg_in : in std_logic; -- 1 for data(memory), 0 for alu result
        wb_regwrite_in : in std_logic;		
		data_load: in std_logic_vector(31 downto 0);
		data_address: in std_logic_vector(10 downto 0);

    	rd_out : out std_logic_vector(4 downto 0);
    	wr_data_out : out std_logic_vector(31 downto 0);
        wb_regwrite_out : out std_logic
        );
end component;

component forwarding_unit is
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
end component;

component hazard_detection_unit is
    Port ( 
    	rs1_if_id: in std_logic_vector(4 downto 0);
        rs2_if_id: in std_logic_vector(4 downto 0);
        rd_id_ex: in std_logic_vector(4 downto 0);
        mem_read_id_ex: in std_logic;
        
        pc_enable: out std_logic;
        if_id_enable: out std_logic;
        control_sel: out std_logic
        );
end component;

begin

	my_fetch : fetch
	port map(
		clk => clk,
        rst_n => rst_n,
        if_id_enable => if_id_enable_sig,
        if_id_flush => if_id_flush_sig,
        pc_enable => pc_enable_sig,
        pc_src => pc_src_sig,
        pc_skip => brach_addr_sig,
		address_load_f => instruction_address,
		instruction_load_f => instruction_load,
        key_write => key_load,
        adx_key_write => key_address,
        
        pc => pc_sig,
        instruction => instruction_sig 
	);
	
	my_decode_stage : decode_stage
	port map(
		clk => clk,
		reset_n => rst_n,
		instruction_in => instruction_sig,
		pc_in => pc_sig,
		wr_add => wr_add_sig,
		regwr_en => regwr_en_sig,
		wr_data => wr_data_sig,
		control_sel => control_sel_sig,
		rd_ex_mem => rd_out_sig,
        alu_result_ex => alu_result_ex_sig,
        alu_result_mem => alu_result_sig,
        regWrite_mem => wb_regwrite_out_sig,

		rddata1 => rddata1_sig,
		rddata2 => rddata2_sig,
		imm => imm_sig,
		pc_out => pc_ex_sig,
		branch_addr => brach_addr_sig,
		rs1_id => rs1_id_sig,
		rs2_id => rs2_id_sig,
		rs1_out => rs1_out_sig,
		rs2_out => rs2_out_sig,
		rd => rd_sig,
		pc_src => pc_src_sig,
		ex_alu_op => ex_alu_op_sig,
		ex_opd1_sel => ex_opd1_sel_sig,
		ex_opd2_sel => ex_opd2_sel_sig,
		m_mem_read => m_mem_read_sig,
		wb_memtoreg => wb_memtoreg_sig,
		wb_regwrite => wb_regwrite_sig,
		if_flush_n_out => if_id_flush_sig
	);
	
	my_ex_stage : ex_stage
	port map(
    	clk => clk,
        reset_n => rst_n,
    	pc_in => pc_ex_sig,
    	rs1_data => rddata1_sig,
    	rs2_data => rddata2_sig,
    	imm => imm_sig,
    	forward_wb => wr_data_sig, --forwarding the same sig of wr data
    	rd_in => rd_sig,
    	forwardA => forwardA_sig,
    	forwardB => forwardB_sig,
    	ex_alu_op => ex_alu_op_sig,
		ex_opd1_sel => ex_opd1_sel_sig,
		ex_opd2_sel => ex_opd2_sel_sig,
		m_mem_read => m_mem_read_sig,
		wb_memtoreg => wb_memtoreg_sig,
		wb_regwrite => wb_regwrite_sig,
		
		rd_out => rd_out_sig,
		alu_result => alu_result_sig,
		opd2 => opd2_sig,
		m_mem_read_out => m_mem_read_out_sig,
		wb_memtoreg_out => wb_memtoreg_out_sig,
		wb_regwrite_out => wb_regwrite_out_sig,
		alu_result_ex => alu_result_ex_sig
	);
	
	my_mem_stage : mem_stage
	port map(
    	clk => clk,
        reset_n => rst_n,
    	rd_in => rd_out_sig,
    	Alu_result_in => alu_result_sig,
        Opd2_in => opd2_sig,
        m_mem_read_in => m_mem_read_out_sig,
        wb_memtoreg_in => wb_memtoreg_out_sig, -- 1 for data(memory), 0 for alu result
        wb_regwrite_in => wb_regwrite_out_sig,
    	data_load => data_load,
		data_address => data_address,

    	rd_out => wr_add_sig,
    	wr_data_out => wr_data_sig,
        wb_regwrite_out => regwr_en_sig
	);
	
	my_forwarding_unit : forwarding_unit
	port map(
    	rs1_id_ex => rs1_out_sig,
        rs2_id_ex => rs2_out_sig,
        rd_ex_mem => rd_out_sig,
        rd_mem_wb => wr_add_sig,
        regWrite_ex_mem => wb_regwrite_out_sig,
        regWrite_mem_wb => regwr_en_sig,
        
        forwardA => forwardA_sig,
        forwardB => forwardB_sig
	);
	
	my_hazard_detection_unit : hazard_detection_unit
	port map(
    	rs1_if_id => rs1_id_sig,
        rs2_if_id => rs2_id_sig,
        rd_id_ex => rd_sig,
        mem_read_id_ex => wb_memtoreg_sig,
        
        pc_enable => pc_enable_sig,
        if_id_enable => if_id_enable_sig,
        control_sel => control_sel_sig
	);
	
	
	
end architecture;
