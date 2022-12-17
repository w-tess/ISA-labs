/* Partial Product Generator module
 * It takes in input the multiplicand
 * and provides all the possible partial
 * products to the Booth Selector
 */

module ppg (
	output logic [23:0] x, 
	output logic [24:0] x_2, 
	output logic [25:0] x_3, x_4,
	input  logic [23:0] multiplicand
);
	
	assign   x =  multiplicand;
	assign x_2 =  multiplicand << 1;
	assign x_3 = (multiplicand << 1) + multiplicand;
	assign x_4 =  multiplicand << 2;

endmodule