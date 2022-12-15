module ha (
	output wire sum, cout,
	input  wire a, b
);
	
	assign sum = a ^ b;
	assign cout = a & b;

endmodule