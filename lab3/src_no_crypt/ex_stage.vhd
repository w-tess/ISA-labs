library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ex_stage is
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
end entity;

architecture str of ex_stage is

  -- Signal declarations   
signal opd1_ex: std_logic_vector(31 downto 0);
signal opd2_ex: std_logic_vector(31 downto 0);
signal opd2_alu: std_logic_vector(31 downto 0);
signal alu_result_ex_sig: std_logic_vector(31 downto 0);
signal forward_mem : std_logic_vector(31 downto 0);

component ALU is
    Port ( 
        A : in std_logic_vector(31 downto 0);
        B : in std_logic_vector(31 downto 0);
        alucode : in std_logic_vector(2 downto 0);
        ALU_Result : out std_logic_vector(31 downto 0)
        );
end component;

component ex_mem_pipe is
    port (
        clk : in std_logic;
        reset_n : in std_logic;
        enable : in std_logic;
        Alu_result_in : in std_logic_vector(31 downto 0);
        Opd2_in : in std_logic_vector(31 downto 0);
        Rd_in : in std_logic_vector(4 downto 0);
        m_mem_read_in : in std_logic;
        wb_memtoreg_in : in std_logic;
        wb_regwrite_in : in std_logic;
        Alu_result_out : out std_logic_vector(31 downto 0);
        Opd2_out : out std_logic_vector(31 downto 0);
        Rd_out : out std_logic_vector(4 downto 0);
        m_mem_read_out : out std_logic;
        wb_memtoreg_out : out std_logic;
        wb_regwrite_out : out std_logic
    );
end component;


begin --str
alu_result_ex <= alu_result_ex_sig;
alu_result <= forward_mem;

opd1_ex <= std_logic_vector(resize(signed(pc_in),32) + 4194304) when forwardA = "00" and ex_opd1_sel = '0' else
		   rs1_data when forwardA = "00" and ex_opd1_sel = '1' else
		   forward_mem when forwardA = "10" else
		   forward_wb;

opd2_alu <= imm when forwardB = "00" and ex_opd2_sel = '0' else
		   rs2_data when forwardB = "00" and ex_opd2_sel = '1' else
		   forward_mem when forwardB = "10" else
		   forward_wb;

opd2_ex <=  rs2_data when forwardB = "00"  else
            forward_mem when forwardB = "10" else
            forward_wb;


my_ex_mem_pipe : ex_mem_pipe 
	port map (
		clk => clk,
        reset_n => reset_n,
        enable => '1',
        Alu_result_in => alu_result_ex_sig,
        Opd2_in => opd2_ex,
        Rd_in => rd_in,
        m_mem_read_in => m_mem_read,
        wb_memtoreg_in => wb_memtoreg,
        wb_regwrite_in => wb_regwrite,
        
        Alu_result_out => forward_mem,
        Opd2_out => opd2,
        Rd_out => rd_out,
        m_mem_read_out => m_mem_read_out,
        wb_memtoreg_out => wb_memtoreg_out,
        wb_regwrite_out => wb_regwrite_out
	);

my_alu : ALU
    port map (
    	A => opd1_ex,
		B => opd2_alu,
		alucode => ex_alu_op,
		ALU_Result => alu_result_ex_sig
    );


end architecture str;
