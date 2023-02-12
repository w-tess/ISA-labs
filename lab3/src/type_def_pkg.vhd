library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package type_def is

	-- definizione di un tipo enumerate, al quale viene
	-- automaticamente associato un certo valore numerico,
	-- il valore numerico non si conosce, si conosce invece
	-- il valore enumerate 
	-- forse (non ho verificato), è anche possibile definire
	-- all'interno di un record, dei campi il cui tipo è un 
	-- enumerate, questo "potrebbe" essere utile per esempio 
	-- con il campo "opcode" dell'istruzione letta durante la
	-- fase di instruction fetch
	type state_t is (IDLE, VALID, RESET);

	-- tipo user-defined basato su un record
	-- che permette di definire dei campi interni,
	-- ciascuno con il proprio tipo: questo migliora
	-- la leggibilita' sia durante la definizione delle
	-- word, sia durante il passaggio dei vari campi 
	-- all'interno dell'architettura,in quanto e' 
	-- sufficiente specificare il campo del record che 
	-- si vuole assegnare
	type commands_t is
		record
			cc : std_logic;
			next_state : std_logic_vector(3 downto 0);
			sel_in : std_logic;
			sel_int : std_logic_vector(0 to 2);
			sel_out : std_logic;
			le : std_logic_vector(0 to 9);
			sel_mux01 : std_logic;
			sel_mux2 : std_logic;
			sel_mux3 : std_logic_vector(0 to 1);
			sub_add_n : std_logic_vector(0 to 1);
			done : std_logic;
		end record;

end package type_def;
