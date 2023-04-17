`include "fa.sv"

module comp_5_3 (
	output logic cout, tout, sum,
	input  logic a, b, c, d, tin
);

	logic tmp_sum;
	
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