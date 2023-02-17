library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mem_stage is
    Port (
    	clk : in std_logic;
        reset_n : in std_logic;
    	rd_in : in  std_logic_vector(4 downto 0);
    	Alu_result_in : in std_logic_vector(63 downto 0);
        Opd2_in : in std_logic_vector(63 downto 0);
        m_mem_read_in : in std_logic;
        wb_memtoreg_in : in std_logic; -- 1 for data(memory), 0 for alu result
        wb_regwrite_in : in std_logic;
    	rd_out : out std_logic_vector(4 downto 0);
    	wr_data_out : out std_logic_vector(63 downto 0);
        wb_regwrite_out : out std_logic
    	);
end entity;

architecture str of mem_stage is

  -- Signal declarations   
signal mem_data: std_logic_vector(63 downto 0) := (others => '0');
signal mem_data_wb: std_logic_vector(63 downto 0) := (others => '0');
signal alu_result_wb: std_logic_vector(63 downto 0) := (others => '0');
signal wb_memtoreg_wb: std_logic;

component mem_wb_pipe is
    Port ( 
		clk   : in  std_logic;
		reset_n : in  std_logic;
		enable: in  std_logic;
		mem_data_in : in  std_logic_vector(63 downto 0);
		alu_result_in : in  std_logic_vector(63 downto 0);
		rd_in : in  std_logic_vector(4 downto 0);
		wb_memtoreg_in : in std_logic;
		wb_regwrite_in : in std_logic;
		mem_data_out : out std_logic_vector(63 downto 0);
		alu_result_out : out std_logic_vector(63 downto 0);
		rd_out : out std_logic_vector(4 downto 0);
		wb_memtoreg_out : out std_logic;
		wb_regwrite_out : out std_logic
	);
end component;

component data_memory is
    Port ( 
		clk : in  std_logic;
		read : in  std_logic;
		data_write : in  std_logic_vector(63 downto 0);
		adx : in  std_logic_vector(10 downto 0);
		dout : out std_logic_vector(63 downto 0)
    );
end component;

begin

wr_data_out <= 	mem_data_wb when wb_memtoreg_in = '1' else
		alu_result_wb when wb_memtoreg_in = '0';


my_mem_wb_pipe : mem_wb_pipe
	port map (
		clk  	 	 => clk,
		reset_n  	 => reset_n,
		enable   	 => '1',
		mem_data_in  	 => mem_data,
		alu_result_in    => Alu_result_in,
		rd_in  		 => rd_in,
		wb_memtoreg_in   => wb_memtoreg_in,
		wb_regwrite_in   => wb_regwrite_in,
		mem_data_out     => mem_data_wb,
		alu_result_out   => alu_result_wb,
		rd_out           => rd_out,
		wb_memtoreg_out  => wb_memtoreg_wb,
		wb_regwrite_out  => wb_regwrite_out
	);

my_data_memory : data_memory
	port map (
		clk 		 => clk,
		read 		 => m_mem_read_in,
		data_write 	 => Opd2_in,
		adx 		 => Alu_result_in(10 downto 0),
		dout 		 => mem_data
	);
end architecture str;
