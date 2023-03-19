library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( A : in std_logic_vector(63 downto 0);
           B : in std_logic_vector(63 downto 0);
           alucode : in std_logic_vector(2 downto 0);
           ALU_Result : out std_logic_vector(63 downto 0));
end ALU;

architecture Behavioral of ALU is
begin

    process(A, B, alucode)
    begin

        case alucode is
            when "000" => -- nop
                ALU_Result <= B; -- nop definition???
            when "001" => -- sub
                ALU_Result <= std_logic_vector(signed(A) - signed(B));
            when "010" => -- xor
                ALU_Result <= A xor B;
            when "011" => -- add
                ALU_Result <= std_logic_vector(signed(A) + signed(B));
            when "100" => -- left shift
                ALU_Result <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B(5 downto 0)))));
            when "101" => -- right shift sign extended
                ALU_Result <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(B(5 downto 0)))));
            when "110" => -- increment
                ALU_Result <= std_logic_vector(signed(A) + 4);
            when others => 
                ALU_Result <= (others => 'X');
        end case;


    end process;

end Behavioral;

