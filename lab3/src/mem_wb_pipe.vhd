library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem_wb_pipe is
    Port ( clk   : in  std_logic;
           reset_n : in  std_logic;
           enable: in  std_logic;
           mem_data_in : in  std_logic_vector(31 downto 0);
           alu_result_in : in  std_logic_vector(31 downto 0);
           rd_in : in  std_logic_vector(4 downto 0);
           wb_memtoreg_in : in std_logic;
           wb_regwrite_in : in std_logic;
           mem_data_out : out std_logic_vector(31 downto 0);
           alu_result_out : out std_logic_vector(31 downto 0);
           rd_out : out std_logic_vector(4 downto 0);
           wb_memtoreg_out : out std_logic;
           wb_regwrite_out : out std_logic
	);
end mem_wb_pipe;

architecture behavioral of mem_wb_pipe is
begin
    process(clk, reset_n)
    begin
        if (reset_n = '0') then
            alu_result_out <= (others => '0');
            mem_data_out      <= (others => '0');
            rd_out        <= (others => '0');
            wb_memtoreg_out    <= '0';
            wb_regwrite_out <= '0';
        elsif (clk'event and clk = '1') then
            if (enable = '1') then
                alu_result_out <= alu_result_in;
                mem_data_out      <= mem_data_in;
                rd_out        <= rd_in;
                wb_memtoreg_out    <= wb_memtoreg_in;
                wb_regwrite_out    <= wb_regwrite_in;
            end if;
        end if;
    end process;
end behavioral;
