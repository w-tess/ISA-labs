/* Partial Product Generator module
 * It takes in input the multiplicand
 * and provides all the possible partial
 * products to the Booth Selector
 */

module ppg (
	output wire [23:0] x, 
	output wire [24:0] x_2, 
	output wire [25:0] x_3, x_4,
	input  wire [23:0] din
);
	
	assign   x =  din;
	assign x_2 =  din << 1;
	assign x_3 = (din << 1) + din;
	assign x_4 =  din << 2;

endmodule