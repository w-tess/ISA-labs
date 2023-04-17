`include "ha.sv"

module fa (
	output logic sum, cout,
	input  logic a, b, cin
);
	
	logic		tmp_sum;
	logic [1:0] tmp_cout;

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