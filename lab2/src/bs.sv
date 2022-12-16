/* Booth Selector module 
 * It selects the required partial product
 * according to the encoded inputs.
 */
module bs (
	output reg [28:0] pp,
	input wire [23:0] x,
	input wire [24:0] x_2,
	input wire [25:0] x_3, x_4,
	input wire ai, bi, ci, di, 
	input wire ni, ni_prev
);
	
	// always block used to select the proper
	// partial product
	// inputs are automatically zero-filled
	// in order to reach output bit-width
	always @(ai, bi, ci, di, ni) begin
		case ({ai, bi, ci, di, ni})
			5'b00000 : pp[28:3] =  26'b0; 
			5'b10000 : pp[28:3] =  x;
			5'b01000 : pp[28:3] =  x_2;
			5'b00100 : pp[28:3] =  x_3; 
			5'b00010 : pp[28:3] =  x_4;
			5'b00011 : pp[28:3] = ~x_4;
			5'b00101 : pp[28:3] = ~x_3;
			5'b01001 : pp[28:3] = ~x_2;
			5'b10001 : pp[28:3] = ~x;
			default  : pp[28:3] =  26'bx; 
		endcase

		pp[2:0] = {2'b0, ni_prev};
	end

endmodule