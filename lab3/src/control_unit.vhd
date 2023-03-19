library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( 
		opcode : in STD_LOGIC_VECTOR(6 downto 0);
	    funct3 : in STD_LOGIC_VECTOR(2 downto 0);
	    funct7 : in STD_LOGIC_VECTOR(6 downto 0);
	    data_equal : in std_logic;  -- 1 if greater or equal, 0 if not
	    data_greater_equal : in std_logic;  -- 1 if greater or equal, 0 if not
        ex_alu_op : out std_logic_vector(2 downto 0); --"000" => nop, "001" => sub, "010" => xor, "011" => add, "100" => left shift, "101" => right shift, "110" => increment
		ex_opd1_sel : out std_logic; -- 1 for <rs1>,  0 for pc 
		ex_opd2_sel : out std_logic; -- 1 for <rs2>,  0 for imm 
		branch_sel : out std_logic;  -- 1 for <rs1>,  0 for pc 
		pc_src : out std_logic;      -- 1 for pc++, 0 for branch target
		m_mem_read : out std_logic;  -- 1 for reading, 0 for writing
		wb_memtoreg : out std_logic; -- 1 for data(memory), 0 for alu result
		wb_regwrite : out std_logic; -- 1 for writing, 0 for not writing
		if_flush_n_out : out std_logic  -- 0 for cleaning the if/id pipe stage
        );
          
end control_unit;

architecture Behavioral of control_unit is
begin
    process(opcode, funct3, funct7, data_equal, data_greater_equal)
    begin
        case opcode is
            when "0000011" => -- lw
				ex_alu_op <= "001"; 	 --sub
				ex_opd1_sel <= '1'; 	 -- 1 for <rs1>,  0 for pc 
				ex_opd2_sel <= '1'; 	 -- 1 for <rs2>,  0 for imm 
				branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
				pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
				m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
				wb_memtoreg <= '1'; 	 -- 1 for data(memory), 0 for alu result
				wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
				if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
            when "0100011" => -- sw
				ex_alu_op <= "011"; 		--add
				ex_opd1_sel <= '1'; 		-- 1 for <rs1>,  0 for pc 
				ex_opd2_sel <= '0'; 		-- 1 for <rs2>,  0 for imm 
				branch_sel <= '-';  		-- 1 for <rs1>,  0 for pc 
				pc_src <= '1';    		-- 1 for pc++, 0 for branch target
				m_mem_read <= '0';  		-- 1 for reading, 0 for writing
				wb_memtoreg <= '0'; 		-- 1 for data(memory), 0 for alu result
				wb_regwrite <= '0'; 		-- 1 for writing, 0 for not writing
				if_flush_n_out <= '1';  	-- 0 for cleaning the if/id pipe stage, 1 for not cleaning
            when "1100111" => -- jalr
                ex_alu_op <= "011"; 	 --add
		ex_opd1_sel <= '1'; 	 -- 1 for <rs1>,  0 for pc 
		ex_opd2_sel <= '-'; 	 -- 1 for <rs2>,  0 for imm 
		branch_sel <= '1';   	 -- 1 for <rs1>,  0 for pc 
		pc_src <= '0';    	 -- 1 for pc++, 0 for branch target
		m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
		wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
		wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
		if_flush_n_out <= '0';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
            when "1101111" => -- jal
                ex_alu_op <= "110"; 	 -- increment
		ex_opd1_sel <= '0'; 	 -- 1 for <rs1>,  0 for pc 
		ex_opd2_sel <= '0'; 	 -- 1 for <rs2>,  0 for imm 
		branch_sel <= '0';   	 -- 1 for <rs1>,  0 for pc 
		pc_src <= '0';    	 -- 1 for pc++, 0 for branch target
		m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
		wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
		wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
		if_flush_n_out <= '0';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
            when "0010111" => -- auipc
                ex_alu_op <= "011"; 	 -- add
		ex_opd1_sel <= '0'; 	 -- 1 for <rs1>,  0 for pc 
		ex_opd2_sel <= '0'; 	 -- 1 for <rs2>,  0 for imm 
		branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
		pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
		m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
		wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
		wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
		if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
            when "0110111" => -- lui
                ex_alu_op <= "000"; 	 -- nop
		ex_opd1_sel <= '-'; 	 -- 1 for <rs1>,  0 for pc 
		ex_opd2_sel <= '0'; 	 -- 1 for <rs2>,  0 for imm 
		branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
		pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
		m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
		wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
		wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
		if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
            when "0010011" => -- addi, srai, slli
                case funct3 is
                    when "000" => -- addi
		        ex_alu_op <= "011"; 	 -- add
			ex_opd1_sel <= '1'; 	 -- 1 for <rs1>,  0 for pc 
			ex_opd2_sel <= '0'; 	 -- 1 for <rs2>,  0 for imm 
			branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
			pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
			m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
			wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
			wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
			if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
                    when "101" => -- srai
 		        ex_alu_op <= "101"; 	 -- right shift
			ex_opd1_sel <= '1'; 	 -- 1 for <rs1>,  0 for pc 
			ex_opd2_sel <= '0'; 	 -- 1 for <rs2>,  0 for imm 
			branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
			pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
			m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
			wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
			wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
			if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
				when "001" => -- slli
                ex_alu_op <= "100"; 	 -- shift left
		ex_opd1_sel <= '1'; 	 -- 1 for <rs1>,  0 for pc 
		ex_opd2_sel <= '0'; 	 -- 1 for <rs2>,  0 for imm 
		branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
		pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
		m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
		wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
		wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
		if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
                    when others => -- invalid funct3
 		        ex_alu_op <= "---"; 	 -- right shift
			ex_opd1_sel <= '-'; 	 -- 1 for <rs1>,  0 for pc 
			ex_opd2_sel <= '-'; 	 -- 1 for <rs2>,  0 for imm 
			branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
			pc_src <= '-';    	 -- 1 for pc++, 0 for branch target
			m_mem_read <= '-';  	 -- 1 for reading, 0 for writing
			wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
			wb_regwrite <= '-';  	 -- 1 for writing, 0 for not writing
			if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
                end case;
            when "0110011" => -- add, sub, xor
                case funct3 is
                    when "100" => -- xor
 		        ex_alu_op <= "010"; 	 -- xor
			ex_opd1_sel <= '1'; 	 -- 1 for <rs1>,  0 for pc 
			ex_opd2_sel <= '1'; 	 -- 1 for <rs2>,  0 for imm 
			branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
			pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
			m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
			wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
			wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
			if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
            	   when "000" => -- add, sub
            		case funct7 is
    	    		    when "0000000" => -- add
	 		        ex_alu_op <= "011"; 	 -- add
				ex_opd1_sel <= '1'; 	 -- 1 for <rs1>,  0 for pc 
				ex_opd2_sel <= '1'; 	 -- 1 for <rs2>,  0 for imm 
				branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
				pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
				m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
				wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
				wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
				if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
			    when "0100000" => -- sub
		 	        ex_alu_op <= "001"; 	 -- sub
				ex_opd1_sel <= '1'; 	 -- 1 for <rs1>,  0 for pc 
				ex_opd2_sel <= '1'; 	 -- 1 for <rs2>,  0 for imm 
				branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
				pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
				m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
				wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
				wb_regwrite <= '1';  	 -- 1 for writing, 0 for not writing
				if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
            	   	    when others => -- invalid funct7
	 		        ex_alu_op <= "---"; 	 -- right shift
				ex_opd1_sel <= '-'; 	 -- 1 for <rs1>,  0 for pc 
				ex_opd2_sel <= '-'; 	 -- 1 for <rs2>,  0 for imm 
				branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
				pc_src <= '-';    	 -- 1 for pc++, 0 for branch target
				m_mem_read <= '-';  	 -- 1 for reading, 0 for writing
				wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
				wb_regwrite <= '-';  	 -- 1 for writing, 0 for not writing
				if_flush_n_out <= '-';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
			   end case;
                    when others => -- invalid funct3
   		        ex_alu_op <= "---"; 	 -- right shift
			ex_opd1_sel <= '-'; 	 -- 1 for <rs1>,  0 for pc 
			ex_opd2_sel <= '-'; 	 -- 1 for <rs2>,  0 for imm 
			branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
			pc_src <= '-';    	 -- 1 for pc++, 0 for branch target
			m_mem_read <= '-';  	 -- 1 for reading, 0 for writing
			wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
			wb_regwrite <= '-';  	 -- 1 for writing, 0 for not writing
			if_flush_n_out <= '-';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
                    end case;
            when "1100011" => -- bge, bne
                case funct3 is
                    when "101" => -- bge
			ex_alu_op <= "000"; 	 -- nop
			ex_opd1_sel <= '1'; 	 -- 1 for <rs1>,  0 for pc 
			ex_opd2_sel <= '1'; 	 -- 1 for <rs2>,  0 for imm 
			branch_sel <= '0';   	 -- 1 for <rs1>,  0 for pc 
			m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
			wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
			wb_regwrite <= '0';  	 -- 1 for writing, 0 for not writing
			if data_greater_equal = '1' then
				if_flush_n_out <= '0';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
				pc_src <= '0';    	 -- 1 for pc++, 0 for branch target
			else
				if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
				pc_src <= '1';    	 -- 1 for pc++, 0 for branch target			
			end if;
                    when "001" => -- bne
                    	ex_alu_op <= "000"; 	 -- nop
			ex_opd1_sel <= '1'; 	 -- 1 for <rs1>,  0 for pc 
			ex_opd2_sel <= '1'; 	 -- 1 for <rs2>,  0 for imm 
			branch_sel <= '0';   	 -- 1 for <rs1>,  0 for pc 
			m_mem_read <= '1';  	 -- 1 for reading, 0 for writing
			wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
			wb_regwrite <= '0';  	 -- 1 for writing, 0 for not writing
			if data_equal = '1' then
				if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
				pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
			else
				if_flush_n_out <= '0';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
				pc_src <= '0';    	 -- 1 for pc++, 0 for branch target			
			end if;
                    when others => 
                    	ex_alu_op <= "---"; 	 -- right shift
			ex_opd1_sel <= '-'; 	 -- 1 for <rs1>,  0 for pc 
			ex_opd2_sel <= '-'; 	 -- 1 for <rs2>,  0 for imm 
			branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
			pc_src <= '-';    	 -- 1 for pc++, 0 for branch target
			m_mem_read <= '-';  	 -- 1 for reading, 0 for writing
			wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
			wb_regwrite <= '-';  	 -- 1 for writing, 0 for not writing
			if_flush_n_out <= '-';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
                end case;
            when others =>
	        ex_alu_op <= "---"; 	 -- right shift
		ex_opd1_sel <= '-'; 	 -- 1 for <rs1>,  0 for pc 
		ex_opd2_sel <= '-'; 	 -- 1 for <rs2>,  0 for imm 
		branch_sel <= '-';   	 -- 1 for <rs1>,  0 for pc 
		pc_src <= '1';    	 -- 1 for pc++, 0 for branch target
		m_mem_read <= '-';  	 -- 1 for reading, 0 for writing
		wb_memtoreg <= '0'; 	 -- 1 for data(memory), 0 for alu result
		wb_regwrite <= '-';  	 -- 1 for writing, 0 for not writing
		if_flush_n_out <= '1';   -- 0 for cleaning the if/id pipe stage, 1 for not cleaning
            end case;
    end process;
end Behavioral;


