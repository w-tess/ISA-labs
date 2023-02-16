library ieee;
use ieee.std_logic_1164.all;

entity id_ex_pipe is
    port (
        clk : in std_logic;
        reset_n : in std_logic;
        enable : in std_logic;
        pc_in : in std_logic_vector(10 downto 0);
        Register1_in : in std_logic_vector(63 downto 0);
        Register2_in : in std_logic_vector(63 downto 0);
        Immediate_in : in std_logic_vector(63 downto 0);
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
        Register1_out : out std_logic_vector(63 downto 0);
        Register2_out : out std_logic_vector(63 downto 0);
        Immediate_out : out std_logic_vector(63 downto 0);
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
end entity id_ex_pipe;

architecture rtl of id_ex_pipe is
begin
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            pc_out <= (others => '0');
            Register1_out <= (others => '0');
            Register2_out <= (others => '0');
            Immediate_out <= (others => '0');
            Rs1_out <= (others => '0');
            Rs2_out <= (others => '0');
            Rd_out <= (others => '0');
            ex_alu_op_out <= (others => '0');
            ex_opd1_sel_out <= '0';
            ex_opd2_sel_out <= '0';
            m_mem_read_out <= '1';
            wb_memtoreg_out <= '0';
            wb_regwrite_out <= '0';
        elsif clk'event and clk = '1' then
            if enable = '1' then
                pc_out <= pc_in;
                Register1_out <= Register1_in;
                Register2_out <= Register2_in;
                Immediate_out <= Immediate_in;
                Rs1_out <= Rs1_in;
                Rs2_out <= Rs2_in;
                Rd_out <= Rd_in;
                ex_alu_op_out <= ex_alu_op_in;
                ex_opd1_sel_out <= ex_opd1_sel_in;
                ex_opd2_sel_out <= ex_opd2_sel_in;
                m_mem_read_out <= m_mem_read_in;
                wb_memtoreg_out <= wb_memtoreg_in;
                wb_regwrite_out <= wb_regwrite_in;
            end if;
        end if;
    end process;
end architecture rtl;
