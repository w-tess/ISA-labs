//`timescale 1ns

module tb_iir_la ();

   parameter NBIT = 9;
   wire CLK_i;
   wire RST_n_i;
   wire [NBIT-1:0] DIN_i;
   wire VIN_i;
   wire [NBIT-1:0] B0_i;
   wire [NBIT-1:0] B1_i;
   wire [NBIT-1:0] B2_i;
   wire [NBIT-1:0] B3_i;
   wire [NBIT-1:0] A2_i;
   wire [NBIT-1:0] A3_i;   
   wire [NBIT-1:0] DOUT_i;
   wire VOUT_i;
   wire END_SIM_i;

   clk_gen CG(.END_SIM(END_SIM_i),
  	      .CLK(CLK_i),
	      .RST_n(RST_n_i));

   data_maker_la SM(.CLK(CLK_i),
	         .RST_n(RST_n_i),
		 .VOUT(VIN_i),
		 .DOUT(DIN_i),
		 .B0(B0_i),
		 .B1(B1_i),
		 .B2(B2_i),
		 .B3(B3_i),
		 .A2(A2_i),
		 .A3(A3_i),
		 .END_SIM(END_SIM_i));

   iir_filter_la UUT(.CLK(CLK_i),
	     .RST_n(RST_n_i),
	     .DIN(DIN_i),
             .VIN(VIN_i),
	     .B0(B0_i),
	     .B1(B1_i),
	     .B2(B2_i),
	     .B3(B3_i),
	     .A2(A2_i),
	     .A3(A3_i),
             .DOUT(DOUT_i),
             .VOUT(VOUT_i));

   data_sink_la DS(.CLK(CLK_i),
		.RST_n(RST_n_i),
		.VIN(VOUT_i),
		.DIN(DOUT_i));   

endmodule

		   
