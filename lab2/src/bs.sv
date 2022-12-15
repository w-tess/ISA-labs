/* Booth Selector module 
 * It selects the required partial product
 * according to the encoded inputs.
 */
module bs (
	output reg [23:0] pp,
	input wire [23:0] x, x_2, x_3, x_4,
	input wire ai, bi, ci, di, ni 
);
	
	always @(ai, bi, ci, di, ni) begin
		case ({ai,bi,ci,di,ni})
			5'b00000 : pp =  24'b0; 
			5'b10000 : pp =  x;
			5'b01000 : pp =  x_2; 
			5'b00100 : pp =  x_3; 
			5'b00010 : pp =  x_4; 
			5'b00011 : pp = ~x_4;
			5'b00101 : pp = ~x_3;
			5'b01001 : pp = ~x_2;
			5'b10001 : pp = ~x;
			default  : pp =  24'bx; 
		endcase
	end

endmodule