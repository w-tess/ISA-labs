/* Testbench
 * DUT: Radix-8 Modified-Booth-Encoding Multiplier
 */

`include "../src/r8_mbe_multiplier.sv"

module tb_r8_mbe_multiplier;
	logic [47:0] multiplication;
	logic [23:0] multiplicand;
	logic [23:0] multiplier;
	logic [47:0] expected, diff;

	// Ideal model used for comparison with
	// the module instance
	always @(multiplicand, multiplier, multiplication) begin
		expected = multiplicand * multiplier;
		diff = expected - multiplication;
	end

	// Monitoring expected and actual value
	initial begin
		$monitor("[%3t] Expected value: %15d. ", $time, expected,
				 "Actual value: %15d. ", multiplication,
				 "Difference between values: %15d.", diff);
	end

	// Stimuli generation
	initial begin
		   multiplicand = 'd504; 
		   multiplier   = 'd73; 
		#5 multiplicand = 'd52944; 
		#5 multiplier   = 'd20243;
		#5 multiplicand = 'd7844; 
		#5 multiplier   = 'd24;
		#5 multiplicand = 'd204904; 
		#5 multiplier   = 'd4053;
		#5 multiplicand = 'd54066; 
		#5 multiplier   = 'd2053;
		#5 multiplicand = 'd100326; 
		#5 multiplier   = 'd4550904; 
		#5 multiplicand = 'd40220; 
		#5 multiplier   = 'd1046;
		#5 multiplicand = 'd13521125;
		#5 multiplier   = 'd4;
		#5 multiplicand = 'd8; 
		#5 multiplier   = 'd20;
		#5 multiplicand = 'd40532; 
		#5 multiplier   = 'd0;
		#5 multiplicand = 'd1; 
		#5 multiplier   = 'd52; 
		#5 $stop;
	end

	// Radix-8 MBE Multiplier instance
	r8_mbe_multiplier r8_mbe_multiplier0 (.*);

endmodule