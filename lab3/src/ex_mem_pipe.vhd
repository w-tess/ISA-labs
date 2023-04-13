library ieee;
use ieee.std_logic_1164.all;

entity ex_mem_pipe is
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
end entity ex_mem_pipe;

architecture rtl of ex_mem_pipe is
begin
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            Alu_result_out <= (others => '0');
            Opd2_out <= (others => '0');
            Rd_out <= (others => '0');
            m_mem_read_out <= '1';
            wb_memtoreg_out <= '0';
            wb_memtoreg_out <= '0';
				wb_regwrite_out <= '0';
        elsif clk'event and clk = '1' then
            if enable = '1' then
                Alu_result_out <= Alu_result_in;
				Opd2_out <= Opd2_in;
				Rd_out <= Rd_in;
				m_mem_read_out <= m_mem_read_in;
				wb_memtoreg_out <= wb_memtoreg_in;
				wb_memtoreg_out <= wb_memtoreg_in;
				wb_regwrite_out <= wb_regwrite_in;
            end if;
        end if;
    end process;
end architecture rtl;