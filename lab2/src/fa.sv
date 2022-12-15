`include "ha.sv"

module fa (
	output wire sum, cout,
	input  wire a, b, cin
);
	
	wire 	   tmp_sum;
	wire [0:1] tmp_cout;

	ha ha0 (
		.a(a),
		.b(b),
		.sum(tmp_sum),
		.cout(tmp_cout[0])
	);

	ha ha1 (
		.a(tmp_sum),
		.b(cin),
		.sum(sum),
		.cout(tmp_cout[1])
	);

	assign cout = | tmp_cout;

endmodule