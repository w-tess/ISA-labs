module ha (
	output logic sum, cout,
	input  logic a, b
);
	
	assign sum = a ^ b;
	assign cout = a & b;

endmodule