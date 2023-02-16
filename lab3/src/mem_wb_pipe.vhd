library IEEE;
use IEEE.std_logic_1164.all;

entity mem_wb_pipe is
    Port ( clk   : in  std_logic;
           reset : in  std_logic;
           enable: in  std_logic;
           ALU_result : in  signed(63 downto 0);
           Mem_data     : in  signed(63 downto 0);
           rd        : in  std_logic_vector(4 downto 0);
           wb_flag   : in  std_logic;
           ALU_result_out : out signed(63 downto 0);
           Mem_data_out      : out signed(63 downto 0);
           rd_out        : out std_logic_vector(4 downto 0);
           wb_flag_out   : out std_logic);
end mem_wb_pipe;

architecture behavioral of mem_wb_pipe is
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            ALU_result_out <= (others => '0');
            Mem_data_out      <= (others => '0');
            rd_out        <= (others => '0');
            wb_flag_out   <= '0';
        elsif (clk'event and clk = '1') then
            if (enable = '1') then
                ALU_result_out <= ALU_result;
                Mem_data_out      <= Mem_data;
                rd_out        <= rd;
                wb_flag_out   <= wb_flag;
            end if;
        end if;
    end process;
end behavioral;
