library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity i_decr is
    port (
        encr     : in  std_logic_vector(31 downto 0);
        key      : in  std_logic_vector(31 downto 0);
        pc_out   : in  std_logic_vector(10 downto 0);

        key_addr : out std_logic_vector(10 downto 0);
        decr     : out std_logic_vector(31 downto 0)
    );
end entity i_decr;

architecture behavioral of i_decr is
    signal pc_out_shift1 : unsigned(10 downto 0);
    signal pc_out_shift2 : unsigned(10 downto 0);
    signal pc_out_shift3 : std_logic_vector(10 downto 0);
begin
    pc_out_shift1 <= unsigned(pc_out);
    -- 4 bit right-shift of pc_out
    pc_out_shift2 <= shift_right(pc_out_shift1, 4);
    -- 2 bit left-shift of pc_out for byte indexing
    pc_out_shift3 <= std_logic_vector(shift_left(pc_out_shift2, 2));
    -- compute the next encr & key addresses
	-- for the key case, divide by 16 "pc_out"
    key_addr  <= pc_out_shift3;
	
	-- de-crypt the instruction to provide to the pipeline
    decr      <= encr xor key;
end architecture behavioral;
