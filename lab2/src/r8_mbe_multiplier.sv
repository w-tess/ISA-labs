/* Radix-8 Modified-Booth-Encoding Multiplier
 * This is the top module
 */

`include "ppg.sv"
`include "be.sv"
`include "bs.sv"
`include "dadda_mat.sv"
`include "dadda_tree.sv"

module r8_mbe_multiplier (
	output logic [47:0] multiplication,
	input  logic [23:0] multiplicand,
	input  logic [23:0] multiplier
);
	// Partial products provided by ppg module
	logic [23:0] x;
	logic [24:0] x_2;
	logic [25:0] x_3, x_4;
	// Booth encoded coefficients provided by beu module
	logic [8:0]  ai, bi, ci, di;
	logic [8:0]  ni, ni_prev;
	// Array containing 8 4-bit wide groups generated from
	// the multiplier input and provided to beu module to
	// compute the Booth encoding
	logic [8:0][3:0] seq;
	// Array of partial products selected by bsu module
	logic [8:0][28:0] pp;
	// Input data provided to Dadda Tree module
	// represented as 9 48-bit wide operands
	logic [8:0][47:0] lev4;
	// Output data provided from Dadda Tree module,
	// represented as 2 48-bit wide operands
	logic [1:0][47:0] lev0;

	// ni_prev provides to "i"-th be module the ni
	// coefficient of the "i-1"-th partial product
	assign ni_prev = {ni[7:0], 1'b0};

	// seq array definition
	assign seq[8:0] = {
		{{3{1'b0}}, multiplier[23]}, 
		multiplier[23:20],
		multiplier[20:17],
		multiplier[17:14],
		multiplier[14:11],
		multiplier[11:8],
		multiplier[8:5],
		multiplier[5:2],
		{multiplier[2:0], 1'b0}
	};

	ppg ppg0 (.*);

	be beu[8:0] (.*);

	bs bsu[8:0] (.*);

	dadda_mat dadda_mat0 (.*);

	dadda_tree dadda_tree0 (.*);

	// Perform the final addition to compute the multiplication
	assign multiplication = lev0[0] + lev0[1];

endmodule