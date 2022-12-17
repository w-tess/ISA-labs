/* Testbench
 * DUT: Radix-8 Modified-Booth-Encoding Multiplier
 */

`include "../src/r8_mbe_multiplier.sv"

module tb_r8_mbe_multiplier;
	logic [47:0] multiplication;
	logic [23:0] multiplicand;
	logic [23:0] multiplier;
	
	initial begin
		multiplicand = 'd504; multiplier = 'd73; // 36792
		#10
		multiplicand = 'd52944; multiplier = 'd20243; // 1071745392
		#10
		multiplicand = 'd7844; multiplier = 'd24; // 188256
		#10
		multiplicand = 'd204904; multiplier = 'd4053; // 830475912
		#10
		multiplicand = 'd54; multiplier = 'd3; // 162
		#10
		$stop;
	end

	r8_mbe_multiplier r8_mbe_multiplier0 (.*);

endmodule