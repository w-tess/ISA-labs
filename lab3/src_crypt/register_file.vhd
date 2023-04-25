library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
    port (
        clk : in std_logic;
        rst_n : in std_logic;  -- Reset input port
        rdReg1 : in std_logic_vector(4 downto 0);
        rdReg2 : in std_logic_vector(4 downto 0);
        wrReg : in std_logic_vector(4 downto 0);
        regWrite : in std_logic;
        wrData : in std_logic_vector(31 downto 0);

        rdData1 : out std_logic_vector(31 downto 0);
        rdData2 : out std_logic_vector(31 downto 0)
    );
end entity register_file;

architecture rtl of register_file is
    type register_array is array (0 to 31) of std_logic_vector(31 downto 0);
    signal reg_file : register_array := (0 => (others => '0'), others => (others => '0'));

    signal read_data1 : integer range 0 to 31;
    signal read_data2 : integer range 0 to 31;
    signal write_data : integer range 0 to 31;


begin
    read_data1 <= to_integer(unsigned(rdReg1));
    read_data2 <= to_integer(unsigned(rdReg2));
    write_data <= to_integer(unsigned(wrReg));
    rdData1 <= reg_file(read_data1);
    rdData2 <= reg_file(read_data2);


    process (clk, rst_n)  -- Add the reset input to the sensitivity list
    begin
        if rst_n = '0' then  -- Asynchronous reset
            reg_file <= (0 => (others => '0'), others => (others => '0'));
            reg_file(2) <= x"7fffeffc";
            reg_file(3) <= x"10008000";
        elsif CLK'event and CLK = '0' then  -- falling clock edge ------------------------------------
            if (regWrite = '1' and wrReg /= "00000") then
                reg_file(write_data) <= wrData;
            end if;
        end if;
    end process;

end architecture rtl;

