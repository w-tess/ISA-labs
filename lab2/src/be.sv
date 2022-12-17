/* Booth Encoder module
 * It takes 4 consecutive bits from
 * the multiplier and provides the 
 * corresponding Booth-Encoding.
 */
module be (
	output logic ai, bi, ci, di, ni,
	input logic [3:0] seq
);

	/* Always block used to translate the input
	 * sequence according to Booth Encoding
	 */
	always @(seq) begin
		case (seq)
			4'b0000	: {ai, bi, ci, di, ni} = 5'b00000; 
			4'b0001	: {ai, bi, ci, di, ni} = 5'b10000;
			4'b0010	: {ai, bi, ci, di, ni} = 5'b10000;
			4'b0011	: {ai, bi, ci, di, ni} = 5'b01000;
			4'b0100	: {ai, bi, ci, di, ni} = 5'b01000;
			4'b0101	: {ai, bi, ci, di, ni} = 5'b00100;
			4'b0110	: {ai, bi, ci, di, ni} = 5'b00100;
			4'b0111	: {ai, bi, ci, di, ni} = 5'b00010;
			4'b1000	: {ai, bi, ci, di, ni} = 5'b00011;
			4'b1001	: {ai, bi, ci, di, ni} = 5'b00101;
			4'b1010	: {ai, bi, ci, di, ni} = 5'b00101;
			4'b1011	: {ai, bi, ci, di, ni} = 5'b01001;
			4'b1100	: {ai, bi, ci, di, ni} = 5'b01001;
			4'b1101	: {ai, bi, ci, di, ni} = 5'b10001;
			4'b1110	: {ai, bi, ci, di, ni} = 5'b10001;
			4'b1111	: {ai, bi, ci, di, ni} = 5'b00000;
			default : {ai, bi, ci, di, ni} = 5'bxxxxx;
		endcase
	end

endmodule