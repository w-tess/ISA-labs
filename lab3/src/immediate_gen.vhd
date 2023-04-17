library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity immediate_gen is
    Port ( instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           immediate   : out STD_LOGIC_VECTOR (31 downto 0));
end entity;

architecture Behavioral of immediate_gen is
    signal opcode : STD_LOGIC_VECTOR (6 downto 0);
begin
    opcode <= instruction(6 downto 0);
    
    process (opcode)
    begin
        case opcode is
            when "0010011" =>  -- I type instruction
                immediate <= STD_LOGIC_VECTOR(resize(signed(instruction(31 downto 20)), 32));
            when "1100111" =>  -- I type instruction 
                immediate <= STD_LOGIC_VECTOR(resize(signed(instruction(31 downto 20)), 32));
            when "0000011" =>  -- I type instruction
                immediate <= STD_LOGIC_VECTOR(resize(signed(instruction(31 downto 20)), 32));
            when "0100011" => -- S type instruction
                immediate <= STD_LOGIC_VECTOR(resize(SIGNED(instruction(31 downto 25) & instruction(11 downto 7)), 32));
            when "1100011" =>  -- SB type instruction
                immediate <= STD_LOGIC_VECTOR(resize(SIGNED(instruction(31 downto 31) & instruction(7 downto 7) & instruction(30 downto 25) & instruction(11 downto 8) & "0"), 32));
            when "1101111" => -- UJ type instruction
                immediate <= STD_LOGIC_VECTOR(resize(SIGNED(instruction(31 downto 31) & instruction(19 downto 12) & instruction(20 downto 20) & instruction(30 downto 21) & "0"), 32));
            when "0010111" => -- U type instruction
                immediate <= STD_LOGIC_VECTOR(resize(SIGNED(instruction(31 downto 12) & STD_LOGIC_VECTOR(resize(unsigned'("0"), 12))), 32));
            when "0110111" => -- U type instruction
                immediate <= STD_LOGIC_VECTOR(resize(SIGNED(instruction(31 downto 12) & STD_LOGIC_VECTOR(resize(unsigned'("0"), 12))), 32));
            when others =>
                immediate <= STD_LOGIC_VECTOR(resize(unsigned'("0"), 32));
        end case;
    end process;
end architecture;
