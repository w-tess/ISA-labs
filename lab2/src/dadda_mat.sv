/* Dadda Matrix module
 * It takes all the partial products and
 * performs some rearrangements in order
 * to provide to Dadda Tree module an
 * easier matrix to be processed
 */

module dadda_mat (
	output logic [8:0][47:0] lev4,
	input wire logic [8:0][28:0] pp
);

	logic [8:0][47:0] tmpvect;
	logic [7:0]  nivect;

	/* first continuous assignment:
	 * assign to nivect all the ni signals from the
	 * partial products in order to define the correct
	 * extension bits during tmpvect assignment
	 */
	assign nivect[7:0] = {
		pp[8][0], pp[7][0], pp[6][0], 
		pp[5][0], pp[4][0], pp[3][0],
		pp[2][0], pp[1][0]
	};

	/* second continuous assignment:
	 * assign to a tmpvect all the partial products
	 * respecting the 3-bit shift between adjacent pps
	 */
	assign tmpvect[8:0] = {
		{                  pp[8], 21'b0},
		{      ~nivect[7], pp[7], 18'b0},
		{2'b1, ~nivect[6], pp[6], 15'b0},
		{2'b1, ~nivect[5], pp[5], 12'b0},
		{2'b1, ~nivect[4], pp[4],  9'b0},
		{2'b1, ~nivect[3], pp[3],  6'b0},
		{2'b1, ~nivect[2], pp[2],  3'b0},
		{2'b1, ~nivect[1], pp[1]       },
		{~nivect[0], {3{nivect[0]}}, pp[0][28:3]}
	};

	/* third continuous assignment:
	 * perform a "vertical flip" of columns [47:30]
	 * in order to obtain an easier matrix to be 
	 * processed inside Dadda Tree module
	 */
	assign lev4[8:0] = {
		{tmpvect[0][47:30], tmpvect[8][29:0]},
		{tmpvect[1][47:30], tmpvect[7][29:0]},
		{tmpvect[2][47:30], tmpvect[6][29:0]},
		{tmpvect[3][47:30], tmpvect[5][29:0]},
		{tmpvect[4][47:30], tmpvect[4][29:0]},
		{tmpvect[5][47:30], tmpvect[3][29:0]},
		{tmpvect[6][47:30], tmpvect[2][29:0]},
		{tmpvect[7][47:30], tmpvect[1][29:0]},
		{tmpvect[8][47:30], tmpvect[0][29:0]}
	};
	
endmodule