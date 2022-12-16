/* Dadda Matrix module
 * It takes all the partial products and
 * performs some rearrangements in order
 * to provide to Dadda Tree module an
 * easier matrix to be processed
 */

module dadda_mat (
	output reg [47:0] daddamat [0:8],
	input wire [28:0] ppvect   [0:8]
);

	reg [47:0] tmpvect [0:8];
	reg [7:0]  nivect;

	/* first always block:
	 * assign to a tmpvect all the partial products
	 * respecting the 3-bit shift between adjacent pps
	 */
	always @(
		ppvect[0], ppvect[1], ppvect[2],
		ppvect[3], ppvect[4], ppvect[5],
		ppvect[6], ppvect[7], ppvect[8]
	) begin
		for (integer i = 0; i < 8; i++) begin
			nivect[i] = ppvect[i+1][0];
		end

		tmpvect[0] = {~nivect[0], {3{nivect[0]}}, ppvect[0][28:3]};
		tmpvect[1] = {2'b1, ~nivect[1], ppvect[1]       };
		tmpvect[2] = {2'b1, ~nivect[2], ppvect[2],  3'b0};
		tmpvect[3] = {2'b1, ~nivect[3], ppvect[3],  6'b0};
		tmpvect[4] = {2'b1, ~nivect[4], ppvect[4],  9'b0};
		tmpvect[5] = {2'b1, ~nivect[5], ppvect[5], 12'b0};
		tmpvect[6] = {2'b1, ~nivect[6], ppvect[6], 15'b0};
		tmpvect[7] = {      ~nivect[7], ppvect[7], 18'b0};
		tmpvect[8] = {                  ppvect[8], 21'b0};
	end

	/* second always block:
	 * perform a "vertical flip" of columns [47:30]
	 * in order to obtain an easier matrix to be 
	 * processed inside Dadda Tree module
	 */
	always @(
		tmpvect[0], tmpvect[1], tmpvect[2],
		tmpvect[3], tmpvect[4], tmpvect[5],
		tmpvect[6], tmpvect[7], tmpvect[8]
	) begin
		for (integer i = 0; i < 9; i++) begin
			daddamat[i] = {tmpvect[8-i][47:30], tmpvect[i][29:0]};
		end
	end
	
endmodule