library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i_decr is
    port (
        encr     : in  std_logic_vector(31 downto 0);
        key      : in  std_logic_vector(31 downto 0);
        pc_out   : in  std_logic_vector(10 downto 0);
        encr_addr: out std_logic_vector(10 downto 0);
        key_addr : out std_logic_vector(10 downto 0);
        decr     : out std_logic_vector(31 downto 0)
    );
end entity i_decr;

architecture behavioral of i_decr is
    signal pc_out_shift : std_logic_vector(10 downto 0);
begin
    -- 4 bit right-shift of pc_out
    pc_out_shift <= shift_right(pc_out, 4);
    
    -- compute the next encr & key addresses
	-- for the key case, divide by 16 "pc_out"
    encr_addr <= pc_out;
    key_addr  <= pc_out_shift;
	
	-- de-crypt the instruction to provide to the pipeline
    decr      <= encr xor key;
end architecture behavioral;
