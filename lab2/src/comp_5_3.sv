`include "fa.sv"

module comp_5_3 (
	output wire tin, tout, sum,
	input wire a, b, c, d
);

	wire tmp_sum;
	
	fa fa0 (
		.a(a),
		.b(b),
		.cin(c),
		.sum(tmp_sum),
		.cout(tout)
	);

	fa fa1 (
		.a(tmp_sum),
		.b(d),
		.cin(tin),
		.sum(sum),
		.cout(cout)
	);

endmodule