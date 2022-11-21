/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP4
// Date      : Fri Nov 18 13:27:56 2022
/////////////////////////////////////////////////////////////


module iir_filter ( CLK, DIN, VIN, RST_n, B0, B1, B2, A1, A2, VOUT, DOUT );
  input [8:0] DIN;
  input [8:0] B0;
  input [8:0] B1;
  input [8:0] B2;
  input [8:0] A1;
  input [8:0] A2;
  output [8:0] DOUT;
  input CLK, VIN, RST_n;
  output VOUT;
  wire   logic_enable1, logic_enable2, logic_enable3, my_cu_n3, my_cu_n2,
         my_dp_n9, my_dp_n8, my_dp_n7, my_dp_n6, my_dp_n5, my_dp_n4, my_dp_n3,
         my_dp_n2, my_dp_n1, my_dp_mpy_4__3_, my_dp_mpy_4__4_, my_dp_mpy_4__5_,
         my_dp_mpy_4__6_, my_dp_mpy_4__7_, my_dp_mpy_4__8_, my_dp_mpy_3__3_,
         my_dp_mpy_3__4_, my_dp_mpy_3__5_, my_dp_mpy_3__6_, my_dp_mpy_3__7_,
         my_dp_mpy_3__8_, my_dp_mpy_2__3_, my_dp_mpy_2__4_, my_dp_mpy_2__5_,
         my_dp_mpy_2__6_, my_dp_mpy_2__7_, my_dp_mpy_2__8_, my_dp_mpy_1__3_,
         my_dp_mpy_1__4_, my_dp_mpy_1__5_, my_dp_mpy_1__6_, my_dp_mpy_1__7_,
         my_dp_mpy_1__8_, my_dp_mpy_0__3_, my_dp_mpy_0__4_, my_dp_mpy_0__5_,
         my_dp_mpy_0__6_, my_dp_mpy_0__7_, my_dp_mpy_0__8_,
         my_dp_add0_inst_add_22_n1, my_dp_add1_inst_add_22_n2,
         my_dp_add2_inst_add_22_n2, my_dp_add3_inst_add_22_n2,
         my_dp_mpy0_inst_outc_0_, my_dp_mpy0_inst_outc_17_,
         my_dp_mpy0_inst_mult_23_n374, my_dp_mpy0_inst_mult_23_n373,
         my_dp_mpy0_inst_mult_23_n372, my_dp_mpy0_inst_mult_23_n371,
         my_dp_mpy0_inst_mult_23_n370, my_dp_mpy0_inst_mult_23_n369,
         my_dp_mpy0_inst_mult_23_n368, my_dp_mpy0_inst_mult_23_n367,
         my_dp_mpy0_inst_mult_23_n366, my_dp_mpy0_inst_mult_23_n365,
         my_dp_mpy0_inst_mult_23_n364, my_dp_mpy0_inst_mult_23_n363,
         my_dp_mpy0_inst_mult_23_n362, my_dp_mpy0_inst_mult_23_n361,
         my_dp_mpy0_inst_mult_23_n360, my_dp_mpy0_inst_mult_23_n359,
         my_dp_mpy0_inst_mult_23_n358, my_dp_mpy0_inst_mult_23_n357,
         my_dp_mpy0_inst_mult_23_n356, my_dp_mpy0_inst_mult_23_n355,
         my_dp_mpy0_inst_mult_23_n354, my_dp_mpy0_inst_mult_23_n353,
         my_dp_mpy0_inst_mult_23_n352, my_dp_mpy0_inst_mult_23_n351,
         my_dp_mpy0_inst_mult_23_n350, my_dp_mpy0_inst_mult_23_n349,
         my_dp_mpy0_inst_mult_23_n348, my_dp_mpy0_inst_mult_23_n347,
         my_dp_mpy0_inst_mult_23_n346, my_dp_mpy0_inst_mult_23_n345,
         my_dp_mpy0_inst_mult_23_n344, my_dp_mpy0_inst_mult_23_n343,
         my_dp_mpy0_inst_mult_23_n342, my_dp_mpy0_inst_mult_23_n341,
         my_dp_mpy0_inst_mult_23_n340, my_dp_mpy0_inst_mult_23_n339,
         my_dp_mpy0_inst_mult_23_n338, my_dp_mpy0_inst_mult_23_n337,
         my_dp_mpy0_inst_mult_23_n336, my_dp_mpy0_inst_mult_23_n335,
         my_dp_mpy0_inst_mult_23_n334, my_dp_mpy0_inst_mult_23_n333,
         my_dp_mpy0_inst_mult_23_n332, my_dp_mpy0_inst_mult_23_n331,
         my_dp_mpy0_inst_mult_23_n330, my_dp_mpy0_inst_mult_23_n329,
         my_dp_mpy0_inst_mult_23_n328, my_dp_mpy0_inst_mult_23_n327,
         my_dp_mpy0_inst_mult_23_n326, my_dp_mpy0_inst_mult_23_n325,
         my_dp_mpy0_inst_mult_23_n324, my_dp_mpy0_inst_mult_23_n323,
         my_dp_mpy0_inst_mult_23_n322, my_dp_mpy0_inst_mult_23_n321,
         my_dp_mpy0_inst_mult_23_n320, my_dp_mpy0_inst_mult_23_n319,
         my_dp_mpy0_inst_mult_23_n318, my_dp_mpy0_inst_mult_23_n317,
         my_dp_mpy0_inst_mult_23_n316, my_dp_mpy0_inst_mult_23_n315,
         my_dp_mpy0_inst_mult_23_n314, my_dp_mpy0_inst_mult_23_n313,
         my_dp_mpy0_inst_mult_23_n312, my_dp_mpy0_inst_mult_23_n311,
         my_dp_mpy0_inst_mult_23_n310, my_dp_mpy0_inst_mult_23_n309,
         my_dp_mpy0_inst_mult_23_n308, my_dp_mpy0_inst_mult_23_n307,
         my_dp_mpy0_inst_mult_23_n306, my_dp_mpy0_inst_mult_23_n305,
         my_dp_mpy0_inst_mult_23_n304, my_dp_mpy0_inst_mult_23_n303,
         my_dp_mpy0_inst_mult_23_n302, my_dp_mpy0_inst_mult_23_n301,
         my_dp_mpy0_inst_mult_23_n300, my_dp_mpy0_inst_mult_23_n299,
         my_dp_mpy0_inst_mult_23_n298, my_dp_mpy0_inst_mult_23_n297,
         my_dp_mpy0_inst_mult_23_n296, my_dp_mpy0_inst_mult_23_n295,
         my_dp_mpy0_inst_mult_23_n294, my_dp_mpy0_inst_mult_23_n293,
         my_dp_mpy0_inst_mult_23_n292, my_dp_mpy0_inst_mult_23_n291,
         my_dp_mpy0_inst_mult_23_n290, my_dp_mpy0_inst_mult_23_n289,
         my_dp_mpy0_inst_mult_23_n288, my_dp_mpy0_inst_mult_23_n287,
         my_dp_mpy0_inst_mult_23_n286, my_dp_mpy0_inst_mult_23_n285,
         my_dp_mpy0_inst_mult_23_n284, my_dp_mpy0_inst_mult_23_n283,
         my_dp_mpy0_inst_mult_23_n282, my_dp_mpy0_inst_mult_23_n281,
         my_dp_mpy0_inst_mult_23_n280, my_dp_mpy0_inst_mult_23_n279,
         my_dp_mpy0_inst_mult_23_n278, my_dp_mpy0_inst_mult_23_n277,
         my_dp_mpy0_inst_mult_23_n276, my_dp_mpy0_inst_mult_23_n275,
         my_dp_mpy0_inst_mult_23_product_10_,
         my_dp_mpy0_inst_mult_23_product_9_,
         my_dp_mpy0_inst_mult_23_product_8_,
         my_dp_mpy0_inst_mult_23_product_7_,
         my_dp_mpy0_inst_mult_23_product_6_,
         my_dp_mpy0_inst_mult_23_product_5_,
         my_dp_mpy0_inst_mult_23_product_4_,
         my_dp_mpy0_inst_mult_23_product_3_,
         my_dp_mpy0_inst_mult_23_product_2_,
         my_dp_mpy0_inst_mult_23_product_1_, my_dp_mpy0_inst_mult_23_n143,
         my_dp_mpy0_inst_mult_23_n142, my_dp_mpy0_inst_mult_23_n141,
         my_dp_mpy0_inst_mult_23_n140, my_dp_mpy0_inst_mult_23_n139,
         my_dp_mpy0_inst_mult_23_n138, my_dp_mpy0_inst_mult_23_n135,
         my_dp_mpy0_inst_mult_23_n134, my_dp_mpy0_inst_mult_23_n133,
         my_dp_mpy0_inst_mult_23_n132, my_dp_mpy0_inst_mult_23_n131,
         my_dp_mpy0_inst_mult_23_n130, my_dp_mpy0_inst_mult_23_n129,
         my_dp_mpy0_inst_mult_23_n128, my_dp_mpy0_inst_mult_23_n126,
         my_dp_mpy0_inst_mult_23_n125, my_dp_mpy0_inst_mult_23_n124,
         my_dp_mpy0_inst_mult_23_n123, my_dp_mpy0_inst_mult_23_n122,
         my_dp_mpy0_inst_mult_23_n121, my_dp_mpy0_inst_mult_23_n120,
         my_dp_mpy0_inst_mult_23_n119, my_dp_mpy0_inst_mult_23_n118,
         my_dp_mpy0_inst_mult_23_n116, my_dp_mpy0_inst_mult_23_n115,
         my_dp_mpy0_inst_mult_23_n114, my_dp_mpy0_inst_mult_23_n113,
         my_dp_mpy0_inst_mult_23_n112, my_dp_mpy0_inst_mult_23_n111,
         my_dp_mpy0_inst_mult_23_n110, my_dp_mpy0_inst_mult_23_n109,
         my_dp_mpy0_inst_mult_23_n108, my_dp_mpy0_inst_mult_23_n106,
         my_dp_mpy0_inst_mult_23_n104, my_dp_mpy0_inst_mult_23_n103,
         my_dp_mpy0_inst_mult_23_n102, my_dp_mpy0_inst_mult_23_n98,
         my_dp_mpy0_inst_mult_23_n97, my_dp_mpy0_inst_mult_23_n81,
         my_dp_mpy0_inst_mult_23_n80, my_dp_mpy0_inst_mult_23_n79,
         my_dp_mpy0_inst_mult_23_n78, my_dp_mpy0_inst_mult_23_n77,
         my_dp_mpy0_inst_mult_23_n76, my_dp_mpy0_inst_mult_23_n75,
         my_dp_mpy0_inst_mult_23_n74, my_dp_mpy0_inst_mult_23_n73,
         my_dp_mpy0_inst_mult_23_n72, my_dp_mpy0_inst_mult_23_n71,
         my_dp_mpy0_inst_mult_23_n70, my_dp_mpy0_inst_mult_23_n69,
         my_dp_mpy0_inst_mult_23_n68, my_dp_mpy0_inst_mult_23_n67,
         my_dp_mpy0_inst_mult_23_n66, my_dp_mpy0_inst_mult_23_n65,
         my_dp_mpy0_inst_mult_23_n64, my_dp_mpy0_inst_mult_23_n63,
         my_dp_mpy0_inst_mult_23_n62, my_dp_mpy0_inst_mult_23_n61,
         my_dp_mpy0_inst_mult_23_n60, my_dp_mpy0_inst_mult_23_n59,
         my_dp_mpy0_inst_mult_23_n58, my_dp_mpy0_inst_mult_23_n57,
         my_dp_mpy0_inst_mult_23_n56, my_dp_mpy0_inst_mult_23_n55,
         my_dp_mpy0_inst_mult_23_n54, my_dp_mpy0_inst_mult_23_n53,
         my_dp_mpy0_inst_mult_23_n52, my_dp_mpy0_inst_mult_23_n51,
         my_dp_mpy0_inst_mult_23_n50, my_dp_mpy0_inst_mult_23_n49,
         my_dp_mpy0_inst_mult_23_n47, my_dp_mpy0_inst_mult_23_n46,
         my_dp_mpy0_inst_mult_23_n45, my_dp_mpy0_inst_mult_23_n44,
         my_dp_mpy0_inst_mult_23_n43, my_dp_mpy0_inst_mult_23_n42,
         my_dp_mpy0_inst_mult_23_n41, my_dp_mpy0_inst_mult_23_n40,
         my_dp_mpy0_inst_mult_23_n39, my_dp_mpy0_inst_mult_23_n38,
         my_dp_mpy0_inst_mult_23_n37, my_dp_mpy0_inst_mult_23_n36,
         my_dp_mpy0_inst_mult_23_n35, my_dp_mpy0_inst_mult_23_n33,
         my_dp_mpy0_inst_mult_23_n32, my_dp_mpy0_inst_mult_23_n31,
         my_dp_mpy0_inst_mult_23_n30, my_dp_mpy0_inst_mult_23_n29,
         my_dp_mpy0_inst_mult_23_n28, my_dp_mpy0_inst_mult_23_n27,
         my_dp_mpy0_inst_mult_23_n26, my_dp_mpy0_inst_mult_23_n25,
         my_dp_mpy0_inst_mult_23_n23, my_dp_mpy0_inst_mult_23_n22,
         my_dp_mpy0_inst_mult_23_n21, my_dp_mpy0_inst_mult_23_n20,
         my_dp_mpy0_inst_mult_23_n19, my_dp_mpy0_inst_mult_23_n8,
         my_dp_mpy0_inst_mult_23_n7, my_dp_mpy0_inst_mult_23_n6,
         my_dp_mpy0_inst_mult_23_n5, my_dp_mpy0_inst_mult_23_n4,
         my_dp_mpy0_inst_mult_23_n3, my_dp_mpy0_inst_mult_23_n2,
         my_dp_mpy1_inst_outc_0_, my_dp_mpy1_inst_outc_17_,
         my_dp_mpy1_inst_mult_23_n374, my_dp_mpy1_inst_mult_23_n373,
         my_dp_mpy1_inst_mult_23_n372, my_dp_mpy1_inst_mult_23_n371,
         my_dp_mpy1_inst_mult_23_n370, my_dp_mpy1_inst_mult_23_n369,
         my_dp_mpy1_inst_mult_23_n368, my_dp_mpy1_inst_mult_23_n367,
         my_dp_mpy1_inst_mult_23_n366, my_dp_mpy1_inst_mult_23_n365,
         my_dp_mpy1_inst_mult_23_n364, my_dp_mpy1_inst_mult_23_n363,
         my_dp_mpy1_inst_mult_23_n362, my_dp_mpy1_inst_mult_23_n361,
         my_dp_mpy1_inst_mult_23_n360, my_dp_mpy1_inst_mult_23_n359,
         my_dp_mpy1_inst_mult_23_n358, my_dp_mpy1_inst_mult_23_n357,
         my_dp_mpy1_inst_mult_23_n356, my_dp_mpy1_inst_mult_23_n355,
         my_dp_mpy1_inst_mult_23_n354, my_dp_mpy1_inst_mult_23_n353,
         my_dp_mpy1_inst_mult_23_n352, my_dp_mpy1_inst_mult_23_n351,
         my_dp_mpy1_inst_mult_23_n350, my_dp_mpy1_inst_mult_23_n349,
         my_dp_mpy1_inst_mult_23_n348, my_dp_mpy1_inst_mult_23_n347,
         my_dp_mpy1_inst_mult_23_n346, my_dp_mpy1_inst_mult_23_n345,
         my_dp_mpy1_inst_mult_23_n344, my_dp_mpy1_inst_mult_23_n343,
         my_dp_mpy1_inst_mult_23_n342, my_dp_mpy1_inst_mult_23_n341,
         my_dp_mpy1_inst_mult_23_n340, my_dp_mpy1_inst_mult_23_n339,
         my_dp_mpy1_inst_mult_23_n338, my_dp_mpy1_inst_mult_23_n337,
         my_dp_mpy1_inst_mult_23_n336, my_dp_mpy1_inst_mult_23_n335,
         my_dp_mpy1_inst_mult_23_n334, my_dp_mpy1_inst_mult_23_n333,
         my_dp_mpy1_inst_mult_23_n332, my_dp_mpy1_inst_mult_23_n331,
         my_dp_mpy1_inst_mult_23_n330, my_dp_mpy1_inst_mult_23_n329,
         my_dp_mpy1_inst_mult_23_n328, my_dp_mpy1_inst_mult_23_n327,
         my_dp_mpy1_inst_mult_23_n326, my_dp_mpy1_inst_mult_23_n325,
         my_dp_mpy1_inst_mult_23_n324, my_dp_mpy1_inst_mult_23_n323,
         my_dp_mpy1_inst_mult_23_n322, my_dp_mpy1_inst_mult_23_n321,
         my_dp_mpy1_inst_mult_23_n320, my_dp_mpy1_inst_mult_23_n319,
         my_dp_mpy1_inst_mult_23_n318, my_dp_mpy1_inst_mult_23_n317,
         my_dp_mpy1_inst_mult_23_n316, my_dp_mpy1_inst_mult_23_n315,
         my_dp_mpy1_inst_mult_23_n314, my_dp_mpy1_inst_mult_23_n313,
         my_dp_mpy1_inst_mult_23_n312, my_dp_mpy1_inst_mult_23_n311,
         my_dp_mpy1_inst_mult_23_n310, my_dp_mpy1_inst_mult_23_n309,
         my_dp_mpy1_inst_mult_23_n308, my_dp_mpy1_inst_mult_23_n307,
         my_dp_mpy1_inst_mult_23_n306, my_dp_mpy1_inst_mult_23_n305,
         my_dp_mpy1_inst_mult_23_n304, my_dp_mpy1_inst_mult_23_n303,
         my_dp_mpy1_inst_mult_23_n302, my_dp_mpy1_inst_mult_23_n301,
         my_dp_mpy1_inst_mult_23_n300, my_dp_mpy1_inst_mult_23_n299,
         my_dp_mpy1_inst_mult_23_n298, my_dp_mpy1_inst_mult_23_n297,
         my_dp_mpy1_inst_mult_23_n296, my_dp_mpy1_inst_mult_23_n295,
         my_dp_mpy1_inst_mult_23_n294, my_dp_mpy1_inst_mult_23_n293,
         my_dp_mpy1_inst_mult_23_n292, my_dp_mpy1_inst_mult_23_n291,
         my_dp_mpy1_inst_mult_23_n290, my_dp_mpy1_inst_mult_23_n289,
         my_dp_mpy1_inst_mult_23_n288, my_dp_mpy1_inst_mult_23_n287,
         my_dp_mpy1_inst_mult_23_n286, my_dp_mpy1_inst_mult_23_n285,
         my_dp_mpy1_inst_mult_23_n284, my_dp_mpy1_inst_mult_23_n283,
         my_dp_mpy1_inst_mult_23_n282, my_dp_mpy1_inst_mult_23_n281,
         my_dp_mpy1_inst_mult_23_n280, my_dp_mpy1_inst_mult_23_n279,
         my_dp_mpy1_inst_mult_23_n278, my_dp_mpy1_inst_mult_23_n277,
         my_dp_mpy1_inst_mult_23_n276, my_dp_mpy1_inst_mult_23_n275,
         my_dp_mpy1_inst_mult_23_product_10_,
         my_dp_mpy1_inst_mult_23_product_9_,
         my_dp_mpy1_inst_mult_23_product_8_,
         my_dp_mpy1_inst_mult_23_product_7_,
         my_dp_mpy1_inst_mult_23_product_6_,
         my_dp_mpy1_inst_mult_23_product_5_,
         my_dp_mpy1_inst_mult_23_product_4_,
         my_dp_mpy1_inst_mult_23_product_3_,
         my_dp_mpy1_inst_mult_23_product_2_,
         my_dp_mpy1_inst_mult_23_product_1_, my_dp_mpy1_inst_mult_23_n143,
         my_dp_mpy1_inst_mult_23_n142, my_dp_mpy1_inst_mult_23_n141,
         my_dp_mpy1_inst_mult_23_n140, my_dp_mpy1_inst_mult_23_n139,
         my_dp_mpy1_inst_mult_23_n138, my_dp_mpy1_inst_mult_23_n135,
         my_dp_mpy1_inst_mult_23_n134, my_dp_mpy1_inst_mult_23_n133,
         my_dp_mpy1_inst_mult_23_n132, my_dp_mpy1_inst_mult_23_n131,
         my_dp_mpy1_inst_mult_23_n130, my_dp_mpy1_inst_mult_23_n129,
         my_dp_mpy1_inst_mult_23_n128, my_dp_mpy1_inst_mult_23_n126,
         my_dp_mpy1_inst_mult_23_n125, my_dp_mpy1_inst_mult_23_n124,
         my_dp_mpy1_inst_mult_23_n123, my_dp_mpy1_inst_mult_23_n122,
         my_dp_mpy1_inst_mult_23_n121, my_dp_mpy1_inst_mult_23_n120,
         my_dp_mpy1_inst_mult_23_n119, my_dp_mpy1_inst_mult_23_n118,
         my_dp_mpy1_inst_mult_23_n116, my_dp_mpy1_inst_mult_23_n115,
         my_dp_mpy1_inst_mult_23_n114, my_dp_mpy1_inst_mult_23_n113,
         my_dp_mpy1_inst_mult_23_n112, my_dp_mpy1_inst_mult_23_n111,
         my_dp_mpy1_inst_mult_23_n110, my_dp_mpy1_inst_mult_23_n109,
         my_dp_mpy1_inst_mult_23_n108, my_dp_mpy1_inst_mult_23_n106,
         my_dp_mpy1_inst_mult_23_n104, my_dp_mpy1_inst_mult_23_n103,
         my_dp_mpy1_inst_mult_23_n102, my_dp_mpy1_inst_mult_23_n98,
         my_dp_mpy1_inst_mult_23_n97, my_dp_mpy1_inst_mult_23_n81,
         my_dp_mpy1_inst_mult_23_n80, my_dp_mpy1_inst_mult_23_n79,
         my_dp_mpy1_inst_mult_23_n78, my_dp_mpy1_inst_mult_23_n77,
         my_dp_mpy1_inst_mult_23_n76, my_dp_mpy1_inst_mult_23_n75,
         my_dp_mpy1_inst_mult_23_n74, my_dp_mpy1_inst_mult_23_n73,
         my_dp_mpy1_inst_mult_23_n72, my_dp_mpy1_inst_mult_23_n71,
         my_dp_mpy1_inst_mult_23_n70, my_dp_mpy1_inst_mult_23_n69,
         my_dp_mpy1_inst_mult_23_n68, my_dp_mpy1_inst_mult_23_n67,
         my_dp_mpy1_inst_mult_23_n66, my_dp_mpy1_inst_mult_23_n65,
         my_dp_mpy1_inst_mult_23_n64, my_dp_mpy1_inst_mult_23_n63,
         my_dp_mpy1_inst_mult_23_n62, my_dp_mpy1_inst_mult_23_n61,
         my_dp_mpy1_inst_mult_23_n60, my_dp_mpy1_inst_mult_23_n59,
         my_dp_mpy1_inst_mult_23_n58, my_dp_mpy1_inst_mult_23_n57,
         my_dp_mpy1_inst_mult_23_n56, my_dp_mpy1_inst_mult_23_n55,
         my_dp_mpy1_inst_mult_23_n54, my_dp_mpy1_inst_mult_23_n53,
         my_dp_mpy1_inst_mult_23_n52, my_dp_mpy1_inst_mult_23_n51,
         my_dp_mpy1_inst_mult_23_n50, my_dp_mpy1_inst_mult_23_n49,
         my_dp_mpy1_inst_mult_23_n47, my_dp_mpy1_inst_mult_23_n46,
         my_dp_mpy1_inst_mult_23_n45, my_dp_mpy1_inst_mult_23_n44,
         my_dp_mpy1_inst_mult_23_n43, my_dp_mpy1_inst_mult_23_n42,
         my_dp_mpy1_inst_mult_23_n41, my_dp_mpy1_inst_mult_23_n40,
         my_dp_mpy1_inst_mult_23_n39, my_dp_mpy1_inst_mult_23_n38,
         my_dp_mpy1_inst_mult_23_n37, my_dp_mpy1_inst_mult_23_n36,
         my_dp_mpy1_inst_mult_23_n35, my_dp_mpy1_inst_mult_23_n33,
         my_dp_mpy1_inst_mult_23_n32, my_dp_mpy1_inst_mult_23_n31,
         my_dp_mpy1_inst_mult_23_n30, my_dp_mpy1_inst_mult_23_n29,
         my_dp_mpy1_inst_mult_23_n28, my_dp_mpy1_inst_mult_23_n27,
         my_dp_mpy1_inst_mult_23_n26, my_dp_mpy1_inst_mult_23_n25,
         my_dp_mpy1_inst_mult_23_n23, my_dp_mpy1_inst_mult_23_n22,
         my_dp_mpy1_inst_mult_23_n21, my_dp_mpy1_inst_mult_23_n20,
         my_dp_mpy1_inst_mult_23_n19, my_dp_mpy1_inst_mult_23_n8,
         my_dp_mpy1_inst_mult_23_n7, my_dp_mpy1_inst_mult_23_n6,
         my_dp_mpy1_inst_mult_23_n5, my_dp_mpy1_inst_mult_23_n4,
         my_dp_mpy1_inst_mult_23_n3, my_dp_mpy1_inst_mult_23_n2,
         my_dp_mpy2_inst_outc_0_, my_dp_mpy2_inst_outc_17_,
         my_dp_mpy2_inst_mult_23_n374, my_dp_mpy2_inst_mult_23_n373,
         my_dp_mpy2_inst_mult_23_n372, my_dp_mpy2_inst_mult_23_n371,
         my_dp_mpy2_inst_mult_23_n370, my_dp_mpy2_inst_mult_23_n369,
         my_dp_mpy2_inst_mult_23_n368, my_dp_mpy2_inst_mult_23_n367,
         my_dp_mpy2_inst_mult_23_n366, my_dp_mpy2_inst_mult_23_n365,
         my_dp_mpy2_inst_mult_23_n364, my_dp_mpy2_inst_mult_23_n363,
         my_dp_mpy2_inst_mult_23_n362, my_dp_mpy2_inst_mult_23_n361,
         my_dp_mpy2_inst_mult_23_n360, my_dp_mpy2_inst_mult_23_n359,
         my_dp_mpy2_inst_mult_23_n358, my_dp_mpy2_inst_mult_23_n357,
         my_dp_mpy2_inst_mult_23_n356, my_dp_mpy2_inst_mult_23_n355,
         my_dp_mpy2_inst_mult_23_n354, my_dp_mpy2_inst_mult_23_n353,
         my_dp_mpy2_inst_mult_23_n352, my_dp_mpy2_inst_mult_23_n351,
         my_dp_mpy2_inst_mult_23_n350, my_dp_mpy2_inst_mult_23_n349,
         my_dp_mpy2_inst_mult_23_n348, my_dp_mpy2_inst_mult_23_n347,
         my_dp_mpy2_inst_mult_23_n346, my_dp_mpy2_inst_mult_23_n345,
         my_dp_mpy2_inst_mult_23_n344, my_dp_mpy2_inst_mult_23_n343,
         my_dp_mpy2_inst_mult_23_n342, my_dp_mpy2_inst_mult_23_n341,
         my_dp_mpy2_inst_mult_23_n340, my_dp_mpy2_inst_mult_23_n339,
         my_dp_mpy2_inst_mult_23_n338, my_dp_mpy2_inst_mult_23_n337,
         my_dp_mpy2_inst_mult_23_n336, my_dp_mpy2_inst_mult_23_n335,
         my_dp_mpy2_inst_mult_23_n334, my_dp_mpy2_inst_mult_23_n333,
         my_dp_mpy2_inst_mult_23_n332, my_dp_mpy2_inst_mult_23_n331,
         my_dp_mpy2_inst_mult_23_n330, my_dp_mpy2_inst_mult_23_n329,
         my_dp_mpy2_inst_mult_23_n328, my_dp_mpy2_inst_mult_23_n327,
         my_dp_mpy2_inst_mult_23_n326, my_dp_mpy2_inst_mult_23_n325,
         my_dp_mpy2_inst_mult_23_n324, my_dp_mpy2_inst_mult_23_n323,
         my_dp_mpy2_inst_mult_23_n322, my_dp_mpy2_inst_mult_23_n321,
         my_dp_mpy2_inst_mult_23_n320, my_dp_mpy2_inst_mult_23_n319,
         my_dp_mpy2_inst_mult_23_n318, my_dp_mpy2_inst_mult_23_n317,
         my_dp_mpy2_inst_mult_23_n316, my_dp_mpy2_inst_mult_23_n315,
         my_dp_mpy2_inst_mult_23_n314, my_dp_mpy2_inst_mult_23_n313,
         my_dp_mpy2_inst_mult_23_n312, my_dp_mpy2_inst_mult_23_n311,
         my_dp_mpy2_inst_mult_23_n310, my_dp_mpy2_inst_mult_23_n309,
         my_dp_mpy2_inst_mult_23_n308, my_dp_mpy2_inst_mult_23_n307,
         my_dp_mpy2_inst_mult_23_n306, my_dp_mpy2_inst_mult_23_n305,
         my_dp_mpy2_inst_mult_23_n304, my_dp_mpy2_inst_mult_23_n303,
         my_dp_mpy2_inst_mult_23_n302, my_dp_mpy2_inst_mult_23_n301,
         my_dp_mpy2_inst_mult_23_n300, my_dp_mpy2_inst_mult_23_n299,
         my_dp_mpy2_inst_mult_23_n298, my_dp_mpy2_inst_mult_23_n297,
         my_dp_mpy2_inst_mult_23_n296, my_dp_mpy2_inst_mult_23_n295,
         my_dp_mpy2_inst_mult_23_n294, my_dp_mpy2_inst_mult_23_n293,
         my_dp_mpy2_inst_mult_23_n292, my_dp_mpy2_inst_mult_23_n291,
         my_dp_mpy2_inst_mult_23_n290, my_dp_mpy2_inst_mult_23_n289,
         my_dp_mpy2_inst_mult_23_n288, my_dp_mpy2_inst_mult_23_n287,
         my_dp_mpy2_inst_mult_23_n286, my_dp_mpy2_inst_mult_23_n285,
         my_dp_mpy2_inst_mult_23_n284, my_dp_mpy2_inst_mult_23_n283,
         my_dp_mpy2_inst_mult_23_n282, my_dp_mpy2_inst_mult_23_n281,
         my_dp_mpy2_inst_mult_23_n280, my_dp_mpy2_inst_mult_23_n279,
         my_dp_mpy2_inst_mult_23_n278, my_dp_mpy2_inst_mult_23_n277,
         my_dp_mpy2_inst_mult_23_n276, my_dp_mpy2_inst_mult_23_n275,
         my_dp_mpy2_inst_mult_23_product_10_,
         my_dp_mpy2_inst_mult_23_product_9_,
         my_dp_mpy2_inst_mult_23_product_8_,
         my_dp_mpy2_inst_mult_23_product_7_,
         my_dp_mpy2_inst_mult_23_product_6_,
         my_dp_mpy2_inst_mult_23_product_5_,
         my_dp_mpy2_inst_mult_23_product_4_,
         my_dp_mpy2_inst_mult_23_product_3_,
         my_dp_mpy2_inst_mult_23_product_2_,
         my_dp_mpy2_inst_mult_23_product_1_, my_dp_mpy2_inst_mult_23_n143,
         my_dp_mpy2_inst_mult_23_n142, my_dp_mpy2_inst_mult_23_n141,
         my_dp_mpy2_inst_mult_23_n140, my_dp_mpy2_inst_mult_23_n139,
         my_dp_mpy2_inst_mult_23_n138, my_dp_mpy2_inst_mult_23_n135,
         my_dp_mpy2_inst_mult_23_n134, my_dp_mpy2_inst_mult_23_n133,
         my_dp_mpy2_inst_mult_23_n132, my_dp_mpy2_inst_mult_23_n131,
         my_dp_mpy2_inst_mult_23_n130, my_dp_mpy2_inst_mult_23_n129,
         my_dp_mpy2_inst_mult_23_n128, my_dp_mpy2_inst_mult_23_n126,
         my_dp_mpy2_inst_mult_23_n125, my_dp_mpy2_inst_mult_23_n124,
         my_dp_mpy2_inst_mult_23_n123, my_dp_mpy2_inst_mult_23_n122,
         my_dp_mpy2_inst_mult_23_n121, my_dp_mpy2_inst_mult_23_n120,
         my_dp_mpy2_inst_mult_23_n119, my_dp_mpy2_inst_mult_23_n118,
         my_dp_mpy2_inst_mult_23_n116, my_dp_mpy2_inst_mult_23_n115,
         my_dp_mpy2_inst_mult_23_n114, my_dp_mpy2_inst_mult_23_n113,
         my_dp_mpy2_inst_mult_23_n112, my_dp_mpy2_inst_mult_23_n111,
         my_dp_mpy2_inst_mult_23_n110, my_dp_mpy2_inst_mult_23_n109,
         my_dp_mpy2_inst_mult_23_n108, my_dp_mpy2_inst_mult_23_n106,
         my_dp_mpy2_inst_mult_23_n104, my_dp_mpy2_inst_mult_23_n103,
         my_dp_mpy2_inst_mult_23_n102, my_dp_mpy2_inst_mult_23_n98,
         my_dp_mpy2_inst_mult_23_n97, my_dp_mpy2_inst_mult_23_n81,
         my_dp_mpy2_inst_mult_23_n80, my_dp_mpy2_inst_mult_23_n79,
         my_dp_mpy2_inst_mult_23_n78, my_dp_mpy2_inst_mult_23_n77,
         my_dp_mpy2_inst_mult_23_n76, my_dp_mpy2_inst_mult_23_n75,
         my_dp_mpy2_inst_mult_23_n74, my_dp_mpy2_inst_mult_23_n73,
         my_dp_mpy2_inst_mult_23_n72, my_dp_mpy2_inst_mult_23_n71,
         my_dp_mpy2_inst_mult_23_n70, my_dp_mpy2_inst_mult_23_n69,
         my_dp_mpy2_inst_mult_23_n68, my_dp_mpy2_inst_mult_23_n67,
         my_dp_mpy2_inst_mult_23_n66, my_dp_mpy2_inst_mult_23_n65,
         my_dp_mpy2_inst_mult_23_n64, my_dp_mpy2_inst_mult_23_n63,
         my_dp_mpy2_inst_mult_23_n62, my_dp_mpy2_inst_mult_23_n61,
         my_dp_mpy2_inst_mult_23_n60, my_dp_mpy2_inst_mult_23_n59,
         my_dp_mpy2_inst_mult_23_n58, my_dp_mpy2_inst_mult_23_n57,
         my_dp_mpy2_inst_mult_23_n56, my_dp_mpy2_inst_mult_23_n55,
         my_dp_mpy2_inst_mult_23_n54, my_dp_mpy2_inst_mult_23_n53,
         my_dp_mpy2_inst_mult_23_n52, my_dp_mpy2_inst_mult_23_n51,
         my_dp_mpy2_inst_mult_23_n50, my_dp_mpy2_inst_mult_23_n49,
         my_dp_mpy2_inst_mult_23_n47, my_dp_mpy2_inst_mult_23_n46,
         my_dp_mpy2_inst_mult_23_n45, my_dp_mpy2_inst_mult_23_n44,
         my_dp_mpy2_inst_mult_23_n43, my_dp_mpy2_inst_mult_23_n42,
         my_dp_mpy2_inst_mult_23_n41, my_dp_mpy2_inst_mult_23_n40,
         my_dp_mpy2_inst_mult_23_n39, my_dp_mpy2_inst_mult_23_n38,
         my_dp_mpy2_inst_mult_23_n37, my_dp_mpy2_inst_mult_23_n36,
         my_dp_mpy2_inst_mult_23_n35, my_dp_mpy2_inst_mult_23_n33,
         my_dp_mpy2_inst_mult_23_n32, my_dp_mpy2_inst_mult_23_n31,
         my_dp_mpy2_inst_mult_23_n30, my_dp_mpy2_inst_mult_23_n29,
         my_dp_mpy2_inst_mult_23_n28, my_dp_mpy2_inst_mult_23_n27,
         my_dp_mpy2_inst_mult_23_n26, my_dp_mpy2_inst_mult_23_n25,
         my_dp_mpy2_inst_mult_23_n23, my_dp_mpy2_inst_mult_23_n22,
         my_dp_mpy2_inst_mult_23_n21, my_dp_mpy2_inst_mult_23_n20,
         my_dp_mpy2_inst_mult_23_n19, my_dp_mpy2_inst_mult_23_n8,
         my_dp_mpy2_inst_mult_23_n7, my_dp_mpy2_inst_mult_23_n6,
         my_dp_mpy2_inst_mult_23_n5, my_dp_mpy2_inst_mult_23_n4,
         my_dp_mpy2_inst_mult_23_n3, my_dp_mpy2_inst_mult_23_n2,
         my_dp_mpy3_inst_outc_0_, my_dp_mpy3_inst_outc_17_,
         my_dp_mpy3_inst_mult_23_n374, my_dp_mpy3_inst_mult_23_n373,
         my_dp_mpy3_inst_mult_23_n372, my_dp_mpy3_inst_mult_23_n371,
         my_dp_mpy3_inst_mult_23_n370, my_dp_mpy3_inst_mult_23_n369,
         my_dp_mpy3_inst_mult_23_n368, my_dp_mpy3_inst_mult_23_n367,
         my_dp_mpy3_inst_mult_23_n366, my_dp_mpy3_inst_mult_23_n365,
         my_dp_mpy3_inst_mult_23_n364, my_dp_mpy3_inst_mult_23_n363,
         my_dp_mpy3_inst_mult_23_n362, my_dp_mpy3_inst_mult_23_n361,
         my_dp_mpy3_inst_mult_23_n360, my_dp_mpy3_inst_mult_23_n359,
         my_dp_mpy3_inst_mult_23_n358, my_dp_mpy3_inst_mult_23_n357,
         my_dp_mpy3_inst_mult_23_n356, my_dp_mpy3_inst_mult_23_n355,
         my_dp_mpy3_inst_mult_23_n354, my_dp_mpy3_inst_mult_23_n353,
         my_dp_mpy3_inst_mult_23_n352, my_dp_mpy3_inst_mult_23_n351,
         my_dp_mpy3_inst_mult_23_n350, my_dp_mpy3_inst_mult_23_n349,
         my_dp_mpy3_inst_mult_23_n348, my_dp_mpy3_inst_mult_23_n347,
         my_dp_mpy3_inst_mult_23_n346, my_dp_mpy3_inst_mult_23_n345,
         my_dp_mpy3_inst_mult_23_n344, my_dp_mpy3_inst_mult_23_n343,
         my_dp_mpy3_inst_mult_23_n342, my_dp_mpy3_inst_mult_23_n341,
         my_dp_mpy3_inst_mult_23_n340, my_dp_mpy3_inst_mult_23_n339,
         my_dp_mpy3_inst_mult_23_n338, my_dp_mpy3_inst_mult_23_n337,
         my_dp_mpy3_inst_mult_23_n336, my_dp_mpy3_inst_mult_23_n335,
         my_dp_mpy3_inst_mult_23_n334, my_dp_mpy3_inst_mult_23_n333,
         my_dp_mpy3_inst_mult_23_n332, my_dp_mpy3_inst_mult_23_n331,
         my_dp_mpy3_inst_mult_23_n330, my_dp_mpy3_inst_mult_23_n329,
         my_dp_mpy3_inst_mult_23_n328, my_dp_mpy3_inst_mult_23_n327,
         my_dp_mpy3_inst_mult_23_n326, my_dp_mpy3_inst_mult_23_n325,
         my_dp_mpy3_inst_mult_23_n324, my_dp_mpy3_inst_mult_23_n323,
         my_dp_mpy3_inst_mult_23_n322, my_dp_mpy3_inst_mult_23_n321,
         my_dp_mpy3_inst_mult_23_n320, my_dp_mpy3_inst_mult_23_n319,
         my_dp_mpy3_inst_mult_23_n318, my_dp_mpy3_inst_mult_23_n317,
         my_dp_mpy3_inst_mult_23_n316, my_dp_mpy3_inst_mult_23_n315,
         my_dp_mpy3_inst_mult_23_n314, my_dp_mpy3_inst_mult_23_n313,
         my_dp_mpy3_inst_mult_23_n312, my_dp_mpy3_inst_mult_23_n311,
         my_dp_mpy3_inst_mult_23_n310, my_dp_mpy3_inst_mult_23_n309,
         my_dp_mpy3_inst_mult_23_n308, my_dp_mpy3_inst_mult_23_n307,
         my_dp_mpy3_inst_mult_23_n306, my_dp_mpy3_inst_mult_23_n305,
         my_dp_mpy3_inst_mult_23_n304, my_dp_mpy3_inst_mult_23_n303,
         my_dp_mpy3_inst_mult_23_n302, my_dp_mpy3_inst_mult_23_n301,
         my_dp_mpy3_inst_mult_23_n300, my_dp_mpy3_inst_mult_23_n299,
         my_dp_mpy3_inst_mult_23_n298, my_dp_mpy3_inst_mult_23_n297,
         my_dp_mpy3_inst_mult_23_n296, my_dp_mpy3_inst_mult_23_n295,
         my_dp_mpy3_inst_mult_23_n294, my_dp_mpy3_inst_mult_23_n293,
         my_dp_mpy3_inst_mult_23_n292, my_dp_mpy3_inst_mult_23_n291,
         my_dp_mpy3_inst_mult_23_n290, my_dp_mpy3_inst_mult_23_n289,
         my_dp_mpy3_inst_mult_23_n288, my_dp_mpy3_inst_mult_23_n287,
         my_dp_mpy3_inst_mult_23_n286, my_dp_mpy3_inst_mult_23_n285,
         my_dp_mpy3_inst_mult_23_n284, my_dp_mpy3_inst_mult_23_n283,
         my_dp_mpy3_inst_mult_23_n282, my_dp_mpy3_inst_mult_23_n281,
         my_dp_mpy3_inst_mult_23_n280, my_dp_mpy3_inst_mult_23_n279,
         my_dp_mpy3_inst_mult_23_n278, my_dp_mpy3_inst_mult_23_n277,
         my_dp_mpy3_inst_mult_23_n276, my_dp_mpy3_inst_mult_23_n275,
         my_dp_mpy3_inst_mult_23_product_10_,
         my_dp_mpy3_inst_mult_23_product_9_,
         my_dp_mpy3_inst_mult_23_product_8_,
         my_dp_mpy3_inst_mult_23_product_7_,
         my_dp_mpy3_inst_mult_23_product_6_,
         my_dp_mpy3_inst_mult_23_product_5_,
         my_dp_mpy3_inst_mult_23_product_4_,
         my_dp_mpy3_inst_mult_23_product_3_,
         my_dp_mpy3_inst_mult_23_product_2_,
         my_dp_mpy3_inst_mult_23_product_1_, my_dp_mpy3_inst_mult_23_n143,
         my_dp_mpy3_inst_mult_23_n142, my_dp_mpy3_inst_mult_23_n141,
         my_dp_mpy3_inst_mult_23_n140, my_dp_mpy3_inst_mult_23_n139,
         my_dp_mpy3_inst_mult_23_n138, my_dp_mpy3_inst_mult_23_n135,
         my_dp_mpy3_inst_mult_23_n134, my_dp_mpy3_inst_mult_23_n133,
         my_dp_mpy3_inst_mult_23_n132, my_dp_mpy3_inst_mult_23_n131,
         my_dp_mpy3_inst_mult_23_n130, my_dp_mpy3_inst_mult_23_n129,
         my_dp_mpy3_inst_mult_23_n128, my_dp_mpy3_inst_mult_23_n126,
         my_dp_mpy3_inst_mult_23_n125, my_dp_mpy3_inst_mult_23_n124,
         my_dp_mpy3_inst_mult_23_n123, my_dp_mpy3_inst_mult_23_n122,
         my_dp_mpy3_inst_mult_23_n121, my_dp_mpy3_inst_mult_23_n120,
         my_dp_mpy3_inst_mult_23_n119, my_dp_mpy3_inst_mult_23_n118,
         my_dp_mpy3_inst_mult_23_n116, my_dp_mpy3_inst_mult_23_n115,
         my_dp_mpy3_inst_mult_23_n114, my_dp_mpy3_inst_mult_23_n113,
         my_dp_mpy3_inst_mult_23_n112, my_dp_mpy3_inst_mult_23_n111,
         my_dp_mpy3_inst_mult_23_n110, my_dp_mpy3_inst_mult_23_n109,
         my_dp_mpy3_inst_mult_23_n108, my_dp_mpy3_inst_mult_23_n106,
         my_dp_mpy3_inst_mult_23_n104, my_dp_mpy3_inst_mult_23_n103,
         my_dp_mpy3_inst_mult_23_n102, my_dp_mpy3_inst_mult_23_n98,
         my_dp_mpy3_inst_mult_23_n97, my_dp_mpy3_inst_mult_23_n81,
         my_dp_mpy3_inst_mult_23_n80, my_dp_mpy3_inst_mult_23_n79,
         my_dp_mpy3_inst_mult_23_n78, my_dp_mpy3_inst_mult_23_n77,
         my_dp_mpy3_inst_mult_23_n76, my_dp_mpy3_inst_mult_23_n75,
         my_dp_mpy3_inst_mult_23_n74, my_dp_mpy3_inst_mult_23_n73,
         my_dp_mpy3_inst_mult_23_n72, my_dp_mpy3_inst_mult_23_n71,
         my_dp_mpy3_inst_mult_23_n70, my_dp_mpy3_inst_mult_23_n69,
         my_dp_mpy3_inst_mult_23_n68, my_dp_mpy3_inst_mult_23_n67,
         my_dp_mpy3_inst_mult_23_n66, my_dp_mpy3_inst_mult_23_n65,
         my_dp_mpy3_inst_mult_23_n64, my_dp_mpy3_inst_mult_23_n63,
         my_dp_mpy3_inst_mult_23_n62, my_dp_mpy3_inst_mult_23_n61,
         my_dp_mpy3_inst_mult_23_n60, my_dp_mpy3_inst_mult_23_n59,
         my_dp_mpy3_inst_mult_23_n58, my_dp_mpy3_inst_mult_23_n57,
         my_dp_mpy3_inst_mult_23_n56, my_dp_mpy3_inst_mult_23_n55,
         my_dp_mpy3_inst_mult_23_n54, my_dp_mpy3_inst_mult_23_n53,
         my_dp_mpy3_inst_mult_23_n52, my_dp_mpy3_inst_mult_23_n51,
         my_dp_mpy3_inst_mult_23_n50, my_dp_mpy3_inst_mult_23_n49,
         my_dp_mpy3_inst_mult_23_n47, my_dp_mpy3_inst_mult_23_n46,
         my_dp_mpy3_inst_mult_23_n45, my_dp_mpy3_inst_mult_23_n44,
         my_dp_mpy3_inst_mult_23_n43, my_dp_mpy3_inst_mult_23_n42,
         my_dp_mpy3_inst_mult_23_n41, my_dp_mpy3_inst_mult_23_n40,
         my_dp_mpy3_inst_mult_23_n39, my_dp_mpy3_inst_mult_23_n38,
         my_dp_mpy3_inst_mult_23_n37, my_dp_mpy3_inst_mult_23_n36,
         my_dp_mpy3_inst_mult_23_n35, my_dp_mpy3_inst_mult_23_n33,
         my_dp_mpy3_inst_mult_23_n32, my_dp_mpy3_inst_mult_23_n31,
         my_dp_mpy3_inst_mult_23_n30, my_dp_mpy3_inst_mult_23_n29,
         my_dp_mpy3_inst_mult_23_n28, my_dp_mpy3_inst_mult_23_n27,
         my_dp_mpy3_inst_mult_23_n26, my_dp_mpy3_inst_mult_23_n25,
         my_dp_mpy3_inst_mult_23_n23, my_dp_mpy3_inst_mult_23_n22,
         my_dp_mpy3_inst_mult_23_n21, my_dp_mpy3_inst_mult_23_n20,
         my_dp_mpy3_inst_mult_23_n19, my_dp_mpy3_inst_mult_23_n8,
         my_dp_mpy3_inst_mult_23_n7, my_dp_mpy3_inst_mult_23_n6,
         my_dp_mpy3_inst_mult_23_n5, my_dp_mpy3_inst_mult_23_n4,
         my_dp_mpy3_inst_mult_23_n3, my_dp_mpy3_inst_mult_23_n2,
         my_dp_mpy4_inst_outc_0_, my_dp_mpy4_inst_outc_17_,
         my_dp_mpy4_inst_mult_23_n374, my_dp_mpy4_inst_mult_23_n373,
         my_dp_mpy4_inst_mult_23_n372, my_dp_mpy4_inst_mult_23_n371,
         my_dp_mpy4_inst_mult_23_n370, my_dp_mpy4_inst_mult_23_n369,
         my_dp_mpy4_inst_mult_23_n368, my_dp_mpy4_inst_mult_23_n367,
         my_dp_mpy4_inst_mult_23_n366, my_dp_mpy4_inst_mult_23_n365,
         my_dp_mpy4_inst_mult_23_n364, my_dp_mpy4_inst_mult_23_n363,
         my_dp_mpy4_inst_mult_23_n362, my_dp_mpy4_inst_mult_23_n361,
         my_dp_mpy4_inst_mult_23_n360, my_dp_mpy4_inst_mult_23_n359,
         my_dp_mpy4_inst_mult_23_n358, my_dp_mpy4_inst_mult_23_n357,
         my_dp_mpy4_inst_mult_23_n356, my_dp_mpy4_inst_mult_23_n355,
         my_dp_mpy4_inst_mult_23_n354, my_dp_mpy4_inst_mult_23_n353,
         my_dp_mpy4_inst_mult_23_n352, my_dp_mpy4_inst_mult_23_n351,
         my_dp_mpy4_inst_mult_23_n350, my_dp_mpy4_inst_mult_23_n349,
         my_dp_mpy4_inst_mult_23_n348, my_dp_mpy4_inst_mult_23_n347,
         my_dp_mpy4_inst_mult_23_n346, my_dp_mpy4_inst_mult_23_n345,
         my_dp_mpy4_inst_mult_23_n344, my_dp_mpy4_inst_mult_23_n343,
         my_dp_mpy4_inst_mult_23_n342, my_dp_mpy4_inst_mult_23_n341,
         my_dp_mpy4_inst_mult_23_n340, my_dp_mpy4_inst_mult_23_n339,
         my_dp_mpy4_inst_mult_23_n338, my_dp_mpy4_inst_mult_23_n337,
         my_dp_mpy4_inst_mult_23_n336, my_dp_mpy4_inst_mult_23_n335,
         my_dp_mpy4_inst_mult_23_n334, my_dp_mpy4_inst_mult_23_n333,
         my_dp_mpy4_inst_mult_23_n332, my_dp_mpy4_inst_mult_23_n331,
         my_dp_mpy4_inst_mult_23_n330, my_dp_mpy4_inst_mult_23_n329,
         my_dp_mpy4_inst_mult_23_n328, my_dp_mpy4_inst_mult_23_n327,
         my_dp_mpy4_inst_mult_23_n326, my_dp_mpy4_inst_mult_23_n325,
         my_dp_mpy4_inst_mult_23_n324, my_dp_mpy4_inst_mult_23_n323,
         my_dp_mpy4_inst_mult_23_n322, my_dp_mpy4_inst_mult_23_n321,
         my_dp_mpy4_inst_mult_23_n320, my_dp_mpy4_inst_mult_23_n319,
         my_dp_mpy4_inst_mult_23_n318, my_dp_mpy4_inst_mult_23_n317,
         my_dp_mpy4_inst_mult_23_n316, my_dp_mpy4_inst_mult_23_n315,
         my_dp_mpy4_inst_mult_23_n314, my_dp_mpy4_inst_mult_23_n313,
         my_dp_mpy4_inst_mult_23_n312, my_dp_mpy4_inst_mult_23_n311,
         my_dp_mpy4_inst_mult_23_n310, my_dp_mpy4_inst_mult_23_n309,
         my_dp_mpy4_inst_mult_23_n308, my_dp_mpy4_inst_mult_23_n307,
         my_dp_mpy4_inst_mult_23_n306, my_dp_mpy4_inst_mult_23_n305,
         my_dp_mpy4_inst_mult_23_n304, my_dp_mpy4_inst_mult_23_n303,
         my_dp_mpy4_inst_mult_23_n302, my_dp_mpy4_inst_mult_23_n301,
         my_dp_mpy4_inst_mult_23_n300, my_dp_mpy4_inst_mult_23_n299,
         my_dp_mpy4_inst_mult_23_n298, my_dp_mpy4_inst_mult_23_n297,
         my_dp_mpy4_inst_mult_23_n296, my_dp_mpy4_inst_mult_23_n295,
         my_dp_mpy4_inst_mult_23_n294, my_dp_mpy4_inst_mult_23_n293,
         my_dp_mpy4_inst_mult_23_n292, my_dp_mpy4_inst_mult_23_n291,
         my_dp_mpy4_inst_mult_23_n290, my_dp_mpy4_inst_mult_23_n289,
         my_dp_mpy4_inst_mult_23_n288, my_dp_mpy4_inst_mult_23_n287,
         my_dp_mpy4_inst_mult_23_n286, my_dp_mpy4_inst_mult_23_n285,
         my_dp_mpy4_inst_mult_23_n284, my_dp_mpy4_inst_mult_23_n283,
         my_dp_mpy4_inst_mult_23_n282, my_dp_mpy4_inst_mult_23_n281,
         my_dp_mpy4_inst_mult_23_n280, my_dp_mpy4_inst_mult_23_n279,
         my_dp_mpy4_inst_mult_23_n278, my_dp_mpy4_inst_mult_23_n277,
         my_dp_mpy4_inst_mult_23_n276, my_dp_mpy4_inst_mult_23_n275,
         my_dp_mpy4_inst_mult_23_product_10_,
         my_dp_mpy4_inst_mult_23_product_9_,
         my_dp_mpy4_inst_mult_23_product_8_,
         my_dp_mpy4_inst_mult_23_product_7_,
         my_dp_mpy4_inst_mult_23_product_6_,
         my_dp_mpy4_inst_mult_23_product_5_,
         my_dp_mpy4_inst_mult_23_product_4_,
         my_dp_mpy4_inst_mult_23_product_3_,
         my_dp_mpy4_inst_mult_23_product_2_,
         my_dp_mpy4_inst_mult_23_product_1_, my_dp_mpy4_inst_mult_23_n143,
         my_dp_mpy4_inst_mult_23_n142, my_dp_mpy4_inst_mult_23_n141,
         my_dp_mpy4_inst_mult_23_n140, my_dp_mpy4_inst_mult_23_n139,
         my_dp_mpy4_inst_mult_23_n138, my_dp_mpy4_inst_mult_23_n135,
         my_dp_mpy4_inst_mult_23_n134, my_dp_mpy4_inst_mult_23_n133,
         my_dp_mpy4_inst_mult_23_n132, my_dp_mpy4_inst_mult_23_n131,
         my_dp_mpy4_inst_mult_23_n130, my_dp_mpy4_inst_mult_23_n129,
         my_dp_mpy4_inst_mult_23_n128, my_dp_mpy4_inst_mult_23_n126,
         my_dp_mpy4_inst_mult_23_n125, my_dp_mpy4_inst_mult_23_n124,
         my_dp_mpy4_inst_mult_23_n123, my_dp_mpy4_inst_mult_23_n122,
         my_dp_mpy4_inst_mult_23_n121, my_dp_mpy4_inst_mult_23_n120,
         my_dp_mpy4_inst_mult_23_n119, my_dp_mpy4_inst_mult_23_n118,
         my_dp_mpy4_inst_mult_23_n116, my_dp_mpy4_inst_mult_23_n115,
         my_dp_mpy4_inst_mult_23_n114, my_dp_mpy4_inst_mult_23_n113,
         my_dp_mpy4_inst_mult_23_n112, my_dp_mpy4_inst_mult_23_n111,
         my_dp_mpy4_inst_mult_23_n110, my_dp_mpy4_inst_mult_23_n109,
         my_dp_mpy4_inst_mult_23_n108, my_dp_mpy4_inst_mult_23_n106,
         my_dp_mpy4_inst_mult_23_n104, my_dp_mpy4_inst_mult_23_n103,
         my_dp_mpy4_inst_mult_23_n102, my_dp_mpy4_inst_mult_23_n98,
         my_dp_mpy4_inst_mult_23_n97, my_dp_mpy4_inst_mult_23_n81,
         my_dp_mpy4_inst_mult_23_n80, my_dp_mpy4_inst_mult_23_n79,
         my_dp_mpy4_inst_mult_23_n78, my_dp_mpy4_inst_mult_23_n77,
         my_dp_mpy4_inst_mult_23_n76, my_dp_mpy4_inst_mult_23_n75,
         my_dp_mpy4_inst_mult_23_n74, my_dp_mpy4_inst_mult_23_n73,
         my_dp_mpy4_inst_mult_23_n72, my_dp_mpy4_inst_mult_23_n71,
         my_dp_mpy4_inst_mult_23_n70, my_dp_mpy4_inst_mult_23_n69,
         my_dp_mpy4_inst_mult_23_n68, my_dp_mpy4_inst_mult_23_n67,
         my_dp_mpy4_inst_mult_23_n66, my_dp_mpy4_inst_mult_23_n65,
         my_dp_mpy4_inst_mult_23_n64, my_dp_mpy4_inst_mult_23_n63,
         my_dp_mpy4_inst_mult_23_n62, my_dp_mpy4_inst_mult_23_n61,
         my_dp_mpy4_inst_mult_23_n60, my_dp_mpy4_inst_mult_23_n59,
         my_dp_mpy4_inst_mult_23_n58, my_dp_mpy4_inst_mult_23_n57,
         my_dp_mpy4_inst_mult_23_n56, my_dp_mpy4_inst_mult_23_n55,
         my_dp_mpy4_inst_mult_23_n54, my_dp_mpy4_inst_mult_23_n53,
         my_dp_mpy4_inst_mult_23_n52, my_dp_mpy4_inst_mult_23_n51,
         my_dp_mpy4_inst_mult_23_n50, my_dp_mpy4_inst_mult_23_n49,
         my_dp_mpy4_inst_mult_23_n47, my_dp_mpy4_inst_mult_23_n46,
         my_dp_mpy4_inst_mult_23_n45, my_dp_mpy4_inst_mult_23_n44,
         my_dp_mpy4_inst_mult_23_n43, my_dp_mpy4_inst_mult_23_n42,
         my_dp_mpy4_inst_mult_23_n41, my_dp_mpy4_inst_mult_23_n40,
         my_dp_mpy4_inst_mult_23_n39, my_dp_mpy4_inst_mult_23_n38,
         my_dp_mpy4_inst_mult_23_n37, my_dp_mpy4_inst_mult_23_n36,
         my_dp_mpy4_inst_mult_23_n35, my_dp_mpy4_inst_mult_23_n33,
         my_dp_mpy4_inst_mult_23_n32, my_dp_mpy4_inst_mult_23_n31,
         my_dp_mpy4_inst_mult_23_n30, my_dp_mpy4_inst_mult_23_n29,
         my_dp_mpy4_inst_mult_23_n28, my_dp_mpy4_inst_mult_23_n27,
         my_dp_mpy4_inst_mult_23_n26, my_dp_mpy4_inst_mult_23_n25,
         my_dp_mpy4_inst_mult_23_n23, my_dp_mpy4_inst_mult_23_n22,
         my_dp_mpy4_inst_mult_23_n21, my_dp_mpy4_inst_mult_23_n20,
         my_dp_mpy4_inst_mult_23_n19, my_dp_mpy4_inst_mult_23_n8,
         my_dp_mpy4_inst_mult_23_n7, my_dp_mpy4_inst_mult_23_n6,
         my_dp_mpy4_inst_mult_23_n5, my_dp_mpy4_inst_mult_23_n4,
         my_dp_mpy4_inst_mult_23_n3, my_dp_mpy4_inst_mult_23_n2,
         my_dp_rin_inst_n10, my_dp_rin_inst_n9, my_dp_rin_inst_n8,
         my_dp_rin_inst_n7, my_dp_rin_inst_n6, my_dp_rin_inst_n5,
         my_dp_rin_inst_n4, my_dp_rin_inst_n3, my_dp_rin_inst_n2,
         my_dp_rin_inst_n1, my_dp_rin_inst_n21, my_dp_rin_inst_n20,
         my_dp_rin_inst_n19, my_dp_rin_inst_n18, my_dp_rin_inst_n17,
         my_dp_rin_inst_n16, my_dp_rin_inst_n15, my_dp_rin_inst_n14,
         my_dp_rin_inst_n13, my_dp_rin_inst_n12, my_dp_rin_inst_n11,
         my_dp_rout_inst_n32, my_dp_rout_inst_n31, my_dp_rout_inst_n30,
         my_dp_rout_inst_n29, my_dp_rout_inst_n28, my_dp_rout_inst_n27,
         my_dp_rout_inst_n26, my_dp_rout_inst_n25, my_dp_rout_inst_n24,
         my_dp_rout_inst_n23, my_dp_rout_inst_n22, my_dp_rout_inst_n10,
         my_dp_rout_inst_n9, my_dp_rout_inst_n8, my_dp_rout_inst_n7,
         my_dp_rout_inst_n6, my_dp_rout_inst_n5, my_dp_rout_inst_n4,
         my_dp_rout_inst_n3, my_dp_rout_inst_n2, my_dp_rout_inst_n1,
         my_dp_r0_inst_n32, my_dp_r0_inst_n31, my_dp_r0_inst_n30,
         my_dp_r0_inst_n29, my_dp_r0_inst_n28, my_dp_r0_inst_n27,
         my_dp_r0_inst_n26, my_dp_r0_inst_n25, my_dp_r0_inst_n24,
         my_dp_r0_inst_n23, my_dp_r0_inst_n22, my_dp_r0_inst_n10,
         my_dp_r0_inst_n9, my_dp_r0_inst_n8, my_dp_r0_inst_n7,
         my_dp_r0_inst_n6, my_dp_r0_inst_n5, my_dp_r0_inst_n4,
         my_dp_r0_inst_n3, my_dp_r0_inst_n2, my_dp_r0_inst_n1,
         my_dp_r1_inst_n32, my_dp_r1_inst_n31, my_dp_r1_inst_n30,
         my_dp_r1_inst_n29, my_dp_r1_inst_n28, my_dp_r1_inst_n27,
         my_dp_r1_inst_n26, my_dp_r1_inst_n25, my_dp_r1_inst_n24,
         my_dp_r1_inst_n23, my_dp_r1_inst_n22, my_dp_r1_inst_n10,
         my_dp_r1_inst_n9, my_dp_r1_inst_n8, my_dp_r1_inst_n7,
         my_dp_r1_inst_n6, my_dp_r1_inst_n5, my_dp_r1_inst_n4,
         my_dp_r1_inst_n3, my_dp_r1_inst_n2, my_dp_r1_inst_n1,
         my_dp_rb0_inst_n32, my_dp_rb0_inst_n31, my_dp_rb0_inst_n30,
         my_dp_rb0_inst_n29, my_dp_rb0_inst_n28, my_dp_rb0_inst_n27,
         my_dp_rb0_inst_n26, my_dp_rb0_inst_n25, my_dp_rb0_inst_n24,
         my_dp_rb0_inst_n23, my_dp_rb0_inst_n22, my_dp_rb0_inst_n10,
         my_dp_rb0_inst_n9, my_dp_rb0_inst_n8, my_dp_rb0_inst_n7,
         my_dp_rb0_inst_n6, my_dp_rb0_inst_n5, my_dp_rb0_inst_n4,
         my_dp_rb0_inst_n3, my_dp_rb0_inst_n2, my_dp_rb0_inst_n1,
         my_dp_ra1_inst_n32, my_dp_ra1_inst_n31, my_dp_ra1_inst_n30,
         my_dp_ra1_inst_n29, my_dp_ra1_inst_n28, my_dp_ra1_inst_n27,
         my_dp_ra1_inst_n26, my_dp_ra1_inst_n25, my_dp_ra1_inst_n24,
         my_dp_ra1_inst_n23, my_dp_ra1_inst_n22, my_dp_ra1_inst_n10,
         my_dp_ra1_inst_n9, my_dp_ra1_inst_n8, my_dp_ra1_inst_n7,
         my_dp_ra1_inst_n6, my_dp_ra1_inst_n5, my_dp_ra1_inst_n4,
         my_dp_ra1_inst_n3, my_dp_ra1_inst_n2, my_dp_ra1_inst_n1,
         my_dp_rb1_inst_n32, my_dp_rb1_inst_n31, my_dp_rb1_inst_n30,
         my_dp_rb1_inst_n29, my_dp_rb1_inst_n28, my_dp_rb1_inst_n27,
         my_dp_rb1_inst_n26, my_dp_rb1_inst_n25, my_dp_rb1_inst_n24,
         my_dp_rb1_inst_n23, my_dp_rb1_inst_n22, my_dp_rb1_inst_n10,
         my_dp_rb1_inst_n9, my_dp_rb1_inst_n8, my_dp_rb1_inst_n7,
         my_dp_rb1_inst_n6, my_dp_rb1_inst_n5, my_dp_rb1_inst_n4,
         my_dp_rb1_inst_n3, my_dp_rb1_inst_n2, my_dp_rb1_inst_n1,
         my_dp_ra2_inst_n32, my_dp_ra2_inst_n31, my_dp_ra2_inst_n30,
         my_dp_ra2_inst_n29, my_dp_ra2_inst_n28, my_dp_ra2_inst_n27,
         my_dp_ra2_inst_n26, my_dp_ra2_inst_n25, my_dp_ra2_inst_n24,
         my_dp_ra2_inst_n23, my_dp_ra2_inst_n22, my_dp_ra2_inst_n10,
         my_dp_ra2_inst_n9, my_dp_ra2_inst_n8, my_dp_ra2_inst_n7,
         my_dp_ra2_inst_n6, my_dp_ra2_inst_n5, my_dp_ra2_inst_n4,
         my_dp_ra2_inst_n3, my_dp_ra2_inst_n2, my_dp_ra2_inst_n1,
         my_dp_rb2_inst_n32, my_dp_rb2_inst_n31, my_dp_rb2_inst_n30,
         my_dp_rb2_inst_n29, my_dp_rb2_inst_n28, my_dp_rb2_inst_n27,
         my_dp_rb2_inst_n26, my_dp_rb2_inst_n25, my_dp_rb2_inst_n24,
         my_dp_rb2_inst_n23, my_dp_rb2_inst_n22, my_dp_rb2_inst_n10,
         my_dp_rb2_inst_n9, my_dp_rb2_inst_n8, my_dp_rb2_inst_n7,
         my_dp_rb2_inst_n6, my_dp_rb2_inst_n5, my_dp_rb2_inst_n4,
         my_dp_rb2_inst_n3, my_dp_rb2_inst_n2, my_dp_rb2_inst_n1,
         my_dp_dff_inst_n2, my_dp_dff_inst_n1, my_dp_dff_inst_n4,
         my_dp_dff_inst_n3;
  wire   [1:0] my_cu_future_state;
  wire   [1:0] my_cu_state;
  wire   [7:2] my_dp_sub_200_carry;
  wire   [8:0] my_dp_r1;
  wire   [8:0] my_dp_r0;
  wire   [44:0] my_dp_coeff;
  wire   [8:1] my_dp_tmp_add2;
  wire   [8:0] my_dp_add1;
  wire   [8:0] my_dp_add3;
  wire   [8:0] my_dp_add0;
  wire   [8:0] my_dp_add2;
  wire   [8:0] my_dp_rin;
  wire   [8:2] my_dp_add0_inst_add_22_carry;
  wire   [8:2] my_dp_add1_inst_add_22_carry;
  wire   [8:2] my_dp_add2_inst_add_22_carry;
  wire   [8:2] my_dp_add3_inst_add_22_carry;

  NOR2_X1 my_cu_U7 ( .A1(my_cu_n3), .A2(my_cu_state[1]), .ZN(logic_enable2) );
  OAI21_X1 my_cu_U6 ( .B1(my_cu_n3), .B2(my_cu_n2), .A(RST_n), .ZN(
        my_cu_future_state[1]) );
  AND3_X1 my_cu_U5 ( .A1(RST_n), .A2(my_cu_n2), .A3(VIN), .ZN(
        my_cu_future_state[0]) );
  NOR2_X1 my_cu_U4 ( .A1(my_cu_n2), .A2(my_cu_state[0]), .ZN(logic_enable3) );
  INV_X1 my_cu_U3 ( .A(logic_enable3), .ZN(logic_enable1) );
  DFF_X1 my_cu_state_reg_1_ ( .D(my_cu_future_state[1]), .CK(CLK), .Q(
        my_cu_state[1]), .QN(my_cu_n2) );
  DFF_X1 my_cu_state_reg_0_ ( .D(my_cu_future_state[0]), .CK(CLK), .Q(
        my_cu_state[0]), .QN(my_cu_n3) );
  XOR2_X1 my_dp_U25 ( .A(my_dp_n3), .B(my_dp_n2), .Z(my_dp_add2[1]) );
  AND2_X1 my_dp_U24 ( .A1(my_dp_n2), .A2(my_dp_n3), .ZN(my_dp_sub_200_carry[2]) );
  XOR2_X1 my_dp_U23 ( .A(my_dp_n4), .B(my_dp_sub_200_carry[2]), .Z(
        my_dp_add2[2]) );
  AND2_X1 my_dp_U22 ( .A1(my_dp_sub_200_carry[2]), .A2(my_dp_n4), .ZN(
        my_dp_sub_200_carry[3]) );
  XOR2_X1 my_dp_U21 ( .A(my_dp_n5), .B(my_dp_sub_200_carry[3]), .Z(
        my_dp_add2[3]) );
  AND2_X1 my_dp_U20 ( .A1(my_dp_sub_200_carry[3]), .A2(my_dp_n5), .ZN(
        my_dp_sub_200_carry[4]) );
  XOR2_X1 my_dp_U19 ( .A(my_dp_n6), .B(my_dp_sub_200_carry[4]), .Z(
        my_dp_add2[4]) );
  AND2_X1 my_dp_U18 ( .A1(my_dp_sub_200_carry[4]), .A2(my_dp_n6), .ZN(
        my_dp_sub_200_carry[5]) );
  XOR2_X1 my_dp_U17 ( .A(my_dp_n7), .B(my_dp_sub_200_carry[5]), .Z(
        my_dp_add2[5]) );
  AND2_X1 my_dp_U16 ( .A1(my_dp_sub_200_carry[5]), .A2(my_dp_n7), .ZN(
        my_dp_sub_200_carry[6]) );
  XOR2_X1 my_dp_U15 ( .A(my_dp_n8), .B(my_dp_sub_200_carry[6]), .Z(
        my_dp_add2[6]) );
  AND2_X1 my_dp_U14 ( .A1(my_dp_sub_200_carry[6]), .A2(my_dp_n8), .ZN(
        my_dp_sub_200_carry[7]) );
  XOR2_X1 my_dp_U13 ( .A(my_dp_n9), .B(my_dp_sub_200_carry[7]), .Z(
        my_dp_add2[7]) );
  NAND2_X1 my_dp_U12 ( .A1(my_dp_sub_200_carry[7]), .A2(my_dp_n9), .ZN(
        my_dp_n1) );
  XOR2_X1 my_dp_U11 ( .A(my_dp_tmp_add2[8]), .B(my_dp_n1), .Z(my_dp_add2[8])
         );
  INV_X1 my_dp_U10 ( .A(my_dp_add2[0]), .ZN(my_dp_n2) );
  INV_X1 my_dp_U9 ( .A(my_dp_tmp_add2[2]), .ZN(my_dp_n4) );
  INV_X1 my_dp_U8 ( .A(my_dp_tmp_add2[1]), .ZN(my_dp_n3) );
  INV_X1 my_dp_U7 ( .A(my_dp_tmp_add2[3]), .ZN(my_dp_n5) );
  INV_X1 my_dp_U6 ( .A(my_dp_tmp_add2[4]), .ZN(my_dp_n6) );
  INV_X1 my_dp_U5 ( .A(my_dp_tmp_add2[7]), .ZN(my_dp_n9) );
  INV_X1 my_dp_U4 ( .A(my_dp_tmp_add2[6]), .ZN(my_dp_n8) );
  INV_X1 my_dp_U3 ( .A(my_dp_tmp_add2[5]), .ZN(my_dp_n7) );
  XOR2_X1 my_dp_add0_inst_add_22_U2 ( .A(my_dp_add2[0]), .B(my_dp_rin[0]), .Z(
        my_dp_add0[0]) );
  AND2_X1 my_dp_add0_inst_add_22_U1 ( .A1(my_dp_add2[0]), .A2(my_dp_rin[0]), 
        .ZN(my_dp_add0_inst_add_22_n1) );
  FA_X1 my_dp_add0_inst_add_22_U1_1 ( .A(my_dp_rin[1]), .B(my_dp_add2[1]), 
        .CI(my_dp_add0_inst_add_22_n1), .CO(my_dp_add0_inst_add_22_carry[2]), 
        .S(my_dp_add0[1]) );
  FA_X1 my_dp_add0_inst_add_22_U1_2 ( .A(my_dp_rin[2]), .B(my_dp_add2[2]), 
        .CI(my_dp_add0_inst_add_22_carry[2]), .CO(
        my_dp_add0_inst_add_22_carry[3]), .S(my_dp_add0[2]) );
  FA_X1 my_dp_add0_inst_add_22_U1_3 ( .A(my_dp_rin[3]), .B(my_dp_add2[3]), 
        .CI(my_dp_add0_inst_add_22_carry[3]), .CO(
        my_dp_add0_inst_add_22_carry[4]), .S(my_dp_add0[3]) );
  FA_X1 my_dp_add0_inst_add_22_U1_4 ( .A(my_dp_rin[4]), .B(my_dp_add2[4]), 
        .CI(my_dp_add0_inst_add_22_carry[4]), .CO(
        my_dp_add0_inst_add_22_carry[5]), .S(my_dp_add0[4]) );
  FA_X1 my_dp_add0_inst_add_22_U1_5 ( .A(my_dp_rin[5]), .B(my_dp_add2[5]), 
        .CI(my_dp_add0_inst_add_22_carry[5]), .CO(
        my_dp_add0_inst_add_22_carry[6]), .S(my_dp_add0[5]) );
  FA_X1 my_dp_add0_inst_add_22_U1_6 ( .A(my_dp_rin[6]), .B(my_dp_add2[6]), 
        .CI(my_dp_add0_inst_add_22_carry[6]), .CO(
        my_dp_add0_inst_add_22_carry[7]), .S(my_dp_add0[6]) );
  FA_X1 my_dp_add0_inst_add_22_U1_7 ( .A(my_dp_rin[7]), .B(my_dp_add2[7]), 
        .CI(my_dp_add0_inst_add_22_carry[7]), .CO(
        my_dp_add0_inst_add_22_carry[8]), .S(my_dp_add0[7]) );
  FA_X1 my_dp_add0_inst_add_22_U1_8 ( .A(my_dp_rin[8]), .B(my_dp_add2[8]), 
        .CI(my_dp_add0_inst_add_22_carry[8]), .S(my_dp_add0[8]) );
  AND2_X1 my_dp_add1_inst_add_22_U2 ( .A1(my_dp_add3[0]), .A2(1'b0), .ZN(
        my_dp_add1_inst_add_22_n2) );
  XOR2_X1 my_dp_add1_inst_add_22_U1 ( .A(my_dp_add3[0]), .B(1'b0), .Z(
        my_dp_add1[0]) );
  FA_X1 my_dp_add1_inst_add_22_U1_1 ( .A(1'b0), .B(my_dp_add3[1]), .CI(
        my_dp_add1_inst_add_22_n2), .CO(my_dp_add1_inst_add_22_carry[2]), .S(
        my_dp_add1[1]) );
  FA_X1 my_dp_add1_inst_add_22_U1_2 ( .A(1'b0), .B(my_dp_add3[2]), .CI(
        my_dp_add1_inst_add_22_carry[2]), .CO(my_dp_add1_inst_add_22_carry[3]), 
        .S(my_dp_add1[2]) );
  FA_X1 my_dp_add1_inst_add_22_U1_3 ( .A(my_dp_mpy_0__3_), .B(my_dp_add3[3]), 
        .CI(my_dp_add1_inst_add_22_carry[3]), .CO(
        my_dp_add1_inst_add_22_carry[4]), .S(my_dp_add1[3]) );
  FA_X1 my_dp_add1_inst_add_22_U1_4 ( .A(my_dp_mpy_0__4_), .B(my_dp_add3[4]), 
        .CI(my_dp_add1_inst_add_22_carry[4]), .CO(
        my_dp_add1_inst_add_22_carry[5]), .S(my_dp_add1[4]) );
  FA_X1 my_dp_add1_inst_add_22_U1_5 ( .A(my_dp_mpy_0__5_), .B(my_dp_add3[5]), 
        .CI(my_dp_add1_inst_add_22_carry[5]), .CO(
        my_dp_add1_inst_add_22_carry[6]), .S(my_dp_add1[5]) );
  FA_X1 my_dp_add1_inst_add_22_U1_6 ( .A(my_dp_mpy_0__6_), .B(my_dp_add3[6]), 
        .CI(my_dp_add1_inst_add_22_carry[6]), .CO(
        my_dp_add1_inst_add_22_carry[7]), .S(my_dp_add1[6]) );
  FA_X1 my_dp_add1_inst_add_22_U1_7 ( .A(my_dp_mpy_0__7_), .B(my_dp_add3[7]), 
        .CI(my_dp_add1_inst_add_22_carry[7]), .CO(
        my_dp_add1_inst_add_22_carry[8]), .S(my_dp_add1[7]) );
  FA_X1 my_dp_add1_inst_add_22_U1_8 ( .A(my_dp_mpy_0__8_), .B(my_dp_add3[8]), 
        .CI(my_dp_add1_inst_add_22_carry[8]), .S(my_dp_add1[8]) );
  AND2_X1 my_dp_add2_inst_add_22_U2 ( .A1(1'b0), .A2(1'b0), .ZN(
        my_dp_add2_inst_add_22_n2) );
  XOR2_X1 my_dp_add2_inst_add_22_U1 ( .A(1'b0), .B(1'b0), .Z(my_dp_add2[0]) );
  FA_X1 my_dp_add2_inst_add_22_U1_1 ( .A(1'b0), .B(1'b0), .CI(
        my_dp_add2_inst_add_22_n2), .CO(my_dp_add2_inst_add_22_carry[2]), .S(
        my_dp_tmp_add2[1]) );
  FA_X1 my_dp_add2_inst_add_22_U1_2 ( .A(1'b0), .B(1'b0), .CI(
        my_dp_add2_inst_add_22_carry[2]), .CO(my_dp_add2_inst_add_22_carry[3]), 
        .S(my_dp_tmp_add2[2]) );
  FA_X1 my_dp_add2_inst_add_22_U1_3 ( .A(my_dp_mpy_1__3_), .B(my_dp_mpy_3__3_), 
        .CI(my_dp_add2_inst_add_22_carry[3]), .CO(
        my_dp_add2_inst_add_22_carry[4]), .S(my_dp_tmp_add2[3]) );
  FA_X1 my_dp_add2_inst_add_22_U1_4 ( .A(my_dp_mpy_1__4_), .B(my_dp_mpy_3__4_), 
        .CI(my_dp_add2_inst_add_22_carry[4]), .CO(
        my_dp_add2_inst_add_22_carry[5]), .S(my_dp_tmp_add2[4]) );
  FA_X1 my_dp_add2_inst_add_22_U1_5 ( .A(my_dp_mpy_1__5_), .B(my_dp_mpy_3__5_), 
        .CI(my_dp_add2_inst_add_22_carry[5]), .CO(
        my_dp_add2_inst_add_22_carry[6]), .S(my_dp_tmp_add2[5]) );
  FA_X1 my_dp_add2_inst_add_22_U1_6 ( .A(my_dp_mpy_1__6_), .B(my_dp_mpy_3__6_), 
        .CI(my_dp_add2_inst_add_22_carry[6]), .CO(
        my_dp_add2_inst_add_22_carry[7]), .S(my_dp_tmp_add2[6]) );
  FA_X1 my_dp_add2_inst_add_22_U1_7 ( .A(my_dp_mpy_1__7_), .B(my_dp_mpy_3__7_), 
        .CI(my_dp_add2_inst_add_22_carry[7]), .CO(
        my_dp_add2_inst_add_22_carry[8]), .S(my_dp_tmp_add2[7]) );
  FA_X1 my_dp_add2_inst_add_22_U1_8 ( .A(my_dp_mpy_1__8_), .B(my_dp_mpy_3__8_), 
        .CI(my_dp_add2_inst_add_22_carry[8]), .S(my_dp_tmp_add2[8]) );
  AND2_X1 my_dp_add3_inst_add_22_U2 ( .A1(1'b0), .A2(1'b0), .ZN(
        my_dp_add3_inst_add_22_n2) );
  XOR2_X1 my_dp_add3_inst_add_22_U1 ( .A(1'b0), .B(1'b0), .Z(my_dp_add3[0]) );
  FA_X1 my_dp_add3_inst_add_22_U1_1 ( .A(1'b0), .B(1'b0), .CI(
        my_dp_add3_inst_add_22_n2), .CO(my_dp_add3_inst_add_22_carry[2]), .S(
        my_dp_add3[1]) );
  FA_X1 my_dp_add3_inst_add_22_U1_2 ( .A(1'b0), .B(1'b0), .CI(
        my_dp_add3_inst_add_22_carry[2]), .CO(my_dp_add3_inst_add_22_carry[3]), 
        .S(my_dp_add3[2]) );
  FA_X1 my_dp_add3_inst_add_22_U1_3 ( .A(my_dp_mpy_2__3_), .B(my_dp_mpy_4__3_), 
        .CI(my_dp_add3_inst_add_22_carry[3]), .CO(
        my_dp_add3_inst_add_22_carry[4]), .S(my_dp_add3[3]) );
  FA_X1 my_dp_add3_inst_add_22_U1_4 ( .A(my_dp_mpy_2__4_), .B(my_dp_mpy_4__4_), 
        .CI(my_dp_add3_inst_add_22_carry[4]), .CO(
        my_dp_add3_inst_add_22_carry[5]), .S(my_dp_add3[4]) );
  FA_X1 my_dp_add3_inst_add_22_U1_5 ( .A(my_dp_mpy_2__5_), .B(my_dp_mpy_4__5_), 
        .CI(my_dp_add3_inst_add_22_carry[5]), .CO(
        my_dp_add3_inst_add_22_carry[6]), .S(my_dp_add3[5]) );
  FA_X1 my_dp_add3_inst_add_22_U1_6 ( .A(my_dp_mpy_2__6_), .B(my_dp_mpy_4__6_), 
        .CI(my_dp_add3_inst_add_22_carry[6]), .CO(
        my_dp_add3_inst_add_22_carry[7]), .S(my_dp_add3[6]) );
  FA_X1 my_dp_add3_inst_add_22_U1_7 ( .A(my_dp_mpy_2__7_), .B(my_dp_mpy_4__7_), 
        .CI(my_dp_add3_inst_add_22_carry[7]), .CO(
        my_dp_add3_inst_add_22_carry[8]), .S(my_dp_add3[7]) );
  FA_X1 my_dp_add3_inst_add_22_U1_8 ( .A(my_dp_mpy_2__8_), .B(my_dp_mpy_4__8_), 
        .CI(my_dp_add3_inst_add_22_carry[8]), .S(my_dp_add3[8]) );
  XOR2_X1 my_dp_mpy0_inst_mult_23_U358 ( .A(my_dp_coeff[44]), .B(
        my_dp_mpy0_inst_mult_23_n294), .Z(my_dp_mpy0_inst_mult_23_n331) );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U357 ( .A(my_dp_add0[7]), .B(
        my_dp_coeff[44]), .ZN(my_dp_mpy0_inst_mult_23_n374) );
  NOR2_X1 my_dp_mpy0_inst_mult_23_U356 ( .A1(my_dp_mpy0_inst_mult_23_n331), 
        .A2(my_dp_mpy0_inst_mult_23_n374), .ZN(my_dp_mpy0_inst_mult_23_n102)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U355 ( .A(my_dp_add0[5]), .B(
        my_dp_coeff[44]), .ZN(my_dp_mpy0_inst_mult_23_n373) );
  NOR2_X1 my_dp_mpy0_inst_mult_23_U354 ( .A1(my_dp_mpy0_inst_mult_23_n331), 
        .A2(my_dp_mpy0_inst_mult_23_n373), .ZN(my_dp_mpy0_inst_mult_23_n103)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U353 ( .A(my_dp_add0[3]), .B(
        my_dp_coeff[44]), .ZN(my_dp_mpy0_inst_mult_23_n372) );
  NOR2_X1 my_dp_mpy0_inst_mult_23_U352 ( .A1(my_dp_mpy0_inst_mult_23_n331), 
        .A2(my_dp_mpy0_inst_mult_23_n372), .ZN(my_dp_mpy0_inst_mult_23_n104)
         );
  NOR2_X1 my_dp_mpy0_inst_mult_23_U351 ( .A1(my_dp_mpy0_inst_mult_23_n331), 
        .A2(my_dp_mpy0_inst_mult_23_n292), .ZN(my_dp_mpy0_inst_mult_23_n106)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U350 ( .A(my_dp_add0[8]), .B(
        my_dp_coeff[43]), .ZN(my_dp_mpy0_inst_mult_23_n369) );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U349 ( .A(my_dp_mpy0_inst_mult_23_n294), 
        .B(my_dp_coeff[42]), .ZN(my_dp_mpy0_inst_mult_23_n371) );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U348 ( .A1(my_dp_mpy0_inst_mult_23_n307), 
        .A2(my_dp_mpy0_inst_mult_23_n371), .ZN(my_dp_mpy0_inst_mult_23_n305)
         );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U347 ( .A1(my_dp_mpy0_inst_mult_23_n369), 
        .A2(my_dp_mpy0_inst_mult_23_n307), .B1(my_dp_mpy0_inst_mult_23_n305), 
        .B2(my_dp_mpy0_inst_mult_23_n369), .ZN(my_dp_mpy0_inst_mult_23_n370)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U346 ( .A(my_dp_add0[7]), .B(
        my_dp_coeff[43]), .ZN(my_dp_mpy0_inst_mult_23_n368) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U345 ( .A1(my_dp_mpy0_inst_mult_23_n368), 
        .A2(my_dp_mpy0_inst_mult_23_n305), .B1(my_dp_mpy0_inst_mult_23_n307), 
        .B2(my_dp_mpy0_inst_mult_23_n369), .ZN(my_dp_mpy0_inst_mult_23_n108)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U344 ( .A(my_dp_add0[6]), .B(
        my_dp_coeff[43]), .ZN(my_dp_mpy0_inst_mult_23_n367) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U343 ( .A1(my_dp_mpy0_inst_mult_23_n367), 
        .A2(my_dp_mpy0_inst_mult_23_n305), .B1(my_dp_mpy0_inst_mult_23_n307), 
        .B2(my_dp_mpy0_inst_mult_23_n368), .ZN(my_dp_mpy0_inst_mult_23_n109)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U342 ( .A(my_dp_add0[5]), .B(
        my_dp_coeff[43]), .ZN(my_dp_mpy0_inst_mult_23_n366) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U341 ( .A1(my_dp_mpy0_inst_mult_23_n366), 
        .A2(my_dp_mpy0_inst_mult_23_n305), .B1(my_dp_mpy0_inst_mult_23_n307), 
        .B2(my_dp_mpy0_inst_mult_23_n367), .ZN(my_dp_mpy0_inst_mult_23_n110)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U340 ( .A(my_dp_add0[4]), .B(
        my_dp_coeff[43]), .ZN(my_dp_mpy0_inst_mult_23_n365) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U339 ( .A1(my_dp_mpy0_inst_mult_23_n365), 
        .A2(my_dp_mpy0_inst_mult_23_n305), .B1(my_dp_mpy0_inst_mult_23_n307), 
        .B2(my_dp_mpy0_inst_mult_23_n366), .ZN(my_dp_mpy0_inst_mult_23_n111)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U338 ( .A(my_dp_add0[3]), .B(
        my_dp_coeff[43]), .ZN(my_dp_mpy0_inst_mult_23_n364) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U337 ( .A1(my_dp_mpy0_inst_mult_23_n364), 
        .A2(my_dp_mpy0_inst_mult_23_n305), .B1(my_dp_mpy0_inst_mult_23_n307), 
        .B2(my_dp_mpy0_inst_mult_23_n365), .ZN(my_dp_mpy0_inst_mult_23_n112)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U336 ( .A(my_dp_add0[2]), .B(
        my_dp_coeff[43]), .ZN(my_dp_mpy0_inst_mult_23_n363) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U335 ( .A1(my_dp_mpy0_inst_mult_23_n363), 
        .A2(my_dp_mpy0_inst_mult_23_n305), .B1(my_dp_mpy0_inst_mult_23_n307), 
        .B2(my_dp_mpy0_inst_mult_23_n364), .ZN(my_dp_mpy0_inst_mult_23_n113)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U334 ( .A(my_dp_add0[1]), .B(
        my_dp_coeff[43]), .ZN(my_dp_mpy0_inst_mult_23_n362) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U333 ( .A1(my_dp_mpy0_inst_mult_23_n362), 
        .A2(my_dp_mpy0_inst_mult_23_n305), .B1(my_dp_mpy0_inst_mult_23_n307), 
        .B2(my_dp_mpy0_inst_mult_23_n363), .ZN(my_dp_mpy0_inst_mult_23_n114)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U332 ( .A(my_dp_coeff[43]), .B(
        my_dp_add0[0]), .ZN(my_dp_mpy0_inst_mult_23_n361) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U331 ( .A1(my_dp_mpy0_inst_mult_23_n361), 
        .A2(my_dp_mpy0_inst_mult_23_n305), .B1(my_dp_mpy0_inst_mult_23_n307), 
        .B2(my_dp_mpy0_inst_mult_23_n362), .ZN(my_dp_mpy0_inst_mult_23_n115)
         );
  NOR2_X1 my_dp_mpy0_inst_mult_23_U330 ( .A1(my_dp_mpy0_inst_mult_23_n307), 
        .A2(my_dp_mpy0_inst_mult_23_n292), .ZN(my_dp_mpy0_inst_mult_23_n116)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U329 ( .A(my_dp_add0[8]), .B(
        my_dp_coeff[41]), .ZN(my_dp_mpy0_inst_mult_23_n358) );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U328 ( .A(my_dp_mpy0_inst_mult_23_n295), 
        .B(my_dp_coeff[40]), .ZN(my_dp_mpy0_inst_mult_23_n360) );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U327 ( .A1(my_dp_mpy0_inst_mult_23_n304), 
        .A2(my_dp_mpy0_inst_mult_23_n360), .ZN(my_dp_mpy0_inst_mult_23_n302)
         );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U326 ( .A1(my_dp_mpy0_inst_mult_23_n358), 
        .A2(my_dp_mpy0_inst_mult_23_n304), .B1(my_dp_mpy0_inst_mult_23_n302), 
        .B2(my_dp_mpy0_inst_mult_23_n358), .ZN(my_dp_mpy0_inst_mult_23_n359)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U325 ( .A(my_dp_add0[7]), .B(
        my_dp_coeff[41]), .ZN(my_dp_mpy0_inst_mult_23_n357) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U324 ( .A1(my_dp_mpy0_inst_mult_23_n357), 
        .A2(my_dp_mpy0_inst_mult_23_n302), .B1(my_dp_mpy0_inst_mult_23_n304), 
        .B2(my_dp_mpy0_inst_mult_23_n358), .ZN(my_dp_mpy0_inst_mult_23_n118)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U323 ( .A(my_dp_add0[6]), .B(
        my_dp_coeff[41]), .ZN(my_dp_mpy0_inst_mult_23_n356) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U322 ( .A1(my_dp_mpy0_inst_mult_23_n356), 
        .A2(my_dp_mpy0_inst_mult_23_n302), .B1(my_dp_mpy0_inst_mult_23_n304), 
        .B2(my_dp_mpy0_inst_mult_23_n357), .ZN(my_dp_mpy0_inst_mult_23_n119)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U321 ( .A(my_dp_add0[5]), .B(
        my_dp_coeff[41]), .ZN(my_dp_mpy0_inst_mult_23_n355) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U320 ( .A1(my_dp_mpy0_inst_mult_23_n355), 
        .A2(my_dp_mpy0_inst_mult_23_n302), .B1(my_dp_mpy0_inst_mult_23_n304), 
        .B2(my_dp_mpy0_inst_mult_23_n356), .ZN(my_dp_mpy0_inst_mult_23_n120)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U319 ( .A(my_dp_add0[4]), .B(
        my_dp_coeff[41]), .ZN(my_dp_mpy0_inst_mult_23_n354) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U318 ( .A1(my_dp_mpy0_inst_mult_23_n354), 
        .A2(my_dp_mpy0_inst_mult_23_n302), .B1(my_dp_mpy0_inst_mult_23_n304), 
        .B2(my_dp_mpy0_inst_mult_23_n355), .ZN(my_dp_mpy0_inst_mult_23_n121)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U317 ( .A(my_dp_add0[3]), .B(
        my_dp_coeff[41]), .ZN(my_dp_mpy0_inst_mult_23_n353) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U316 ( .A1(my_dp_mpy0_inst_mult_23_n353), 
        .A2(my_dp_mpy0_inst_mult_23_n302), .B1(my_dp_mpy0_inst_mult_23_n304), 
        .B2(my_dp_mpy0_inst_mult_23_n354), .ZN(my_dp_mpy0_inst_mult_23_n122)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U315 ( .A(my_dp_add0[2]), .B(
        my_dp_coeff[41]), .ZN(my_dp_mpy0_inst_mult_23_n352) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U314 ( .A1(my_dp_mpy0_inst_mult_23_n352), 
        .A2(my_dp_mpy0_inst_mult_23_n302), .B1(my_dp_mpy0_inst_mult_23_n304), 
        .B2(my_dp_mpy0_inst_mult_23_n353), .ZN(my_dp_mpy0_inst_mult_23_n123)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U313 ( .A(my_dp_add0[1]), .B(
        my_dp_coeff[41]), .ZN(my_dp_mpy0_inst_mult_23_n351) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U312 ( .A1(my_dp_mpy0_inst_mult_23_n351), 
        .A2(my_dp_mpy0_inst_mult_23_n302), .B1(my_dp_mpy0_inst_mult_23_n304), 
        .B2(my_dp_mpy0_inst_mult_23_n352), .ZN(my_dp_mpy0_inst_mult_23_n124)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U311 ( .A(my_dp_coeff[41]), .B(
        my_dp_add0[0]), .ZN(my_dp_mpy0_inst_mult_23_n350) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U310 ( .A1(my_dp_mpy0_inst_mult_23_n350), 
        .A2(my_dp_mpy0_inst_mult_23_n302), .B1(my_dp_mpy0_inst_mult_23_n304), 
        .B2(my_dp_mpy0_inst_mult_23_n351), .ZN(my_dp_mpy0_inst_mult_23_n125)
         );
  NOR2_X1 my_dp_mpy0_inst_mult_23_U309 ( .A1(my_dp_mpy0_inst_mult_23_n304), 
        .A2(my_dp_mpy0_inst_mult_23_n292), .ZN(my_dp_mpy0_inst_mult_23_n126)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U308 ( .A(my_dp_add0[8]), .B(
        my_dp_coeff[39]), .ZN(my_dp_mpy0_inst_mult_23_n347) );
  XOR2_X1 my_dp_mpy0_inst_mult_23_U307 ( .A(my_dp_coeff[38]), .B(
        my_dp_coeff[37]), .Z(my_dp_mpy0_inst_mult_23_n318) );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U306 ( .A(my_dp_mpy0_inst_mult_23_n296), 
        .B(my_dp_coeff[38]), .ZN(my_dp_mpy0_inst_mult_23_n349) );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U305 ( .A1(my_dp_mpy0_inst_mult_23_n297), 
        .A2(my_dp_mpy0_inst_mult_23_n349), .ZN(my_dp_mpy0_inst_mult_23_n316)
         );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U304 ( .A1(my_dp_mpy0_inst_mult_23_n347), 
        .A2(my_dp_mpy0_inst_mult_23_n297), .B1(my_dp_mpy0_inst_mult_23_n316), 
        .B2(my_dp_mpy0_inst_mult_23_n347), .ZN(my_dp_mpy0_inst_mult_23_n348)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U303 ( .A(my_dp_add0[7]), .B(
        my_dp_coeff[39]), .ZN(my_dp_mpy0_inst_mult_23_n346) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U302 ( .A1(my_dp_mpy0_inst_mult_23_n346), 
        .A2(my_dp_mpy0_inst_mult_23_n316), .B1(my_dp_mpy0_inst_mult_23_n297), 
        .B2(my_dp_mpy0_inst_mult_23_n347), .ZN(my_dp_mpy0_inst_mult_23_n128)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U301 ( .A(my_dp_add0[6]), .B(
        my_dp_coeff[39]), .ZN(my_dp_mpy0_inst_mult_23_n345) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U300 ( .A1(my_dp_mpy0_inst_mult_23_n345), 
        .A2(my_dp_mpy0_inst_mult_23_n316), .B1(my_dp_mpy0_inst_mult_23_n297), 
        .B2(my_dp_mpy0_inst_mult_23_n346), .ZN(my_dp_mpy0_inst_mult_23_n129)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U299 ( .A(my_dp_add0[5]), .B(
        my_dp_coeff[39]), .ZN(my_dp_mpy0_inst_mult_23_n344) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U298 ( .A1(my_dp_mpy0_inst_mult_23_n344), 
        .A2(my_dp_mpy0_inst_mult_23_n316), .B1(my_dp_mpy0_inst_mult_23_n297), 
        .B2(my_dp_mpy0_inst_mult_23_n345), .ZN(my_dp_mpy0_inst_mult_23_n130)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U297 ( .A(my_dp_add0[4]), .B(
        my_dp_coeff[39]), .ZN(my_dp_mpy0_inst_mult_23_n343) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U296 ( .A1(my_dp_mpy0_inst_mult_23_n343), 
        .A2(my_dp_mpy0_inst_mult_23_n316), .B1(my_dp_mpy0_inst_mult_23_n297), 
        .B2(my_dp_mpy0_inst_mult_23_n344), .ZN(my_dp_mpy0_inst_mult_23_n131)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U295 ( .A(my_dp_add0[3]), .B(
        my_dp_coeff[39]), .ZN(my_dp_mpy0_inst_mult_23_n342) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U294 ( .A1(my_dp_mpy0_inst_mult_23_n342), 
        .A2(my_dp_mpy0_inst_mult_23_n316), .B1(my_dp_mpy0_inst_mult_23_n297), 
        .B2(my_dp_mpy0_inst_mult_23_n343), .ZN(my_dp_mpy0_inst_mult_23_n132)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U293 ( .A(my_dp_add0[2]), .B(
        my_dp_coeff[39]), .ZN(my_dp_mpy0_inst_mult_23_n341) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U292 ( .A1(my_dp_mpy0_inst_mult_23_n341), 
        .A2(my_dp_mpy0_inst_mult_23_n316), .B1(my_dp_mpy0_inst_mult_23_n297), 
        .B2(my_dp_mpy0_inst_mult_23_n342), .ZN(my_dp_mpy0_inst_mult_23_n133)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U291 ( .A(my_dp_add0[1]), .B(
        my_dp_coeff[39]), .ZN(my_dp_mpy0_inst_mult_23_n340) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U290 ( .A1(my_dp_mpy0_inst_mult_23_n340), 
        .A2(my_dp_mpy0_inst_mult_23_n316), .B1(my_dp_mpy0_inst_mult_23_n297), 
        .B2(my_dp_mpy0_inst_mult_23_n341), .ZN(my_dp_mpy0_inst_mult_23_n134)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U289 ( .A(my_dp_coeff[39]), .B(
        my_dp_add0[0]), .ZN(my_dp_mpy0_inst_mult_23_n339) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U288 ( .A1(my_dp_mpy0_inst_mult_23_n339), 
        .A2(my_dp_mpy0_inst_mult_23_n316), .B1(my_dp_mpy0_inst_mult_23_n297), 
        .B2(my_dp_mpy0_inst_mult_23_n340), .ZN(my_dp_mpy0_inst_mult_23_n135)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U287 ( .A(my_dp_add0[8]), .B(
        my_dp_coeff[37]), .ZN(my_dp_mpy0_inst_mult_23_n337) );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U286 ( .A1(my_dp_coeff[37]), .A2(
        my_dp_mpy0_inst_mult_23_n298), .ZN(my_dp_mpy0_inst_mult_23_n323) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U285 ( .A1(my_dp_mpy0_inst_mult_23_n298), 
        .A2(my_dp_mpy0_inst_mult_23_n337), .B1(my_dp_mpy0_inst_mult_23_n323), 
        .B2(my_dp_mpy0_inst_mult_23_n337), .ZN(my_dp_mpy0_inst_mult_23_n338)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U284 ( .A(my_dp_add0[7]), .B(
        my_dp_coeff[37]), .ZN(my_dp_mpy0_inst_mult_23_n336) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U283 ( .A1(my_dp_mpy0_inst_mult_23_n336), 
        .A2(my_dp_mpy0_inst_mult_23_n323), .B1(my_dp_mpy0_inst_mult_23_n337), 
        .B2(my_dp_mpy0_inst_mult_23_n298), .ZN(my_dp_mpy0_inst_mult_23_n138)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U282 ( .A(my_dp_add0[6]), .B(
        my_dp_coeff[37]), .ZN(my_dp_mpy0_inst_mult_23_n335) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U281 ( .A1(my_dp_mpy0_inst_mult_23_n335), 
        .A2(my_dp_mpy0_inst_mult_23_n323), .B1(my_dp_mpy0_inst_mult_23_n336), 
        .B2(my_dp_mpy0_inst_mult_23_n298), .ZN(my_dp_mpy0_inst_mult_23_n139)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U280 ( .A(my_dp_add0[5]), .B(
        my_dp_coeff[37]), .ZN(my_dp_mpy0_inst_mult_23_n334) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U279 ( .A1(my_dp_mpy0_inst_mult_23_n334), 
        .A2(my_dp_mpy0_inst_mult_23_n323), .B1(my_dp_mpy0_inst_mult_23_n335), 
        .B2(my_dp_mpy0_inst_mult_23_n298), .ZN(my_dp_mpy0_inst_mult_23_n140)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U278 ( .A(my_dp_add0[4]), .B(
        my_dp_coeff[37]), .ZN(my_dp_mpy0_inst_mult_23_n333) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U277 ( .A1(my_dp_mpy0_inst_mult_23_n333), 
        .A2(my_dp_mpy0_inst_mult_23_n323), .B1(my_dp_mpy0_inst_mult_23_n334), 
        .B2(my_dp_mpy0_inst_mult_23_n298), .ZN(my_dp_mpy0_inst_mult_23_n141)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U276 ( .A(my_dp_add0[3]), .B(
        my_dp_coeff[37]), .ZN(my_dp_mpy0_inst_mult_23_n332) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U275 ( .A1(my_dp_mpy0_inst_mult_23_n332), 
        .A2(my_dp_mpy0_inst_mult_23_n323), .B1(my_dp_mpy0_inst_mult_23_n333), 
        .B2(my_dp_mpy0_inst_mult_23_n298), .ZN(my_dp_mpy0_inst_mult_23_n142)
         );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U274 ( .A(my_dp_add0[2]), .B(
        my_dp_coeff[37]), .ZN(my_dp_mpy0_inst_mult_23_n324) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U273 ( .A1(my_dp_mpy0_inst_mult_23_n324), 
        .A2(my_dp_mpy0_inst_mult_23_n323), .B1(my_dp_mpy0_inst_mult_23_n332), 
        .B2(my_dp_mpy0_inst_mult_23_n298), .ZN(my_dp_mpy0_inst_mult_23_n143)
         );
  XOR2_X1 my_dp_mpy0_inst_mult_23_U272 ( .A(my_dp_add0[8]), .B(my_dp_coeff[44]), .Z(my_dp_mpy0_inst_mult_23_n301) );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U271 ( .A1(my_dp_mpy0_inst_mult_23_n301), 
        .A2(my_dp_mpy0_inst_mult_23_n293), .ZN(my_dp_mpy0_inst_mult_23_n19) );
  XOR2_X1 my_dp_mpy0_inst_mult_23_U270 ( .A(my_dp_add0[6]), .B(my_dp_coeff[44]), .Z(my_dp_mpy0_inst_mult_23_n330) );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U269 ( .A1(my_dp_mpy0_inst_mult_23_n330), 
        .A2(my_dp_mpy0_inst_mult_23_n293), .ZN(my_dp_mpy0_inst_mult_23_n25) );
  XOR2_X1 my_dp_mpy0_inst_mult_23_U268 ( .A(my_dp_add0[4]), .B(my_dp_coeff[44]), .Z(my_dp_mpy0_inst_mult_23_n329) );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U267 ( .A1(my_dp_mpy0_inst_mult_23_n329), 
        .A2(my_dp_mpy0_inst_mult_23_n293), .ZN(my_dp_mpy0_inst_mult_23_n35) );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U266 ( .A1(my_dp_mpy0_inst_mult_23_n328), 
        .A2(my_dp_mpy0_inst_mult_23_n293), .ZN(my_dp_mpy0_inst_mult_23_n49) );
  NAND3_X1 my_dp_mpy0_inst_mult_23_U265 ( .A1(my_dp_mpy0_inst_mult_23_n293), 
        .A2(my_dp_mpy0_inst_mult_23_n292), .A3(my_dp_coeff[44]), .ZN(
        my_dp_mpy0_inst_mult_23_n325) );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U264 ( .A(my_dp_mpy0_inst_mult_23_n291), 
        .B(my_dp_coeff[44]), .ZN(my_dp_mpy0_inst_mult_23_n327) );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U263 ( .A1(my_dp_mpy0_inst_mult_23_n327), 
        .A2(my_dp_mpy0_inst_mult_23_n293), .ZN(my_dp_mpy0_inst_mult_23_n326)
         );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U262 ( .A1(my_dp_mpy0_inst_mult_23_n325), 
        .A2(my_dp_mpy0_inst_mult_23_n326), .ZN(my_dp_mpy0_inst_mult_23_n56) );
  XNOR2_X1 my_dp_mpy0_inst_mult_23_U261 ( .A(my_dp_mpy0_inst_mult_23_n325), 
        .B(my_dp_mpy0_inst_mult_23_n326), .ZN(my_dp_mpy0_inst_mult_23_n57) );
  OAI22_X1 my_dp_mpy0_inst_mult_23_U260 ( .A1(my_dp_add0[1]), .A2(
        my_dp_mpy0_inst_mult_23_n323), .B1(my_dp_mpy0_inst_mult_23_n324), .B2(
        my_dp_mpy0_inst_mult_23_n298), .ZN(my_dp_mpy0_inst_mult_23_n322) );
  NAND2_X1 my_dp_mpy0_inst_mult_23_U259 ( .A1(my_dp_mpy0_inst_mult_23_n318), 
        .A2(my_dp_mpy0_inst_mult_23_n322), .ZN(my_dp_mpy0_inst_mult_23_n320)
         );
  NAND3_X1 my_dp_mpy0_inst_mult_23_U258 ( .A1(my_dp_mpy0_inst_mult_23_n322), 
        .A2(my_dp_mpy0_inst_mult_23_n291), .A3(my_dp_coeff[37]), .ZN(
        my_dp_mpy0_inst_mult_23_n321) );
  MUX2_X1 my_dp_mpy0_inst_mult_23_U257 ( .A(my_dp_mpy0_inst_mult_23_n320), .B(
        my_dp_mpy0_inst_mult_23_n321), .S(my_dp_mpy0_inst_mult_23_n292), .Z(
        my_dp_mpy0_inst_mult_23_n319) );
  NAND3_X1 my_dp_mpy0_inst_mult_23_U256 ( .A1(my_dp_mpy0_inst_mult_23_n318), 
        .A2(my_dp_mpy0_inst_mult_23_n292), .A3(my_dp_coeff[39]), .ZN(
        my_dp_mpy0_inst_mult_23_n317) );
  OAI21_X1 my_dp_mpy0_inst_mult_23_U255 ( .B1(my_dp_mpy0_inst_mult_23_n296), 
        .B2(my_dp_mpy0_inst_mult_23_n316), .A(my_dp_mpy0_inst_mult_23_n317), 
        .ZN(my_dp_mpy0_inst_mult_23_n315) );
  AOI222_X1 my_dp_mpy0_inst_mult_23_U254 ( .A1(my_dp_mpy0_inst_mult_23_n290), 
        .A2(my_dp_mpy0_inst_mult_23_n81), .B1(my_dp_mpy0_inst_mult_23_n315), 
        .B2(my_dp_mpy0_inst_mult_23_n290), .C1(my_dp_mpy0_inst_mult_23_n315), 
        .C2(my_dp_mpy0_inst_mult_23_n81), .ZN(my_dp_mpy0_inst_mult_23_n314) );
  AOI222_X1 my_dp_mpy0_inst_mult_23_U253 ( .A1(my_dp_mpy0_inst_mult_23_n288), 
        .A2(my_dp_mpy0_inst_mult_23_n79), .B1(my_dp_mpy0_inst_mult_23_n288), 
        .B2(my_dp_mpy0_inst_mult_23_n80), .C1(my_dp_mpy0_inst_mult_23_n80), 
        .C2(my_dp_mpy0_inst_mult_23_n79), .ZN(my_dp_mpy0_inst_mult_23_n313) );
  AOI222_X1 my_dp_mpy0_inst_mult_23_U252 ( .A1(my_dp_mpy0_inst_mult_23_n287), 
        .A2(my_dp_mpy0_inst_mult_23_n75), .B1(my_dp_mpy0_inst_mult_23_n287), 
        .B2(my_dp_mpy0_inst_mult_23_n78), .C1(my_dp_mpy0_inst_mult_23_n78), 
        .C2(my_dp_mpy0_inst_mult_23_n75), .ZN(my_dp_mpy0_inst_mult_23_n312) );
  AOI222_X1 my_dp_mpy0_inst_mult_23_U251 ( .A1(my_dp_mpy0_inst_mult_23_n285), 
        .A2(my_dp_mpy0_inst_mult_23_n71), .B1(my_dp_mpy0_inst_mult_23_n285), 
        .B2(my_dp_mpy0_inst_mult_23_n74), .C1(my_dp_mpy0_inst_mult_23_n74), 
        .C2(my_dp_mpy0_inst_mult_23_n71), .ZN(my_dp_mpy0_inst_mult_23_n311) );
  AOI222_X1 my_dp_mpy0_inst_mult_23_U250 ( .A1(my_dp_mpy0_inst_mult_23_n284), 
        .A2(my_dp_mpy0_inst_mult_23_n65), .B1(my_dp_mpy0_inst_mult_23_n284), 
        .B2(my_dp_mpy0_inst_mult_23_n70), .C1(my_dp_mpy0_inst_mult_23_n70), 
        .C2(my_dp_mpy0_inst_mult_23_n65), .ZN(my_dp_mpy0_inst_mult_23_n310) );
  OAI222_X1 my_dp_mpy0_inst_mult_23_U249 ( .A1(my_dp_mpy0_inst_mult_23_n310), 
        .A2(my_dp_mpy0_inst_mult_23_n278), .B1(my_dp_mpy0_inst_mult_23_n310), 
        .B2(my_dp_mpy0_inst_mult_23_n282), .C1(my_dp_mpy0_inst_mult_23_n282), 
        .C2(my_dp_mpy0_inst_mult_23_n278), .ZN(my_dp_mpy0_inst_mult_23_n309)
         );
  AOI222_X1 my_dp_mpy0_inst_mult_23_U248 ( .A1(my_dp_mpy0_inst_mult_23_n309), 
        .A2(my_dp_mpy0_inst_mult_23_n51), .B1(my_dp_mpy0_inst_mult_23_n309), 
        .B2(my_dp_mpy0_inst_mult_23_n58), .C1(my_dp_mpy0_inst_mult_23_n58), 
        .C2(my_dp_mpy0_inst_mult_23_n51), .ZN(my_dp_mpy0_inst_mult_23_n308) );
  OAI222_X1 my_dp_mpy0_inst_mult_23_U247 ( .A1(my_dp_mpy0_inst_mult_23_n308), 
        .A2(my_dp_mpy0_inst_mult_23_n275), .B1(my_dp_mpy0_inst_mult_23_n308), 
        .B2(my_dp_mpy0_inst_mult_23_n276), .C1(my_dp_mpy0_inst_mult_23_n276), 
        .C2(my_dp_mpy0_inst_mult_23_n275), .ZN(my_dp_mpy0_inst_mult_23_n8) );
  OR3_X1 my_dp_mpy0_inst_mult_23_U246 ( .A1(my_dp_mpy0_inst_mult_23_n307), 
        .A2(my_dp_add0[0]), .A3(my_dp_mpy0_inst_mult_23_n294), .ZN(
        my_dp_mpy0_inst_mult_23_n306) );
  OAI21_X1 my_dp_mpy0_inst_mult_23_U245 ( .B1(my_dp_mpy0_inst_mult_23_n294), 
        .B2(my_dp_mpy0_inst_mult_23_n305), .A(my_dp_mpy0_inst_mult_23_n306), 
        .ZN(my_dp_mpy0_inst_mult_23_n97) );
  OR3_X1 my_dp_mpy0_inst_mult_23_U244 ( .A1(my_dp_mpy0_inst_mult_23_n304), 
        .A2(my_dp_add0[0]), .A3(my_dp_mpy0_inst_mult_23_n295), .ZN(
        my_dp_mpy0_inst_mult_23_n303) );
  OAI21_X1 my_dp_mpy0_inst_mult_23_U243 ( .B1(my_dp_mpy0_inst_mult_23_n295), 
        .B2(my_dp_mpy0_inst_mult_23_n302), .A(my_dp_mpy0_inst_mult_23_n303), 
        .ZN(my_dp_mpy0_inst_mult_23_n98) );
  NOR2_X1 my_dp_mpy0_inst_mult_23_U242 ( .A1(my_dp_mpy0_inst_mult_23_n298), 
        .A2(my_dp_mpy0_inst_mult_23_n292), .ZN(my_dp_mpy0_inst_outc_0_) );
  XOR2_X1 my_dp_mpy0_inst_mult_23_U241 ( .A(my_dp_mpy0_inst_mult_23_n19), .B(
        my_dp_mpy0_inst_mult_23_n2), .Z(my_dp_mpy0_inst_mult_23_n299) );
  AND2_X1 my_dp_mpy0_inst_mult_23_U240 ( .A1(my_dp_mpy0_inst_mult_23_n293), 
        .A2(my_dp_mpy0_inst_mult_23_n301), .ZN(my_dp_mpy0_inst_mult_23_n300)
         );
  XOR2_X1 my_dp_mpy0_inst_mult_23_U239 ( .A(my_dp_mpy0_inst_mult_23_n299), .B(
        my_dp_mpy0_inst_mult_23_n300), .Z(my_dp_mpy0_inst_outc_17_) );
  XOR2_X1 my_dp_mpy0_inst_mult_23_U238 ( .A(my_dp_add0[2]), .B(my_dp_coeff[44]), .Z(my_dp_mpy0_inst_mult_23_n328) );
  INV_X1 my_dp_mpy0_inst_mult_23_U237 ( .A(my_dp_coeff[43]), .ZN(
        my_dp_mpy0_inst_mult_23_n294) );
  XOR2_X1 my_dp_mpy0_inst_mult_23_U236 ( .A(my_dp_coeff[42]), .B(
        my_dp_mpy0_inst_mult_23_n295), .Z(my_dp_mpy0_inst_mult_23_n307) );
  INV_X1 my_dp_mpy0_inst_mult_23_U235 ( .A(my_dp_coeff[41]), .ZN(
        my_dp_mpy0_inst_mult_23_n295) );
  INV_X1 my_dp_mpy0_inst_mult_23_U234 ( .A(my_dp_coeff[36]), .ZN(
        my_dp_mpy0_inst_mult_23_n298) );
  XOR2_X1 my_dp_mpy0_inst_mult_23_U233 ( .A(my_dp_coeff[40]), .B(
        my_dp_mpy0_inst_mult_23_n296), .Z(my_dp_mpy0_inst_mult_23_n304) );
  INV_X1 my_dp_mpy0_inst_mult_23_U232 ( .A(my_dp_coeff[39]), .ZN(
        my_dp_mpy0_inst_mult_23_n296) );
  INV_X1 my_dp_mpy0_inst_mult_23_U231 ( .A(my_dp_mpy0_inst_mult_23_n319), .ZN(
        my_dp_mpy0_inst_mult_23_n290) );
  INV_X1 my_dp_mpy0_inst_mult_23_U230 ( .A(my_dp_mpy0_inst_mult_23_n331), .ZN(
        my_dp_mpy0_inst_mult_23_n293) );
  INV_X1 my_dp_mpy0_inst_mult_23_U229 ( .A(my_dp_add0[1]), .ZN(
        my_dp_mpy0_inst_mult_23_n291) );
  INV_X1 my_dp_mpy0_inst_mult_23_U228 ( .A(my_dp_add0[0]), .ZN(
        my_dp_mpy0_inst_mult_23_n292) );
  INV_X1 my_dp_mpy0_inst_mult_23_U227 ( .A(my_dp_mpy0_inst_mult_23_n318), .ZN(
        my_dp_mpy0_inst_mult_23_n297) );
  INV_X1 my_dp_mpy0_inst_mult_23_U226 ( .A(my_dp_mpy0_inst_mult_23_n370), .ZN(
        my_dp_mpy0_inst_mult_23_n281) );
  INV_X1 my_dp_mpy0_inst_mult_23_U225 ( .A(my_dp_mpy0_inst_mult_23_n25), .ZN(
        my_dp_mpy0_inst_mult_23_n283) );
  INV_X1 my_dp_mpy0_inst_mult_23_U224 ( .A(my_dp_mpy0_inst_mult_23_n35), .ZN(
        my_dp_mpy0_inst_mult_23_n286) );
  INV_X1 my_dp_mpy0_inst_mult_23_U223 ( .A(my_dp_mpy0_inst_mult_23_n359), .ZN(
        my_dp_mpy0_inst_mult_23_n280) );
  INV_X1 my_dp_mpy0_inst_mult_23_U222 ( .A(my_dp_mpy0_inst_mult_23_n49), .ZN(
        my_dp_mpy0_inst_mult_23_n289) );
  INV_X1 my_dp_mpy0_inst_mult_23_U221 ( .A(my_dp_mpy0_inst_mult_23_n348), .ZN(
        my_dp_mpy0_inst_mult_23_n279) );
  INV_X1 my_dp_mpy0_inst_mult_23_U220 ( .A(my_dp_mpy0_inst_mult_23_n338), .ZN(
        my_dp_mpy0_inst_mult_23_n277) );
  INV_X1 my_dp_mpy0_inst_mult_23_U219 ( .A(my_dp_mpy0_inst_mult_23_n314), .ZN(
        my_dp_mpy0_inst_mult_23_n288) );
  INV_X1 my_dp_mpy0_inst_mult_23_U218 ( .A(my_dp_mpy0_inst_mult_23_n313), .ZN(
        my_dp_mpy0_inst_mult_23_n287) );
  INV_X1 my_dp_mpy0_inst_mult_23_U217 ( .A(my_dp_mpy0_inst_mult_23_n312), .ZN(
        my_dp_mpy0_inst_mult_23_n285) );
  INV_X1 my_dp_mpy0_inst_mult_23_U216 ( .A(my_dp_mpy0_inst_mult_23_n311), .ZN(
        my_dp_mpy0_inst_mult_23_n284) );
  INV_X1 my_dp_mpy0_inst_mult_23_U215 ( .A(my_dp_mpy0_inst_mult_23_n43), .ZN(
        my_dp_mpy0_inst_mult_23_n275) );
  INV_X1 my_dp_mpy0_inst_mult_23_U214 ( .A(my_dp_mpy0_inst_mult_23_n50), .ZN(
        my_dp_mpy0_inst_mult_23_n276) );
  INV_X1 my_dp_mpy0_inst_mult_23_U213 ( .A(my_dp_mpy0_inst_mult_23_n59), .ZN(
        my_dp_mpy0_inst_mult_23_n278) );
  INV_X1 my_dp_mpy0_inst_mult_23_U212 ( .A(my_dp_mpy0_inst_mult_23_n64), .ZN(
        my_dp_mpy0_inst_mult_23_n282) );
  HA_X1 my_dp_mpy0_inst_mult_23_U51 ( .A(my_dp_mpy0_inst_mult_23_n135), .B(
        my_dp_mpy0_inst_mult_23_n143), .CO(my_dp_mpy0_inst_mult_23_n80), .S(
        my_dp_mpy0_inst_mult_23_n81) );
  FA_X1 my_dp_mpy0_inst_mult_23_U50 ( .A(my_dp_mpy0_inst_mult_23_n142), .B(
        my_dp_mpy0_inst_mult_23_n126), .CI(my_dp_mpy0_inst_mult_23_n134), .CO(
        my_dp_mpy0_inst_mult_23_n78), .S(my_dp_mpy0_inst_mult_23_n79) );
  HA_X1 my_dp_mpy0_inst_mult_23_U49 ( .A(my_dp_mpy0_inst_mult_23_n98), .B(
        my_dp_mpy0_inst_mult_23_n125), .CO(my_dp_mpy0_inst_mult_23_n76), .S(
        my_dp_mpy0_inst_mult_23_n77) );
  FA_X1 my_dp_mpy0_inst_mult_23_U48 ( .A(my_dp_mpy0_inst_mult_23_n133), .B(
        my_dp_mpy0_inst_mult_23_n141), .CI(my_dp_mpy0_inst_mult_23_n77), .CO(
        my_dp_mpy0_inst_mult_23_n74), .S(my_dp_mpy0_inst_mult_23_n75) );
  FA_X1 my_dp_mpy0_inst_mult_23_U47 ( .A(my_dp_mpy0_inst_mult_23_n140), .B(
        my_dp_mpy0_inst_mult_23_n116), .CI(my_dp_mpy0_inst_mult_23_n132), .CO(
        my_dp_mpy0_inst_mult_23_n72), .S(my_dp_mpy0_inst_mult_23_n73) );
  FA_X1 my_dp_mpy0_inst_mult_23_U46 ( .A(my_dp_mpy0_inst_mult_23_n76), .B(
        my_dp_mpy0_inst_mult_23_n124), .CI(my_dp_mpy0_inst_mult_23_n73), .CO(
        my_dp_mpy0_inst_mult_23_n70), .S(my_dp_mpy0_inst_mult_23_n71) );
  HA_X1 my_dp_mpy0_inst_mult_23_U45 ( .A(my_dp_mpy0_inst_mult_23_n97), .B(
        my_dp_mpy0_inst_mult_23_n115), .CO(my_dp_mpy0_inst_mult_23_n68), .S(
        my_dp_mpy0_inst_mult_23_n69) );
  FA_X1 my_dp_mpy0_inst_mult_23_U44 ( .A(my_dp_mpy0_inst_mult_23_n123), .B(
        my_dp_mpy0_inst_mult_23_n139), .CI(my_dp_mpy0_inst_mult_23_n131), .CO(
        my_dp_mpy0_inst_mult_23_n66), .S(my_dp_mpy0_inst_mult_23_n67) );
  FA_X1 my_dp_mpy0_inst_mult_23_U43 ( .A(my_dp_mpy0_inst_mult_23_n72), .B(
        my_dp_mpy0_inst_mult_23_n69), .CI(my_dp_mpy0_inst_mult_23_n67), .CO(
        my_dp_mpy0_inst_mult_23_n64), .S(my_dp_mpy0_inst_mult_23_n65) );
  FA_X1 my_dp_mpy0_inst_mult_23_U42 ( .A(my_dp_mpy0_inst_mult_23_n122), .B(
        my_dp_mpy0_inst_mult_23_n106), .CI(my_dp_mpy0_inst_mult_23_n138), .CO(
        my_dp_mpy0_inst_mult_23_n62), .S(my_dp_mpy0_inst_mult_23_n63) );
  FA_X1 my_dp_mpy0_inst_mult_23_U41 ( .A(my_dp_mpy0_inst_mult_23_n114), .B(
        my_dp_mpy0_inst_mult_23_n130), .CI(my_dp_mpy0_inst_mult_23_n68), .CO(
        my_dp_mpy0_inst_mult_23_n60), .S(my_dp_mpy0_inst_mult_23_n61) );
  FA_X1 my_dp_mpy0_inst_mult_23_U40 ( .A(my_dp_mpy0_inst_mult_23_n63), .B(
        my_dp_mpy0_inst_mult_23_n66), .CI(my_dp_mpy0_inst_mult_23_n61), .CO(
        my_dp_mpy0_inst_mult_23_n58), .S(my_dp_mpy0_inst_mult_23_n59) );
  FA_X1 my_dp_mpy0_inst_mult_23_U37 ( .A(my_dp_mpy0_inst_mult_23_n113), .B(
        my_dp_mpy0_inst_mult_23_n121), .CI(my_dp_mpy0_inst_mult_23_n277), .CO(
        my_dp_mpy0_inst_mult_23_n54), .S(my_dp_mpy0_inst_mult_23_n55) );
  FA_X1 my_dp_mpy0_inst_mult_23_U36 ( .A(my_dp_mpy0_inst_mult_23_n57), .B(
        my_dp_mpy0_inst_mult_23_n129), .CI(my_dp_mpy0_inst_mult_23_n62), .CO(
        my_dp_mpy0_inst_mult_23_n52), .S(my_dp_mpy0_inst_mult_23_n53) );
  FA_X1 my_dp_mpy0_inst_mult_23_U35 ( .A(my_dp_mpy0_inst_mult_23_n55), .B(
        my_dp_mpy0_inst_mult_23_n60), .CI(my_dp_mpy0_inst_mult_23_n53), .CO(
        my_dp_mpy0_inst_mult_23_n50), .S(my_dp_mpy0_inst_mult_23_n51) );
  FA_X1 my_dp_mpy0_inst_mult_23_U33 ( .A(my_dp_mpy0_inst_mult_23_n128), .B(
        my_dp_mpy0_inst_mult_23_n49), .CI(my_dp_mpy0_inst_mult_23_n112), .CO(
        my_dp_mpy0_inst_mult_23_n46), .S(my_dp_mpy0_inst_mult_23_n47) );
  FA_X1 my_dp_mpy0_inst_mult_23_U32 ( .A(my_dp_mpy0_inst_mult_23_n56), .B(
        my_dp_mpy0_inst_mult_23_n120), .CI(my_dp_mpy0_inst_mult_23_n54), .CO(
        my_dp_mpy0_inst_mult_23_n44), .S(my_dp_mpy0_inst_mult_23_n45) );
  FA_X1 my_dp_mpy0_inst_mult_23_U31 ( .A(my_dp_mpy0_inst_mult_23_n52), .B(
        my_dp_mpy0_inst_mult_23_n47), .CI(my_dp_mpy0_inst_mult_23_n45), .CO(
        my_dp_mpy0_inst_mult_23_n42), .S(my_dp_mpy0_inst_mult_23_n43) );
  FA_X1 my_dp_mpy0_inst_mult_23_U30 ( .A(my_dp_mpy0_inst_mult_23_n104), .B(
        my_dp_mpy0_inst_mult_23_n289), .CI(my_dp_mpy0_inst_mult_23_n119), .CO(
        my_dp_mpy0_inst_mult_23_n40), .S(my_dp_mpy0_inst_mult_23_n41) );
  FA_X1 my_dp_mpy0_inst_mult_23_U29 ( .A(my_dp_mpy0_inst_mult_23_n279), .B(
        my_dp_mpy0_inst_mult_23_n111), .CI(my_dp_mpy0_inst_mult_23_n46), .CO(
        my_dp_mpy0_inst_mult_23_n38), .S(my_dp_mpy0_inst_mult_23_n39) );
  FA_X1 my_dp_mpy0_inst_mult_23_U28 ( .A(my_dp_mpy0_inst_mult_23_n44), .B(
        my_dp_mpy0_inst_mult_23_n41), .CI(my_dp_mpy0_inst_mult_23_n39), .CO(
        my_dp_mpy0_inst_mult_23_n36), .S(my_dp_mpy0_inst_mult_23_n37) );
  FA_X1 my_dp_mpy0_inst_mult_23_U26 ( .A(my_dp_mpy0_inst_mult_23_n118), .B(
        my_dp_mpy0_inst_mult_23_n35), .CI(my_dp_mpy0_inst_mult_23_n110), .CO(
        my_dp_mpy0_inst_mult_23_n32), .S(my_dp_mpy0_inst_mult_23_n33) );
  FA_X1 my_dp_mpy0_inst_mult_23_U25 ( .A(my_dp_mpy0_inst_mult_23_n33), .B(
        my_dp_mpy0_inst_mult_23_n40), .CI(my_dp_mpy0_inst_mult_23_n38), .CO(
        my_dp_mpy0_inst_mult_23_n30), .S(my_dp_mpy0_inst_mult_23_n31) );
  FA_X1 my_dp_mpy0_inst_mult_23_U24 ( .A(my_dp_mpy0_inst_mult_23_n103), .B(
        my_dp_mpy0_inst_mult_23_n286), .CI(my_dp_mpy0_inst_mult_23_n109), .CO(
        my_dp_mpy0_inst_mult_23_n28), .S(my_dp_mpy0_inst_mult_23_n29) );
  FA_X1 my_dp_mpy0_inst_mult_23_U23 ( .A(my_dp_mpy0_inst_mult_23_n32), .B(
        my_dp_mpy0_inst_mult_23_n280), .CI(my_dp_mpy0_inst_mult_23_n29), .CO(
        my_dp_mpy0_inst_mult_23_n26), .S(my_dp_mpy0_inst_mult_23_n27) );
  FA_X1 my_dp_mpy0_inst_mult_23_U21 ( .A(my_dp_mpy0_inst_mult_23_n108), .B(
        my_dp_mpy0_inst_mult_23_n25), .CI(my_dp_mpy0_inst_mult_23_n28), .CO(
        my_dp_mpy0_inst_mult_23_n22), .S(my_dp_mpy0_inst_mult_23_n23) );
  FA_X1 my_dp_mpy0_inst_mult_23_U20 ( .A(my_dp_mpy0_inst_mult_23_n102), .B(
        my_dp_mpy0_inst_mult_23_n283), .CI(my_dp_mpy0_inst_mult_23_n281), .CO(
        my_dp_mpy0_inst_mult_23_n20), .S(my_dp_mpy0_inst_mult_23_n21) );
  FA_X1 my_dp_mpy0_inst_mult_23_U8 ( .A(my_dp_mpy0_inst_mult_23_n37), .B(
        my_dp_mpy0_inst_mult_23_n42), .CI(my_dp_mpy0_inst_mult_23_n8), .CO(
        my_dp_mpy0_inst_mult_23_n7), .S(my_dp_mpy_0__3_) );
  FA_X1 my_dp_mpy0_inst_mult_23_U7 ( .A(my_dp_mpy0_inst_mult_23_n31), .B(
        my_dp_mpy0_inst_mult_23_n36), .CI(my_dp_mpy0_inst_mult_23_n7), .CO(
        my_dp_mpy0_inst_mult_23_n6), .S(my_dp_mpy_0__4_) );
  FA_X1 my_dp_mpy0_inst_mult_23_U6 ( .A(my_dp_mpy0_inst_mult_23_n27), .B(
        my_dp_mpy0_inst_mult_23_n30), .CI(my_dp_mpy0_inst_mult_23_n6), .CO(
        my_dp_mpy0_inst_mult_23_n5), .S(my_dp_mpy_0__5_) );
  FA_X1 my_dp_mpy0_inst_mult_23_U5 ( .A(my_dp_mpy0_inst_mult_23_n23), .B(
        my_dp_mpy0_inst_mult_23_n26), .CI(my_dp_mpy0_inst_mult_23_n5), .CO(
        my_dp_mpy0_inst_mult_23_n4), .S(my_dp_mpy_0__6_) );
  FA_X1 my_dp_mpy0_inst_mult_23_U4 ( .A(my_dp_mpy0_inst_mult_23_n22), .B(
        my_dp_mpy0_inst_mult_23_n21), .CI(my_dp_mpy0_inst_mult_23_n4), .CO(
        my_dp_mpy0_inst_mult_23_n3), .S(my_dp_mpy_0__7_) );
  FA_X1 my_dp_mpy0_inst_mult_23_U3 ( .A(my_dp_mpy0_inst_mult_23_n20), .B(
        my_dp_mpy0_inst_mult_23_n19), .CI(my_dp_mpy0_inst_mult_23_n3), .CO(
        my_dp_mpy0_inst_mult_23_n2), .S(my_dp_mpy_0__8_) );
  XOR2_X1 my_dp_mpy1_inst_mult_23_U358 ( .A(my_dp_coeff[35]), .B(
        my_dp_mpy1_inst_mult_23_n294), .Z(my_dp_mpy1_inst_mult_23_n331) );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U357 ( .A(my_dp_r0[7]), .B(my_dp_coeff[35]), 
        .ZN(my_dp_mpy1_inst_mult_23_n374) );
  NOR2_X1 my_dp_mpy1_inst_mult_23_U356 ( .A1(my_dp_mpy1_inst_mult_23_n331), 
        .A2(my_dp_mpy1_inst_mult_23_n374), .ZN(my_dp_mpy1_inst_mult_23_n102)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U355 ( .A(my_dp_r0[5]), .B(my_dp_coeff[35]), 
        .ZN(my_dp_mpy1_inst_mult_23_n373) );
  NOR2_X1 my_dp_mpy1_inst_mult_23_U354 ( .A1(my_dp_mpy1_inst_mult_23_n331), 
        .A2(my_dp_mpy1_inst_mult_23_n373), .ZN(my_dp_mpy1_inst_mult_23_n103)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U353 ( .A(my_dp_r0[3]), .B(my_dp_coeff[35]), 
        .ZN(my_dp_mpy1_inst_mult_23_n372) );
  NOR2_X1 my_dp_mpy1_inst_mult_23_U352 ( .A1(my_dp_mpy1_inst_mult_23_n331), 
        .A2(my_dp_mpy1_inst_mult_23_n372), .ZN(my_dp_mpy1_inst_mult_23_n104)
         );
  NOR2_X1 my_dp_mpy1_inst_mult_23_U351 ( .A1(my_dp_mpy1_inst_mult_23_n331), 
        .A2(my_dp_mpy1_inst_mult_23_n292), .ZN(my_dp_mpy1_inst_mult_23_n106)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U350 ( .A(my_dp_r0[8]), .B(my_dp_coeff[34]), 
        .ZN(my_dp_mpy1_inst_mult_23_n369) );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U349 ( .A(my_dp_mpy1_inst_mult_23_n294), 
        .B(my_dp_coeff[33]), .ZN(my_dp_mpy1_inst_mult_23_n371) );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U348 ( .A1(my_dp_mpy1_inst_mult_23_n307), 
        .A2(my_dp_mpy1_inst_mult_23_n371), .ZN(my_dp_mpy1_inst_mult_23_n305)
         );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U347 ( .A1(my_dp_mpy1_inst_mult_23_n369), 
        .A2(my_dp_mpy1_inst_mult_23_n307), .B1(my_dp_mpy1_inst_mult_23_n305), 
        .B2(my_dp_mpy1_inst_mult_23_n369), .ZN(my_dp_mpy1_inst_mult_23_n370)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U346 ( .A(my_dp_r0[7]), .B(my_dp_coeff[34]), 
        .ZN(my_dp_mpy1_inst_mult_23_n368) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U345 ( .A1(my_dp_mpy1_inst_mult_23_n368), 
        .A2(my_dp_mpy1_inst_mult_23_n305), .B1(my_dp_mpy1_inst_mult_23_n307), 
        .B2(my_dp_mpy1_inst_mult_23_n369), .ZN(my_dp_mpy1_inst_mult_23_n108)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U344 ( .A(my_dp_r0[6]), .B(my_dp_coeff[34]), 
        .ZN(my_dp_mpy1_inst_mult_23_n367) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U343 ( .A1(my_dp_mpy1_inst_mult_23_n367), 
        .A2(my_dp_mpy1_inst_mult_23_n305), .B1(my_dp_mpy1_inst_mult_23_n307), 
        .B2(my_dp_mpy1_inst_mult_23_n368), .ZN(my_dp_mpy1_inst_mult_23_n109)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U342 ( .A(my_dp_r0[5]), .B(my_dp_coeff[34]), 
        .ZN(my_dp_mpy1_inst_mult_23_n366) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U341 ( .A1(my_dp_mpy1_inst_mult_23_n366), 
        .A2(my_dp_mpy1_inst_mult_23_n305), .B1(my_dp_mpy1_inst_mult_23_n307), 
        .B2(my_dp_mpy1_inst_mult_23_n367), .ZN(my_dp_mpy1_inst_mult_23_n110)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U340 ( .A(my_dp_r0[4]), .B(my_dp_coeff[34]), 
        .ZN(my_dp_mpy1_inst_mult_23_n365) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U339 ( .A1(my_dp_mpy1_inst_mult_23_n365), 
        .A2(my_dp_mpy1_inst_mult_23_n305), .B1(my_dp_mpy1_inst_mult_23_n307), 
        .B2(my_dp_mpy1_inst_mult_23_n366), .ZN(my_dp_mpy1_inst_mult_23_n111)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U338 ( .A(my_dp_r0[3]), .B(my_dp_coeff[34]), 
        .ZN(my_dp_mpy1_inst_mult_23_n364) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U337 ( .A1(my_dp_mpy1_inst_mult_23_n364), 
        .A2(my_dp_mpy1_inst_mult_23_n305), .B1(my_dp_mpy1_inst_mult_23_n307), 
        .B2(my_dp_mpy1_inst_mult_23_n365), .ZN(my_dp_mpy1_inst_mult_23_n112)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U336 ( .A(my_dp_r0[2]), .B(my_dp_coeff[34]), 
        .ZN(my_dp_mpy1_inst_mult_23_n363) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U335 ( .A1(my_dp_mpy1_inst_mult_23_n363), 
        .A2(my_dp_mpy1_inst_mult_23_n305), .B1(my_dp_mpy1_inst_mult_23_n307), 
        .B2(my_dp_mpy1_inst_mult_23_n364), .ZN(my_dp_mpy1_inst_mult_23_n113)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U334 ( .A(my_dp_r0[1]), .B(my_dp_coeff[34]), 
        .ZN(my_dp_mpy1_inst_mult_23_n362) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U333 ( .A1(my_dp_mpy1_inst_mult_23_n362), 
        .A2(my_dp_mpy1_inst_mult_23_n305), .B1(my_dp_mpy1_inst_mult_23_n307), 
        .B2(my_dp_mpy1_inst_mult_23_n363), .ZN(my_dp_mpy1_inst_mult_23_n114)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U332 ( .A(my_dp_coeff[34]), .B(my_dp_r0[0]), 
        .ZN(my_dp_mpy1_inst_mult_23_n361) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U331 ( .A1(my_dp_mpy1_inst_mult_23_n361), 
        .A2(my_dp_mpy1_inst_mult_23_n305), .B1(my_dp_mpy1_inst_mult_23_n307), 
        .B2(my_dp_mpy1_inst_mult_23_n362), .ZN(my_dp_mpy1_inst_mult_23_n115)
         );
  NOR2_X1 my_dp_mpy1_inst_mult_23_U330 ( .A1(my_dp_mpy1_inst_mult_23_n307), 
        .A2(my_dp_mpy1_inst_mult_23_n292), .ZN(my_dp_mpy1_inst_mult_23_n116)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U329 ( .A(my_dp_r0[8]), .B(my_dp_coeff[32]), 
        .ZN(my_dp_mpy1_inst_mult_23_n358) );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U328 ( .A(my_dp_mpy1_inst_mult_23_n295), 
        .B(my_dp_coeff[31]), .ZN(my_dp_mpy1_inst_mult_23_n360) );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U327 ( .A1(my_dp_mpy1_inst_mult_23_n304), 
        .A2(my_dp_mpy1_inst_mult_23_n360), .ZN(my_dp_mpy1_inst_mult_23_n302)
         );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U326 ( .A1(my_dp_mpy1_inst_mult_23_n358), 
        .A2(my_dp_mpy1_inst_mult_23_n304), .B1(my_dp_mpy1_inst_mult_23_n302), 
        .B2(my_dp_mpy1_inst_mult_23_n358), .ZN(my_dp_mpy1_inst_mult_23_n359)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U325 ( .A(my_dp_r0[7]), .B(my_dp_coeff[32]), 
        .ZN(my_dp_mpy1_inst_mult_23_n357) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U324 ( .A1(my_dp_mpy1_inst_mult_23_n357), 
        .A2(my_dp_mpy1_inst_mult_23_n302), .B1(my_dp_mpy1_inst_mult_23_n304), 
        .B2(my_dp_mpy1_inst_mult_23_n358), .ZN(my_dp_mpy1_inst_mult_23_n118)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U323 ( .A(my_dp_r0[6]), .B(my_dp_coeff[32]), 
        .ZN(my_dp_mpy1_inst_mult_23_n356) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U322 ( .A1(my_dp_mpy1_inst_mult_23_n356), 
        .A2(my_dp_mpy1_inst_mult_23_n302), .B1(my_dp_mpy1_inst_mult_23_n304), 
        .B2(my_dp_mpy1_inst_mult_23_n357), .ZN(my_dp_mpy1_inst_mult_23_n119)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U321 ( .A(my_dp_r0[5]), .B(my_dp_coeff[32]), 
        .ZN(my_dp_mpy1_inst_mult_23_n355) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U320 ( .A1(my_dp_mpy1_inst_mult_23_n355), 
        .A2(my_dp_mpy1_inst_mult_23_n302), .B1(my_dp_mpy1_inst_mult_23_n304), 
        .B2(my_dp_mpy1_inst_mult_23_n356), .ZN(my_dp_mpy1_inst_mult_23_n120)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U319 ( .A(my_dp_r0[4]), .B(my_dp_coeff[32]), 
        .ZN(my_dp_mpy1_inst_mult_23_n354) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U318 ( .A1(my_dp_mpy1_inst_mult_23_n354), 
        .A2(my_dp_mpy1_inst_mult_23_n302), .B1(my_dp_mpy1_inst_mult_23_n304), 
        .B2(my_dp_mpy1_inst_mult_23_n355), .ZN(my_dp_mpy1_inst_mult_23_n121)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U317 ( .A(my_dp_r0[3]), .B(my_dp_coeff[32]), 
        .ZN(my_dp_mpy1_inst_mult_23_n353) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U316 ( .A1(my_dp_mpy1_inst_mult_23_n353), 
        .A2(my_dp_mpy1_inst_mult_23_n302), .B1(my_dp_mpy1_inst_mult_23_n304), 
        .B2(my_dp_mpy1_inst_mult_23_n354), .ZN(my_dp_mpy1_inst_mult_23_n122)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U315 ( .A(my_dp_r0[2]), .B(my_dp_coeff[32]), 
        .ZN(my_dp_mpy1_inst_mult_23_n352) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U314 ( .A1(my_dp_mpy1_inst_mult_23_n352), 
        .A2(my_dp_mpy1_inst_mult_23_n302), .B1(my_dp_mpy1_inst_mult_23_n304), 
        .B2(my_dp_mpy1_inst_mult_23_n353), .ZN(my_dp_mpy1_inst_mult_23_n123)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U313 ( .A(my_dp_r0[1]), .B(my_dp_coeff[32]), 
        .ZN(my_dp_mpy1_inst_mult_23_n351) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U312 ( .A1(my_dp_mpy1_inst_mult_23_n351), 
        .A2(my_dp_mpy1_inst_mult_23_n302), .B1(my_dp_mpy1_inst_mult_23_n304), 
        .B2(my_dp_mpy1_inst_mult_23_n352), .ZN(my_dp_mpy1_inst_mult_23_n124)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U311 ( .A(my_dp_coeff[32]), .B(my_dp_r0[0]), 
        .ZN(my_dp_mpy1_inst_mult_23_n350) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U310 ( .A1(my_dp_mpy1_inst_mult_23_n350), 
        .A2(my_dp_mpy1_inst_mult_23_n302), .B1(my_dp_mpy1_inst_mult_23_n304), 
        .B2(my_dp_mpy1_inst_mult_23_n351), .ZN(my_dp_mpy1_inst_mult_23_n125)
         );
  NOR2_X1 my_dp_mpy1_inst_mult_23_U309 ( .A1(my_dp_mpy1_inst_mult_23_n304), 
        .A2(my_dp_mpy1_inst_mult_23_n292), .ZN(my_dp_mpy1_inst_mult_23_n126)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U308 ( .A(my_dp_r0[8]), .B(my_dp_coeff[30]), 
        .ZN(my_dp_mpy1_inst_mult_23_n347) );
  XOR2_X1 my_dp_mpy1_inst_mult_23_U307 ( .A(my_dp_coeff[29]), .B(
        my_dp_coeff[28]), .Z(my_dp_mpy1_inst_mult_23_n318) );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U306 ( .A(my_dp_mpy1_inst_mult_23_n296), 
        .B(my_dp_coeff[29]), .ZN(my_dp_mpy1_inst_mult_23_n349) );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U305 ( .A1(my_dp_mpy1_inst_mult_23_n297), 
        .A2(my_dp_mpy1_inst_mult_23_n349), .ZN(my_dp_mpy1_inst_mult_23_n316)
         );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U304 ( .A1(my_dp_mpy1_inst_mult_23_n347), 
        .A2(my_dp_mpy1_inst_mult_23_n297), .B1(my_dp_mpy1_inst_mult_23_n316), 
        .B2(my_dp_mpy1_inst_mult_23_n347), .ZN(my_dp_mpy1_inst_mult_23_n348)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U303 ( .A(my_dp_r0[7]), .B(my_dp_coeff[30]), 
        .ZN(my_dp_mpy1_inst_mult_23_n346) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U302 ( .A1(my_dp_mpy1_inst_mult_23_n346), 
        .A2(my_dp_mpy1_inst_mult_23_n316), .B1(my_dp_mpy1_inst_mult_23_n297), 
        .B2(my_dp_mpy1_inst_mult_23_n347), .ZN(my_dp_mpy1_inst_mult_23_n128)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U301 ( .A(my_dp_r0[6]), .B(my_dp_coeff[30]), 
        .ZN(my_dp_mpy1_inst_mult_23_n345) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U300 ( .A1(my_dp_mpy1_inst_mult_23_n345), 
        .A2(my_dp_mpy1_inst_mult_23_n316), .B1(my_dp_mpy1_inst_mult_23_n297), 
        .B2(my_dp_mpy1_inst_mult_23_n346), .ZN(my_dp_mpy1_inst_mult_23_n129)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U299 ( .A(my_dp_r0[5]), .B(my_dp_coeff[30]), 
        .ZN(my_dp_mpy1_inst_mult_23_n344) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U298 ( .A1(my_dp_mpy1_inst_mult_23_n344), 
        .A2(my_dp_mpy1_inst_mult_23_n316), .B1(my_dp_mpy1_inst_mult_23_n297), 
        .B2(my_dp_mpy1_inst_mult_23_n345), .ZN(my_dp_mpy1_inst_mult_23_n130)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U297 ( .A(my_dp_r0[4]), .B(my_dp_coeff[30]), 
        .ZN(my_dp_mpy1_inst_mult_23_n343) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U296 ( .A1(my_dp_mpy1_inst_mult_23_n343), 
        .A2(my_dp_mpy1_inst_mult_23_n316), .B1(my_dp_mpy1_inst_mult_23_n297), 
        .B2(my_dp_mpy1_inst_mult_23_n344), .ZN(my_dp_mpy1_inst_mult_23_n131)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U295 ( .A(my_dp_r0[3]), .B(my_dp_coeff[30]), 
        .ZN(my_dp_mpy1_inst_mult_23_n342) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U294 ( .A1(my_dp_mpy1_inst_mult_23_n342), 
        .A2(my_dp_mpy1_inst_mult_23_n316), .B1(my_dp_mpy1_inst_mult_23_n297), 
        .B2(my_dp_mpy1_inst_mult_23_n343), .ZN(my_dp_mpy1_inst_mult_23_n132)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U293 ( .A(my_dp_r0[2]), .B(my_dp_coeff[30]), 
        .ZN(my_dp_mpy1_inst_mult_23_n341) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U292 ( .A1(my_dp_mpy1_inst_mult_23_n341), 
        .A2(my_dp_mpy1_inst_mult_23_n316), .B1(my_dp_mpy1_inst_mult_23_n297), 
        .B2(my_dp_mpy1_inst_mult_23_n342), .ZN(my_dp_mpy1_inst_mult_23_n133)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U291 ( .A(my_dp_r0[1]), .B(my_dp_coeff[30]), 
        .ZN(my_dp_mpy1_inst_mult_23_n340) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U290 ( .A1(my_dp_mpy1_inst_mult_23_n340), 
        .A2(my_dp_mpy1_inst_mult_23_n316), .B1(my_dp_mpy1_inst_mult_23_n297), 
        .B2(my_dp_mpy1_inst_mult_23_n341), .ZN(my_dp_mpy1_inst_mult_23_n134)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U289 ( .A(my_dp_coeff[30]), .B(my_dp_r0[0]), 
        .ZN(my_dp_mpy1_inst_mult_23_n339) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U288 ( .A1(my_dp_mpy1_inst_mult_23_n339), 
        .A2(my_dp_mpy1_inst_mult_23_n316), .B1(my_dp_mpy1_inst_mult_23_n297), 
        .B2(my_dp_mpy1_inst_mult_23_n340), .ZN(my_dp_mpy1_inst_mult_23_n135)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U287 ( .A(my_dp_r0[8]), .B(my_dp_coeff[28]), 
        .ZN(my_dp_mpy1_inst_mult_23_n337) );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U286 ( .A1(my_dp_coeff[28]), .A2(
        my_dp_mpy1_inst_mult_23_n298), .ZN(my_dp_mpy1_inst_mult_23_n323) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U285 ( .A1(my_dp_mpy1_inst_mult_23_n298), 
        .A2(my_dp_mpy1_inst_mult_23_n337), .B1(my_dp_mpy1_inst_mult_23_n323), 
        .B2(my_dp_mpy1_inst_mult_23_n337), .ZN(my_dp_mpy1_inst_mult_23_n338)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U284 ( .A(my_dp_r0[7]), .B(my_dp_coeff[28]), 
        .ZN(my_dp_mpy1_inst_mult_23_n336) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U283 ( .A1(my_dp_mpy1_inst_mult_23_n336), 
        .A2(my_dp_mpy1_inst_mult_23_n323), .B1(my_dp_mpy1_inst_mult_23_n337), 
        .B2(my_dp_mpy1_inst_mult_23_n298), .ZN(my_dp_mpy1_inst_mult_23_n138)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U282 ( .A(my_dp_r0[6]), .B(my_dp_coeff[28]), 
        .ZN(my_dp_mpy1_inst_mult_23_n335) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U281 ( .A1(my_dp_mpy1_inst_mult_23_n335), 
        .A2(my_dp_mpy1_inst_mult_23_n323), .B1(my_dp_mpy1_inst_mult_23_n336), 
        .B2(my_dp_mpy1_inst_mult_23_n298), .ZN(my_dp_mpy1_inst_mult_23_n139)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U280 ( .A(my_dp_r0[5]), .B(my_dp_coeff[28]), 
        .ZN(my_dp_mpy1_inst_mult_23_n334) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U279 ( .A1(my_dp_mpy1_inst_mult_23_n334), 
        .A2(my_dp_mpy1_inst_mult_23_n323), .B1(my_dp_mpy1_inst_mult_23_n335), 
        .B2(my_dp_mpy1_inst_mult_23_n298), .ZN(my_dp_mpy1_inst_mult_23_n140)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U278 ( .A(my_dp_r0[4]), .B(my_dp_coeff[28]), 
        .ZN(my_dp_mpy1_inst_mult_23_n333) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U277 ( .A1(my_dp_mpy1_inst_mult_23_n333), 
        .A2(my_dp_mpy1_inst_mult_23_n323), .B1(my_dp_mpy1_inst_mult_23_n334), 
        .B2(my_dp_mpy1_inst_mult_23_n298), .ZN(my_dp_mpy1_inst_mult_23_n141)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U276 ( .A(my_dp_r0[3]), .B(my_dp_coeff[28]), 
        .ZN(my_dp_mpy1_inst_mult_23_n332) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U275 ( .A1(my_dp_mpy1_inst_mult_23_n332), 
        .A2(my_dp_mpy1_inst_mult_23_n323), .B1(my_dp_mpy1_inst_mult_23_n333), 
        .B2(my_dp_mpy1_inst_mult_23_n298), .ZN(my_dp_mpy1_inst_mult_23_n142)
         );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U274 ( .A(my_dp_r0[2]), .B(my_dp_coeff[28]), 
        .ZN(my_dp_mpy1_inst_mult_23_n324) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U273 ( .A1(my_dp_mpy1_inst_mult_23_n324), 
        .A2(my_dp_mpy1_inst_mult_23_n323), .B1(my_dp_mpy1_inst_mult_23_n332), 
        .B2(my_dp_mpy1_inst_mult_23_n298), .ZN(my_dp_mpy1_inst_mult_23_n143)
         );
  XOR2_X1 my_dp_mpy1_inst_mult_23_U272 ( .A(my_dp_r0[8]), .B(my_dp_coeff[35]), 
        .Z(my_dp_mpy1_inst_mult_23_n301) );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U271 ( .A1(my_dp_mpy1_inst_mult_23_n301), 
        .A2(my_dp_mpy1_inst_mult_23_n293), .ZN(my_dp_mpy1_inst_mult_23_n19) );
  XOR2_X1 my_dp_mpy1_inst_mult_23_U270 ( .A(my_dp_r0[6]), .B(my_dp_coeff[35]), 
        .Z(my_dp_mpy1_inst_mult_23_n330) );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U269 ( .A1(my_dp_mpy1_inst_mult_23_n330), 
        .A2(my_dp_mpy1_inst_mult_23_n293), .ZN(my_dp_mpy1_inst_mult_23_n25) );
  XOR2_X1 my_dp_mpy1_inst_mult_23_U268 ( .A(my_dp_r0[4]), .B(my_dp_coeff[35]), 
        .Z(my_dp_mpy1_inst_mult_23_n329) );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U267 ( .A1(my_dp_mpy1_inst_mult_23_n329), 
        .A2(my_dp_mpy1_inst_mult_23_n293), .ZN(my_dp_mpy1_inst_mult_23_n35) );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U266 ( .A1(my_dp_mpy1_inst_mult_23_n328), 
        .A2(my_dp_mpy1_inst_mult_23_n293), .ZN(my_dp_mpy1_inst_mult_23_n49) );
  NAND3_X1 my_dp_mpy1_inst_mult_23_U265 ( .A1(my_dp_mpy1_inst_mult_23_n293), 
        .A2(my_dp_mpy1_inst_mult_23_n292), .A3(my_dp_coeff[35]), .ZN(
        my_dp_mpy1_inst_mult_23_n325) );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U264 ( .A(my_dp_mpy1_inst_mult_23_n291), 
        .B(my_dp_coeff[35]), .ZN(my_dp_mpy1_inst_mult_23_n327) );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U263 ( .A1(my_dp_mpy1_inst_mult_23_n327), 
        .A2(my_dp_mpy1_inst_mult_23_n293), .ZN(my_dp_mpy1_inst_mult_23_n326)
         );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U262 ( .A1(my_dp_mpy1_inst_mult_23_n325), 
        .A2(my_dp_mpy1_inst_mult_23_n326), .ZN(my_dp_mpy1_inst_mult_23_n56) );
  XNOR2_X1 my_dp_mpy1_inst_mult_23_U261 ( .A(my_dp_mpy1_inst_mult_23_n325), 
        .B(my_dp_mpy1_inst_mult_23_n326), .ZN(my_dp_mpy1_inst_mult_23_n57) );
  OAI22_X1 my_dp_mpy1_inst_mult_23_U260 ( .A1(my_dp_r0[1]), .A2(
        my_dp_mpy1_inst_mult_23_n323), .B1(my_dp_mpy1_inst_mult_23_n324), .B2(
        my_dp_mpy1_inst_mult_23_n298), .ZN(my_dp_mpy1_inst_mult_23_n322) );
  NAND2_X1 my_dp_mpy1_inst_mult_23_U259 ( .A1(my_dp_mpy1_inst_mult_23_n318), 
        .A2(my_dp_mpy1_inst_mult_23_n322), .ZN(my_dp_mpy1_inst_mult_23_n320)
         );
  NAND3_X1 my_dp_mpy1_inst_mult_23_U258 ( .A1(my_dp_mpy1_inst_mult_23_n322), 
        .A2(my_dp_mpy1_inst_mult_23_n291), .A3(my_dp_coeff[28]), .ZN(
        my_dp_mpy1_inst_mult_23_n321) );
  MUX2_X1 my_dp_mpy1_inst_mult_23_U257 ( .A(my_dp_mpy1_inst_mult_23_n320), .B(
        my_dp_mpy1_inst_mult_23_n321), .S(my_dp_mpy1_inst_mult_23_n292), .Z(
        my_dp_mpy1_inst_mult_23_n319) );
  NAND3_X1 my_dp_mpy1_inst_mult_23_U256 ( .A1(my_dp_mpy1_inst_mult_23_n318), 
        .A2(my_dp_mpy1_inst_mult_23_n292), .A3(my_dp_coeff[30]), .ZN(
        my_dp_mpy1_inst_mult_23_n317) );
  OAI21_X1 my_dp_mpy1_inst_mult_23_U255 ( .B1(my_dp_mpy1_inst_mult_23_n296), 
        .B2(my_dp_mpy1_inst_mult_23_n316), .A(my_dp_mpy1_inst_mult_23_n317), 
        .ZN(my_dp_mpy1_inst_mult_23_n315) );
  AOI222_X1 my_dp_mpy1_inst_mult_23_U254 ( .A1(my_dp_mpy1_inst_mult_23_n290), 
        .A2(my_dp_mpy1_inst_mult_23_n81), .B1(my_dp_mpy1_inst_mult_23_n315), 
        .B2(my_dp_mpy1_inst_mult_23_n290), .C1(my_dp_mpy1_inst_mult_23_n315), 
        .C2(my_dp_mpy1_inst_mult_23_n81), .ZN(my_dp_mpy1_inst_mult_23_n314) );
  AOI222_X1 my_dp_mpy1_inst_mult_23_U253 ( .A1(my_dp_mpy1_inst_mult_23_n288), 
        .A2(my_dp_mpy1_inst_mult_23_n79), .B1(my_dp_mpy1_inst_mult_23_n288), 
        .B2(my_dp_mpy1_inst_mult_23_n80), .C1(my_dp_mpy1_inst_mult_23_n80), 
        .C2(my_dp_mpy1_inst_mult_23_n79), .ZN(my_dp_mpy1_inst_mult_23_n313) );
  AOI222_X1 my_dp_mpy1_inst_mult_23_U252 ( .A1(my_dp_mpy1_inst_mult_23_n287), 
        .A2(my_dp_mpy1_inst_mult_23_n75), .B1(my_dp_mpy1_inst_mult_23_n287), 
        .B2(my_dp_mpy1_inst_mult_23_n78), .C1(my_dp_mpy1_inst_mult_23_n78), 
        .C2(my_dp_mpy1_inst_mult_23_n75), .ZN(my_dp_mpy1_inst_mult_23_n312) );
  AOI222_X1 my_dp_mpy1_inst_mult_23_U251 ( .A1(my_dp_mpy1_inst_mult_23_n285), 
        .A2(my_dp_mpy1_inst_mult_23_n71), .B1(my_dp_mpy1_inst_mult_23_n285), 
        .B2(my_dp_mpy1_inst_mult_23_n74), .C1(my_dp_mpy1_inst_mult_23_n74), 
        .C2(my_dp_mpy1_inst_mult_23_n71), .ZN(my_dp_mpy1_inst_mult_23_n311) );
  AOI222_X1 my_dp_mpy1_inst_mult_23_U250 ( .A1(my_dp_mpy1_inst_mult_23_n284), 
        .A2(my_dp_mpy1_inst_mult_23_n65), .B1(my_dp_mpy1_inst_mult_23_n284), 
        .B2(my_dp_mpy1_inst_mult_23_n70), .C1(my_dp_mpy1_inst_mult_23_n70), 
        .C2(my_dp_mpy1_inst_mult_23_n65), .ZN(my_dp_mpy1_inst_mult_23_n310) );
  OAI222_X1 my_dp_mpy1_inst_mult_23_U249 ( .A1(my_dp_mpy1_inst_mult_23_n310), 
        .A2(my_dp_mpy1_inst_mult_23_n278), .B1(my_dp_mpy1_inst_mult_23_n310), 
        .B2(my_dp_mpy1_inst_mult_23_n282), .C1(my_dp_mpy1_inst_mult_23_n282), 
        .C2(my_dp_mpy1_inst_mult_23_n278), .ZN(my_dp_mpy1_inst_mult_23_n309)
         );
  AOI222_X1 my_dp_mpy1_inst_mult_23_U248 ( .A1(my_dp_mpy1_inst_mult_23_n309), 
        .A2(my_dp_mpy1_inst_mult_23_n51), .B1(my_dp_mpy1_inst_mult_23_n309), 
        .B2(my_dp_mpy1_inst_mult_23_n58), .C1(my_dp_mpy1_inst_mult_23_n58), 
        .C2(my_dp_mpy1_inst_mult_23_n51), .ZN(my_dp_mpy1_inst_mult_23_n308) );
  OAI222_X1 my_dp_mpy1_inst_mult_23_U247 ( .A1(my_dp_mpy1_inst_mult_23_n308), 
        .A2(my_dp_mpy1_inst_mult_23_n275), .B1(my_dp_mpy1_inst_mult_23_n308), 
        .B2(my_dp_mpy1_inst_mult_23_n276), .C1(my_dp_mpy1_inst_mult_23_n276), 
        .C2(my_dp_mpy1_inst_mult_23_n275), .ZN(my_dp_mpy1_inst_mult_23_n8) );
  OR3_X1 my_dp_mpy1_inst_mult_23_U246 ( .A1(my_dp_mpy1_inst_mult_23_n307), 
        .A2(my_dp_r0[0]), .A3(my_dp_mpy1_inst_mult_23_n294), .ZN(
        my_dp_mpy1_inst_mult_23_n306) );
  OAI21_X1 my_dp_mpy1_inst_mult_23_U245 ( .B1(my_dp_mpy1_inst_mult_23_n294), 
        .B2(my_dp_mpy1_inst_mult_23_n305), .A(my_dp_mpy1_inst_mult_23_n306), 
        .ZN(my_dp_mpy1_inst_mult_23_n97) );
  OR3_X1 my_dp_mpy1_inst_mult_23_U244 ( .A1(my_dp_mpy1_inst_mult_23_n304), 
        .A2(my_dp_r0[0]), .A3(my_dp_mpy1_inst_mult_23_n295), .ZN(
        my_dp_mpy1_inst_mult_23_n303) );
  OAI21_X1 my_dp_mpy1_inst_mult_23_U243 ( .B1(my_dp_mpy1_inst_mult_23_n295), 
        .B2(my_dp_mpy1_inst_mult_23_n302), .A(my_dp_mpy1_inst_mult_23_n303), 
        .ZN(my_dp_mpy1_inst_mult_23_n98) );
  NOR2_X1 my_dp_mpy1_inst_mult_23_U242 ( .A1(my_dp_mpy1_inst_mult_23_n298), 
        .A2(my_dp_mpy1_inst_mult_23_n292), .ZN(my_dp_mpy1_inst_outc_0_) );
  XOR2_X1 my_dp_mpy1_inst_mult_23_U241 ( .A(my_dp_mpy1_inst_mult_23_n19), .B(
        my_dp_mpy1_inst_mult_23_n2), .Z(my_dp_mpy1_inst_mult_23_n299) );
  AND2_X1 my_dp_mpy1_inst_mult_23_U240 ( .A1(my_dp_mpy1_inst_mult_23_n293), 
        .A2(my_dp_mpy1_inst_mult_23_n301), .ZN(my_dp_mpy1_inst_mult_23_n300)
         );
  XOR2_X1 my_dp_mpy1_inst_mult_23_U239 ( .A(my_dp_mpy1_inst_mult_23_n299), .B(
        my_dp_mpy1_inst_mult_23_n300), .Z(my_dp_mpy1_inst_outc_17_) );
  XOR2_X1 my_dp_mpy1_inst_mult_23_U238 ( .A(my_dp_r0[2]), .B(my_dp_coeff[35]), 
        .Z(my_dp_mpy1_inst_mult_23_n328) );
  INV_X1 my_dp_mpy1_inst_mult_23_U237 ( .A(my_dp_coeff[34]), .ZN(
        my_dp_mpy1_inst_mult_23_n294) );
  XOR2_X1 my_dp_mpy1_inst_mult_23_U236 ( .A(my_dp_coeff[33]), .B(
        my_dp_mpy1_inst_mult_23_n295), .Z(my_dp_mpy1_inst_mult_23_n307) );
  INV_X1 my_dp_mpy1_inst_mult_23_U235 ( .A(my_dp_r0[1]), .ZN(
        my_dp_mpy1_inst_mult_23_n291) );
  INV_X1 my_dp_mpy1_inst_mult_23_U234 ( .A(my_dp_coeff[32]), .ZN(
        my_dp_mpy1_inst_mult_23_n295) );
  INV_X1 my_dp_mpy1_inst_mult_23_U233 ( .A(my_dp_r0[0]), .ZN(
        my_dp_mpy1_inst_mult_23_n292) );
  INV_X1 my_dp_mpy1_inst_mult_23_U232 ( .A(my_dp_coeff[27]), .ZN(
        my_dp_mpy1_inst_mult_23_n298) );
  XOR2_X1 my_dp_mpy1_inst_mult_23_U231 ( .A(my_dp_coeff[31]), .B(
        my_dp_mpy1_inst_mult_23_n296), .Z(my_dp_mpy1_inst_mult_23_n304) );
  INV_X1 my_dp_mpy1_inst_mult_23_U230 ( .A(my_dp_coeff[30]), .ZN(
        my_dp_mpy1_inst_mult_23_n296) );
  INV_X1 my_dp_mpy1_inst_mult_23_U229 ( .A(my_dp_mpy1_inst_mult_23_n370), .ZN(
        my_dp_mpy1_inst_mult_23_n281) );
  INV_X1 my_dp_mpy1_inst_mult_23_U228 ( .A(my_dp_mpy1_inst_mult_23_n25), .ZN(
        my_dp_mpy1_inst_mult_23_n283) );
  INV_X1 my_dp_mpy1_inst_mult_23_U227 ( .A(my_dp_mpy1_inst_mult_23_n35), .ZN(
        my_dp_mpy1_inst_mult_23_n286) );
  INV_X1 my_dp_mpy1_inst_mult_23_U226 ( .A(my_dp_mpy1_inst_mult_23_n359), .ZN(
        my_dp_mpy1_inst_mult_23_n280) );
  INV_X1 my_dp_mpy1_inst_mult_23_U225 ( .A(my_dp_mpy1_inst_mult_23_n49), .ZN(
        my_dp_mpy1_inst_mult_23_n289) );
  INV_X1 my_dp_mpy1_inst_mult_23_U224 ( .A(my_dp_mpy1_inst_mult_23_n348), .ZN(
        my_dp_mpy1_inst_mult_23_n279) );
  INV_X1 my_dp_mpy1_inst_mult_23_U223 ( .A(my_dp_mpy1_inst_mult_23_n331), .ZN(
        my_dp_mpy1_inst_mult_23_n293) );
  INV_X1 my_dp_mpy1_inst_mult_23_U222 ( .A(my_dp_mpy1_inst_mult_23_n338), .ZN(
        my_dp_mpy1_inst_mult_23_n277) );
  INV_X1 my_dp_mpy1_inst_mult_23_U221 ( .A(my_dp_mpy1_inst_mult_23_n311), .ZN(
        my_dp_mpy1_inst_mult_23_n284) );
  INV_X1 my_dp_mpy1_inst_mult_23_U220 ( .A(my_dp_mpy1_inst_mult_23_n313), .ZN(
        my_dp_mpy1_inst_mult_23_n287) );
  INV_X1 my_dp_mpy1_inst_mult_23_U219 ( .A(my_dp_mpy1_inst_mult_23_n312), .ZN(
        my_dp_mpy1_inst_mult_23_n285) );
  INV_X1 my_dp_mpy1_inst_mult_23_U218 ( .A(my_dp_mpy1_inst_mult_23_n318), .ZN(
        my_dp_mpy1_inst_mult_23_n297) );
  INV_X1 my_dp_mpy1_inst_mult_23_U217 ( .A(my_dp_mpy1_inst_mult_23_n319), .ZN(
        my_dp_mpy1_inst_mult_23_n290) );
  INV_X1 my_dp_mpy1_inst_mult_23_U216 ( .A(my_dp_mpy1_inst_mult_23_n314), .ZN(
        my_dp_mpy1_inst_mult_23_n288) );
  INV_X1 my_dp_mpy1_inst_mult_23_U215 ( .A(my_dp_mpy1_inst_mult_23_n59), .ZN(
        my_dp_mpy1_inst_mult_23_n278) );
  INV_X1 my_dp_mpy1_inst_mult_23_U214 ( .A(my_dp_mpy1_inst_mult_23_n64), .ZN(
        my_dp_mpy1_inst_mult_23_n282) );
  INV_X1 my_dp_mpy1_inst_mult_23_U213 ( .A(my_dp_mpy1_inst_mult_23_n43), .ZN(
        my_dp_mpy1_inst_mult_23_n275) );
  INV_X1 my_dp_mpy1_inst_mult_23_U212 ( .A(my_dp_mpy1_inst_mult_23_n50), .ZN(
        my_dp_mpy1_inst_mult_23_n276) );
  HA_X1 my_dp_mpy1_inst_mult_23_U51 ( .A(my_dp_mpy1_inst_mult_23_n135), .B(
        my_dp_mpy1_inst_mult_23_n143), .CO(my_dp_mpy1_inst_mult_23_n80), .S(
        my_dp_mpy1_inst_mult_23_n81) );
  FA_X1 my_dp_mpy1_inst_mult_23_U50 ( .A(my_dp_mpy1_inst_mult_23_n142), .B(
        my_dp_mpy1_inst_mult_23_n126), .CI(my_dp_mpy1_inst_mult_23_n134), .CO(
        my_dp_mpy1_inst_mult_23_n78), .S(my_dp_mpy1_inst_mult_23_n79) );
  HA_X1 my_dp_mpy1_inst_mult_23_U49 ( .A(my_dp_mpy1_inst_mult_23_n98), .B(
        my_dp_mpy1_inst_mult_23_n125), .CO(my_dp_mpy1_inst_mult_23_n76), .S(
        my_dp_mpy1_inst_mult_23_n77) );
  FA_X1 my_dp_mpy1_inst_mult_23_U48 ( .A(my_dp_mpy1_inst_mult_23_n133), .B(
        my_dp_mpy1_inst_mult_23_n141), .CI(my_dp_mpy1_inst_mult_23_n77), .CO(
        my_dp_mpy1_inst_mult_23_n74), .S(my_dp_mpy1_inst_mult_23_n75) );
  FA_X1 my_dp_mpy1_inst_mult_23_U47 ( .A(my_dp_mpy1_inst_mult_23_n140), .B(
        my_dp_mpy1_inst_mult_23_n116), .CI(my_dp_mpy1_inst_mult_23_n132), .CO(
        my_dp_mpy1_inst_mult_23_n72), .S(my_dp_mpy1_inst_mult_23_n73) );
  FA_X1 my_dp_mpy1_inst_mult_23_U46 ( .A(my_dp_mpy1_inst_mult_23_n76), .B(
        my_dp_mpy1_inst_mult_23_n124), .CI(my_dp_mpy1_inst_mult_23_n73), .CO(
        my_dp_mpy1_inst_mult_23_n70), .S(my_dp_mpy1_inst_mult_23_n71) );
  HA_X1 my_dp_mpy1_inst_mult_23_U45 ( .A(my_dp_mpy1_inst_mult_23_n97), .B(
        my_dp_mpy1_inst_mult_23_n115), .CO(my_dp_mpy1_inst_mult_23_n68), .S(
        my_dp_mpy1_inst_mult_23_n69) );
  FA_X1 my_dp_mpy1_inst_mult_23_U44 ( .A(my_dp_mpy1_inst_mult_23_n123), .B(
        my_dp_mpy1_inst_mult_23_n139), .CI(my_dp_mpy1_inst_mult_23_n131), .CO(
        my_dp_mpy1_inst_mult_23_n66), .S(my_dp_mpy1_inst_mult_23_n67) );
  FA_X1 my_dp_mpy1_inst_mult_23_U43 ( .A(my_dp_mpy1_inst_mult_23_n72), .B(
        my_dp_mpy1_inst_mult_23_n69), .CI(my_dp_mpy1_inst_mult_23_n67), .CO(
        my_dp_mpy1_inst_mult_23_n64), .S(my_dp_mpy1_inst_mult_23_n65) );
  FA_X1 my_dp_mpy1_inst_mult_23_U42 ( .A(my_dp_mpy1_inst_mult_23_n122), .B(
        my_dp_mpy1_inst_mult_23_n106), .CI(my_dp_mpy1_inst_mult_23_n138), .CO(
        my_dp_mpy1_inst_mult_23_n62), .S(my_dp_mpy1_inst_mult_23_n63) );
  FA_X1 my_dp_mpy1_inst_mult_23_U41 ( .A(my_dp_mpy1_inst_mult_23_n114), .B(
        my_dp_mpy1_inst_mult_23_n130), .CI(my_dp_mpy1_inst_mult_23_n68), .CO(
        my_dp_mpy1_inst_mult_23_n60), .S(my_dp_mpy1_inst_mult_23_n61) );
  FA_X1 my_dp_mpy1_inst_mult_23_U40 ( .A(my_dp_mpy1_inst_mult_23_n63), .B(
        my_dp_mpy1_inst_mult_23_n66), .CI(my_dp_mpy1_inst_mult_23_n61), .CO(
        my_dp_mpy1_inst_mult_23_n58), .S(my_dp_mpy1_inst_mult_23_n59) );
  FA_X1 my_dp_mpy1_inst_mult_23_U37 ( .A(my_dp_mpy1_inst_mult_23_n113), .B(
        my_dp_mpy1_inst_mult_23_n121), .CI(my_dp_mpy1_inst_mult_23_n277), .CO(
        my_dp_mpy1_inst_mult_23_n54), .S(my_dp_mpy1_inst_mult_23_n55) );
  FA_X1 my_dp_mpy1_inst_mult_23_U36 ( .A(my_dp_mpy1_inst_mult_23_n57), .B(
        my_dp_mpy1_inst_mult_23_n129), .CI(my_dp_mpy1_inst_mult_23_n62), .CO(
        my_dp_mpy1_inst_mult_23_n52), .S(my_dp_mpy1_inst_mult_23_n53) );
  FA_X1 my_dp_mpy1_inst_mult_23_U35 ( .A(my_dp_mpy1_inst_mult_23_n55), .B(
        my_dp_mpy1_inst_mult_23_n60), .CI(my_dp_mpy1_inst_mult_23_n53), .CO(
        my_dp_mpy1_inst_mult_23_n50), .S(my_dp_mpy1_inst_mult_23_n51) );
  FA_X1 my_dp_mpy1_inst_mult_23_U33 ( .A(my_dp_mpy1_inst_mult_23_n128), .B(
        my_dp_mpy1_inst_mult_23_n49), .CI(my_dp_mpy1_inst_mult_23_n112), .CO(
        my_dp_mpy1_inst_mult_23_n46), .S(my_dp_mpy1_inst_mult_23_n47) );
  FA_X1 my_dp_mpy1_inst_mult_23_U32 ( .A(my_dp_mpy1_inst_mult_23_n56), .B(
        my_dp_mpy1_inst_mult_23_n120), .CI(my_dp_mpy1_inst_mult_23_n54), .CO(
        my_dp_mpy1_inst_mult_23_n44), .S(my_dp_mpy1_inst_mult_23_n45) );
  FA_X1 my_dp_mpy1_inst_mult_23_U31 ( .A(my_dp_mpy1_inst_mult_23_n52), .B(
        my_dp_mpy1_inst_mult_23_n47), .CI(my_dp_mpy1_inst_mult_23_n45), .CO(
        my_dp_mpy1_inst_mult_23_n42), .S(my_dp_mpy1_inst_mult_23_n43) );
  FA_X1 my_dp_mpy1_inst_mult_23_U30 ( .A(my_dp_mpy1_inst_mult_23_n104), .B(
        my_dp_mpy1_inst_mult_23_n289), .CI(my_dp_mpy1_inst_mult_23_n119), .CO(
        my_dp_mpy1_inst_mult_23_n40), .S(my_dp_mpy1_inst_mult_23_n41) );
  FA_X1 my_dp_mpy1_inst_mult_23_U29 ( .A(my_dp_mpy1_inst_mult_23_n279), .B(
        my_dp_mpy1_inst_mult_23_n111), .CI(my_dp_mpy1_inst_mult_23_n46), .CO(
        my_dp_mpy1_inst_mult_23_n38), .S(my_dp_mpy1_inst_mult_23_n39) );
  FA_X1 my_dp_mpy1_inst_mult_23_U28 ( .A(my_dp_mpy1_inst_mult_23_n44), .B(
        my_dp_mpy1_inst_mult_23_n41), .CI(my_dp_mpy1_inst_mult_23_n39), .CO(
        my_dp_mpy1_inst_mult_23_n36), .S(my_dp_mpy1_inst_mult_23_n37) );
  FA_X1 my_dp_mpy1_inst_mult_23_U26 ( .A(my_dp_mpy1_inst_mult_23_n118), .B(
        my_dp_mpy1_inst_mult_23_n35), .CI(my_dp_mpy1_inst_mult_23_n110), .CO(
        my_dp_mpy1_inst_mult_23_n32), .S(my_dp_mpy1_inst_mult_23_n33) );
  FA_X1 my_dp_mpy1_inst_mult_23_U25 ( .A(my_dp_mpy1_inst_mult_23_n33), .B(
        my_dp_mpy1_inst_mult_23_n40), .CI(my_dp_mpy1_inst_mult_23_n38), .CO(
        my_dp_mpy1_inst_mult_23_n30), .S(my_dp_mpy1_inst_mult_23_n31) );
  FA_X1 my_dp_mpy1_inst_mult_23_U24 ( .A(my_dp_mpy1_inst_mult_23_n103), .B(
        my_dp_mpy1_inst_mult_23_n286), .CI(my_dp_mpy1_inst_mult_23_n109), .CO(
        my_dp_mpy1_inst_mult_23_n28), .S(my_dp_mpy1_inst_mult_23_n29) );
  FA_X1 my_dp_mpy1_inst_mult_23_U23 ( .A(my_dp_mpy1_inst_mult_23_n32), .B(
        my_dp_mpy1_inst_mult_23_n280), .CI(my_dp_mpy1_inst_mult_23_n29), .CO(
        my_dp_mpy1_inst_mult_23_n26), .S(my_dp_mpy1_inst_mult_23_n27) );
  FA_X1 my_dp_mpy1_inst_mult_23_U21 ( .A(my_dp_mpy1_inst_mult_23_n108), .B(
        my_dp_mpy1_inst_mult_23_n25), .CI(my_dp_mpy1_inst_mult_23_n28), .CO(
        my_dp_mpy1_inst_mult_23_n22), .S(my_dp_mpy1_inst_mult_23_n23) );
  FA_X1 my_dp_mpy1_inst_mult_23_U20 ( .A(my_dp_mpy1_inst_mult_23_n102), .B(
        my_dp_mpy1_inst_mult_23_n283), .CI(my_dp_mpy1_inst_mult_23_n281), .CO(
        my_dp_mpy1_inst_mult_23_n20), .S(my_dp_mpy1_inst_mult_23_n21) );
  FA_X1 my_dp_mpy1_inst_mult_23_U8 ( .A(my_dp_mpy1_inst_mult_23_n37), .B(
        my_dp_mpy1_inst_mult_23_n42), .CI(my_dp_mpy1_inst_mult_23_n8), .CO(
        my_dp_mpy1_inst_mult_23_n7), .S(my_dp_mpy_1__3_) );
  FA_X1 my_dp_mpy1_inst_mult_23_U7 ( .A(my_dp_mpy1_inst_mult_23_n31), .B(
        my_dp_mpy1_inst_mult_23_n36), .CI(my_dp_mpy1_inst_mult_23_n7), .CO(
        my_dp_mpy1_inst_mult_23_n6), .S(my_dp_mpy_1__4_) );
  FA_X1 my_dp_mpy1_inst_mult_23_U6 ( .A(my_dp_mpy1_inst_mult_23_n27), .B(
        my_dp_mpy1_inst_mult_23_n30), .CI(my_dp_mpy1_inst_mult_23_n6), .CO(
        my_dp_mpy1_inst_mult_23_n5), .S(my_dp_mpy_1__5_) );
  FA_X1 my_dp_mpy1_inst_mult_23_U5 ( .A(my_dp_mpy1_inst_mult_23_n23), .B(
        my_dp_mpy1_inst_mult_23_n26), .CI(my_dp_mpy1_inst_mult_23_n5), .CO(
        my_dp_mpy1_inst_mult_23_n4), .S(my_dp_mpy_1__6_) );
  FA_X1 my_dp_mpy1_inst_mult_23_U4 ( .A(my_dp_mpy1_inst_mult_23_n22), .B(
        my_dp_mpy1_inst_mult_23_n21), .CI(my_dp_mpy1_inst_mult_23_n4), .CO(
        my_dp_mpy1_inst_mult_23_n3), .S(my_dp_mpy_1__7_) );
  FA_X1 my_dp_mpy1_inst_mult_23_U3 ( .A(my_dp_mpy1_inst_mult_23_n20), .B(
        my_dp_mpy1_inst_mult_23_n19), .CI(my_dp_mpy1_inst_mult_23_n3), .CO(
        my_dp_mpy1_inst_mult_23_n2), .S(my_dp_mpy_1__8_) );
  XOR2_X1 my_dp_mpy2_inst_mult_23_U358 ( .A(my_dp_coeff[26]), .B(
        my_dp_mpy2_inst_mult_23_n294), .Z(my_dp_mpy2_inst_mult_23_n331) );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U357 ( .A(my_dp_r0[7]), .B(my_dp_coeff[26]), 
        .ZN(my_dp_mpy2_inst_mult_23_n374) );
  NOR2_X1 my_dp_mpy2_inst_mult_23_U356 ( .A1(my_dp_mpy2_inst_mult_23_n331), 
        .A2(my_dp_mpy2_inst_mult_23_n374), .ZN(my_dp_mpy2_inst_mult_23_n102)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U355 ( .A(my_dp_r0[5]), .B(my_dp_coeff[26]), 
        .ZN(my_dp_mpy2_inst_mult_23_n373) );
  NOR2_X1 my_dp_mpy2_inst_mult_23_U354 ( .A1(my_dp_mpy2_inst_mult_23_n331), 
        .A2(my_dp_mpy2_inst_mult_23_n373), .ZN(my_dp_mpy2_inst_mult_23_n103)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U353 ( .A(my_dp_r0[3]), .B(my_dp_coeff[26]), 
        .ZN(my_dp_mpy2_inst_mult_23_n372) );
  NOR2_X1 my_dp_mpy2_inst_mult_23_U352 ( .A1(my_dp_mpy2_inst_mult_23_n331), 
        .A2(my_dp_mpy2_inst_mult_23_n372), .ZN(my_dp_mpy2_inst_mult_23_n104)
         );
  NOR2_X1 my_dp_mpy2_inst_mult_23_U351 ( .A1(my_dp_mpy2_inst_mult_23_n331), 
        .A2(my_dp_mpy2_inst_mult_23_n292), .ZN(my_dp_mpy2_inst_mult_23_n106)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U350 ( .A(my_dp_r0[8]), .B(my_dp_coeff[25]), 
        .ZN(my_dp_mpy2_inst_mult_23_n369) );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U349 ( .A(my_dp_mpy2_inst_mult_23_n294), 
        .B(my_dp_coeff[24]), .ZN(my_dp_mpy2_inst_mult_23_n371) );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U348 ( .A1(my_dp_mpy2_inst_mult_23_n307), 
        .A2(my_dp_mpy2_inst_mult_23_n371), .ZN(my_dp_mpy2_inst_mult_23_n305)
         );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U347 ( .A1(my_dp_mpy2_inst_mult_23_n369), 
        .A2(my_dp_mpy2_inst_mult_23_n307), .B1(my_dp_mpy2_inst_mult_23_n305), 
        .B2(my_dp_mpy2_inst_mult_23_n369), .ZN(my_dp_mpy2_inst_mult_23_n370)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U346 ( .A(my_dp_r0[7]), .B(my_dp_coeff[25]), 
        .ZN(my_dp_mpy2_inst_mult_23_n368) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U345 ( .A1(my_dp_mpy2_inst_mult_23_n368), 
        .A2(my_dp_mpy2_inst_mult_23_n305), .B1(my_dp_mpy2_inst_mult_23_n307), 
        .B2(my_dp_mpy2_inst_mult_23_n369), .ZN(my_dp_mpy2_inst_mult_23_n108)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U344 ( .A(my_dp_r0[6]), .B(my_dp_coeff[25]), 
        .ZN(my_dp_mpy2_inst_mult_23_n367) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U343 ( .A1(my_dp_mpy2_inst_mult_23_n367), 
        .A2(my_dp_mpy2_inst_mult_23_n305), .B1(my_dp_mpy2_inst_mult_23_n307), 
        .B2(my_dp_mpy2_inst_mult_23_n368), .ZN(my_dp_mpy2_inst_mult_23_n109)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U342 ( .A(my_dp_r0[5]), .B(my_dp_coeff[25]), 
        .ZN(my_dp_mpy2_inst_mult_23_n366) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U341 ( .A1(my_dp_mpy2_inst_mult_23_n366), 
        .A2(my_dp_mpy2_inst_mult_23_n305), .B1(my_dp_mpy2_inst_mult_23_n307), 
        .B2(my_dp_mpy2_inst_mult_23_n367), .ZN(my_dp_mpy2_inst_mult_23_n110)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U340 ( .A(my_dp_r0[4]), .B(my_dp_coeff[25]), 
        .ZN(my_dp_mpy2_inst_mult_23_n365) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U339 ( .A1(my_dp_mpy2_inst_mult_23_n365), 
        .A2(my_dp_mpy2_inst_mult_23_n305), .B1(my_dp_mpy2_inst_mult_23_n307), 
        .B2(my_dp_mpy2_inst_mult_23_n366), .ZN(my_dp_mpy2_inst_mult_23_n111)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U338 ( .A(my_dp_r0[3]), .B(my_dp_coeff[25]), 
        .ZN(my_dp_mpy2_inst_mult_23_n364) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U337 ( .A1(my_dp_mpy2_inst_mult_23_n364), 
        .A2(my_dp_mpy2_inst_mult_23_n305), .B1(my_dp_mpy2_inst_mult_23_n307), 
        .B2(my_dp_mpy2_inst_mult_23_n365), .ZN(my_dp_mpy2_inst_mult_23_n112)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U336 ( .A(my_dp_r0[2]), .B(my_dp_coeff[25]), 
        .ZN(my_dp_mpy2_inst_mult_23_n363) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U335 ( .A1(my_dp_mpy2_inst_mult_23_n363), 
        .A2(my_dp_mpy2_inst_mult_23_n305), .B1(my_dp_mpy2_inst_mult_23_n307), 
        .B2(my_dp_mpy2_inst_mult_23_n364), .ZN(my_dp_mpy2_inst_mult_23_n113)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U334 ( .A(my_dp_r0[1]), .B(my_dp_coeff[25]), 
        .ZN(my_dp_mpy2_inst_mult_23_n362) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U333 ( .A1(my_dp_mpy2_inst_mult_23_n362), 
        .A2(my_dp_mpy2_inst_mult_23_n305), .B1(my_dp_mpy2_inst_mult_23_n307), 
        .B2(my_dp_mpy2_inst_mult_23_n363), .ZN(my_dp_mpy2_inst_mult_23_n114)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U332 ( .A(my_dp_coeff[25]), .B(my_dp_r0[0]), 
        .ZN(my_dp_mpy2_inst_mult_23_n361) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U331 ( .A1(my_dp_mpy2_inst_mult_23_n361), 
        .A2(my_dp_mpy2_inst_mult_23_n305), .B1(my_dp_mpy2_inst_mult_23_n307), 
        .B2(my_dp_mpy2_inst_mult_23_n362), .ZN(my_dp_mpy2_inst_mult_23_n115)
         );
  NOR2_X1 my_dp_mpy2_inst_mult_23_U330 ( .A1(my_dp_mpy2_inst_mult_23_n307), 
        .A2(my_dp_mpy2_inst_mult_23_n292), .ZN(my_dp_mpy2_inst_mult_23_n116)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U329 ( .A(my_dp_r0[8]), .B(my_dp_coeff[23]), 
        .ZN(my_dp_mpy2_inst_mult_23_n358) );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U328 ( .A(my_dp_mpy2_inst_mult_23_n295), 
        .B(my_dp_coeff[22]), .ZN(my_dp_mpy2_inst_mult_23_n360) );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U327 ( .A1(my_dp_mpy2_inst_mult_23_n304), 
        .A2(my_dp_mpy2_inst_mult_23_n360), .ZN(my_dp_mpy2_inst_mult_23_n302)
         );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U326 ( .A1(my_dp_mpy2_inst_mult_23_n358), 
        .A2(my_dp_mpy2_inst_mult_23_n304), .B1(my_dp_mpy2_inst_mult_23_n302), 
        .B2(my_dp_mpy2_inst_mult_23_n358), .ZN(my_dp_mpy2_inst_mult_23_n359)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U325 ( .A(my_dp_r0[7]), .B(my_dp_coeff[23]), 
        .ZN(my_dp_mpy2_inst_mult_23_n357) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U324 ( .A1(my_dp_mpy2_inst_mult_23_n357), 
        .A2(my_dp_mpy2_inst_mult_23_n302), .B1(my_dp_mpy2_inst_mult_23_n304), 
        .B2(my_dp_mpy2_inst_mult_23_n358), .ZN(my_dp_mpy2_inst_mult_23_n118)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U323 ( .A(my_dp_r0[6]), .B(my_dp_coeff[23]), 
        .ZN(my_dp_mpy2_inst_mult_23_n356) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U322 ( .A1(my_dp_mpy2_inst_mult_23_n356), 
        .A2(my_dp_mpy2_inst_mult_23_n302), .B1(my_dp_mpy2_inst_mult_23_n304), 
        .B2(my_dp_mpy2_inst_mult_23_n357), .ZN(my_dp_mpy2_inst_mult_23_n119)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U321 ( .A(my_dp_r0[5]), .B(my_dp_coeff[23]), 
        .ZN(my_dp_mpy2_inst_mult_23_n355) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U320 ( .A1(my_dp_mpy2_inst_mult_23_n355), 
        .A2(my_dp_mpy2_inst_mult_23_n302), .B1(my_dp_mpy2_inst_mult_23_n304), 
        .B2(my_dp_mpy2_inst_mult_23_n356), .ZN(my_dp_mpy2_inst_mult_23_n120)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U319 ( .A(my_dp_r0[4]), .B(my_dp_coeff[23]), 
        .ZN(my_dp_mpy2_inst_mult_23_n354) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U318 ( .A1(my_dp_mpy2_inst_mult_23_n354), 
        .A2(my_dp_mpy2_inst_mult_23_n302), .B1(my_dp_mpy2_inst_mult_23_n304), 
        .B2(my_dp_mpy2_inst_mult_23_n355), .ZN(my_dp_mpy2_inst_mult_23_n121)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U317 ( .A(my_dp_r0[3]), .B(my_dp_coeff[23]), 
        .ZN(my_dp_mpy2_inst_mult_23_n353) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U316 ( .A1(my_dp_mpy2_inst_mult_23_n353), 
        .A2(my_dp_mpy2_inst_mult_23_n302), .B1(my_dp_mpy2_inst_mult_23_n304), 
        .B2(my_dp_mpy2_inst_mult_23_n354), .ZN(my_dp_mpy2_inst_mult_23_n122)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U315 ( .A(my_dp_r0[2]), .B(my_dp_coeff[23]), 
        .ZN(my_dp_mpy2_inst_mult_23_n352) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U314 ( .A1(my_dp_mpy2_inst_mult_23_n352), 
        .A2(my_dp_mpy2_inst_mult_23_n302), .B1(my_dp_mpy2_inst_mult_23_n304), 
        .B2(my_dp_mpy2_inst_mult_23_n353), .ZN(my_dp_mpy2_inst_mult_23_n123)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U313 ( .A(my_dp_r0[1]), .B(my_dp_coeff[23]), 
        .ZN(my_dp_mpy2_inst_mult_23_n351) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U312 ( .A1(my_dp_mpy2_inst_mult_23_n351), 
        .A2(my_dp_mpy2_inst_mult_23_n302), .B1(my_dp_mpy2_inst_mult_23_n304), 
        .B2(my_dp_mpy2_inst_mult_23_n352), .ZN(my_dp_mpy2_inst_mult_23_n124)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U311 ( .A(my_dp_coeff[23]), .B(my_dp_r0[0]), 
        .ZN(my_dp_mpy2_inst_mult_23_n350) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U310 ( .A1(my_dp_mpy2_inst_mult_23_n350), 
        .A2(my_dp_mpy2_inst_mult_23_n302), .B1(my_dp_mpy2_inst_mult_23_n304), 
        .B2(my_dp_mpy2_inst_mult_23_n351), .ZN(my_dp_mpy2_inst_mult_23_n125)
         );
  NOR2_X1 my_dp_mpy2_inst_mult_23_U309 ( .A1(my_dp_mpy2_inst_mult_23_n304), 
        .A2(my_dp_mpy2_inst_mult_23_n292), .ZN(my_dp_mpy2_inst_mult_23_n126)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U308 ( .A(my_dp_r0[8]), .B(my_dp_coeff[21]), 
        .ZN(my_dp_mpy2_inst_mult_23_n347) );
  XOR2_X1 my_dp_mpy2_inst_mult_23_U307 ( .A(my_dp_coeff[20]), .B(
        my_dp_coeff[19]), .Z(my_dp_mpy2_inst_mult_23_n318) );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U306 ( .A(my_dp_mpy2_inst_mult_23_n296), 
        .B(my_dp_coeff[20]), .ZN(my_dp_mpy2_inst_mult_23_n349) );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U305 ( .A1(my_dp_mpy2_inst_mult_23_n297), 
        .A2(my_dp_mpy2_inst_mult_23_n349), .ZN(my_dp_mpy2_inst_mult_23_n316)
         );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U304 ( .A1(my_dp_mpy2_inst_mult_23_n347), 
        .A2(my_dp_mpy2_inst_mult_23_n297), .B1(my_dp_mpy2_inst_mult_23_n316), 
        .B2(my_dp_mpy2_inst_mult_23_n347), .ZN(my_dp_mpy2_inst_mult_23_n348)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U303 ( .A(my_dp_r0[7]), .B(my_dp_coeff[21]), 
        .ZN(my_dp_mpy2_inst_mult_23_n346) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U302 ( .A1(my_dp_mpy2_inst_mult_23_n346), 
        .A2(my_dp_mpy2_inst_mult_23_n316), .B1(my_dp_mpy2_inst_mult_23_n297), 
        .B2(my_dp_mpy2_inst_mult_23_n347), .ZN(my_dp_mpy2_inst_mult_23_n128)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U301 ( .A(my_dp_r0[6]), .B(my_dp_coeff[21]), 
        .ZN(my_dp_mpy2_inst_mult_23_n345) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U300 ( .A1(my_dp_mpy2_inst_mult_23_n345), 
        .A2(my_dp_mpy2_inst_mult_23_n316), .B1(my_dp_mpy2_inst_mult_23_n297), 
        .B2(my_dp_mpy2_inst_mult_23_n346), .ZN(my_dp_mpy2_inst_mult_23_n129)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U299 ( .A(my_dp_r0[5]), .B(my_dp_coeff[21]), 
        .ZN(my_dp_mpy2_inst_mult_23_n344) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U298 ( .A1(my_dp_mpy2_inst_mult_23_n344), 
        .A2(my_dp_mpy2_inst_mult_23_n316), .B1(my_dp_mpy2_inst_mult_23_n297), 
        .B2(my_dp_mpy2_inst_mult_23_n345), .ZN(my_dp_mpy2_inst_mult_23_n130)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U297 ( .A(my_dp_r0[4]), .B(my_dp_coeff[21]), 
        .ZN(my_dp_mpy2_inst_mult_23_n343) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U296 ( .A1(my_dp_mpy2_inst_mult_23_n343), 
        .A2(my_dp_mpy2_inst_mult_23_n316), .B1(my_dp_mpy2_inst_mult_23_n297), 
        .B2(my_dp_mpy2_inst_mult_23_n344), .ZN(my_dp_mpy2_inst_mult_23_n131)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U295 ( .A(my_dp_r0[3]), .B(my_dp_coeff[21]), 
        .ZN(my_dp_mpy2_inst_mult_23_n342) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U294 ( .A1(my_dp_mpy2_inst_mult_23_n342), 
        .A2(my_dp_mpy2_inst_mult_23_n316), .B1(my_dp_mpy2_inst_mult_23_n297), 
        .B2(my_dp_mpy2_inst_mult_23_n343), .ZN(my_dp_mpy2_inst_mult_23_n132)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U293 ( .A(my_dp_r0[2]), .B(my_dp_coeff[21]), 
        .ZN(my_dp_mpy2_inst_mult_23_n341) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U292 ( .A1(my_dp_mpy2_inst_mult_23_n341), 
        .A2(my_dp_mpy2_inst_mult_23_n316), .B1(my_dp_mpy2_inst_mult_23_n297), 
        .B2(my_dp_mpy2_inst_mult_23_n342), .ZN(my_dp_mpy2_inst_mult_23_n133)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U291 ( .A(my_dp_r0[1]), .B(my_dp_coeff[21]), 
        .ZN(my_dp_mpy2_inst_mult_23_n340) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U290 ( .A1(my_dp_mpy2_inst_mult_23_n340), 
        .A2(my_dp_mpy2_inst_mult_23_n316), .B1(my_dp_mpy2_inst_mult_23_n297), 
        .B2(my_dp_mpy2_inst_mult_23_n341), .ZN(my_dp_mpy2_inst_mult_23_n134)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U289 ( .A(my_dp_coeff[21]), .B(my_dp_r0[0]), 
        .ZN(my_dp_mpy2_inst_mult_23_n339) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U288 ( .A1(my_dp_mpy2_inst_mult_23_n339), 
        .A2(my_dp_mpy2_inst_mult_23_n316), .B1(my_dp_mpy2_inst_mult_23_n297), 
        .B2(my_dp_mpy2_inst_mult_23_n340), .ZN(my_dp_mpy2_inst_mult_23_n135)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U287 ( .A(my_dp_r0[8]), .B(my_dp_coeff[19]), 
        .ZN(my_dp_mpy2_inst_mult_23_n337) );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U286 ( .A1(my_dp_coeff[19]), .A2(
        my_dp_mpy2_inst_mult_23_n298), .ZN(my_dp_mpy2_inst_mult_23_n323) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U285 ( .A1(my_dp_mpy2_inst_mult_23_n298), 
        .A2(my_dp_mpy2_inst_mult_23_n337), .B1(my_dp_mpy2_inst_mult_23_n323), 
        .B2(my_dp_mpy2_inst_mult_23_n337), .ZN(my_dp_mpy2_inst_mult_23_n338)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U284 ( .A(my_dp_r0[7]), .B(my_dp_coeff[19]), 
        .ZN(my_dp_mpy2_inst_mult_23_n336) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U283 ( .A1(my_dp_mpy2_inst_mult_23_n336), 
        .A2(my_dp_mpy2_inst_mult_23_n323), .B1(my_dp_mpy2_inst_mult_23_n337), 
        .B2(my_dp_mpy2_inst_mult_23_n298), .ZN(my_dp_mpy2_inst_mult_23_n138)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U282 ( .A(my_dp_r0[6]), .B(my_dp_coeff[19]), 
        .ZN(my_dp_mpy2_inst_mult_23_n335) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U281 ( .A1(my_dp_mpy2_inst_mult_23_n335), 
        .A2(my_dp_mpy2_inst_mult_23_n323), .B1(my_dp_mpy2_inst_mult_23_n336), 
        .B2(my_dp_mpy2_inst_mult_23_n298), .ZN(my_dp_mpy2_inst_mult_23_n139)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U280 ( .A(my_dp_r0[5]), .B(my_dp_coeff[19]), 
        .ZN(my_dp_mpy2_inst_mult_23_n334) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U279 ( .A1(my_dp_mpy2_inst_mult_23_n334), 
        .A2(my_dp_mpy2_inst_mult_23_n323), .B1(my_dp_mpy2_inst_mult_23_n335), 
        .B2(my_dp_mpy2_inst_mult_23_n298), .ZN(my_dp_mpy2_inst_mult_23_n140)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U278 ( .A(my_dp_r0[4]), .B(my_dp_coeff[19]), 
        .ZN(my_dp_mpy2_inst_mult_23_n333) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U277 ( .A1(my_dp_mpy2_inst_mult_23_n333), 
        .A2(my_dp_mpy2_inst_mult_23_n323), .B1(my_dp_mpy2_inst_mult_23_n334), 
        .B2(my_dp_mpy2_inst_mult_23_n298), .ZN(my_dp_mpy2_inst_mult_23_n141)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U276 ( .A(my_dp_r0[3]), .B(my_dp_coeff[19]), 
        .ZN(my_dp_mpy2_inst_mult_23_n332) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U275 ( .A1(my_dp_mpy2_inst_mult_23_n332), 
        .A2(my_dp_mpy2_inst_mult_23_n323), .B1(my_dp_mpy2_inst_mult_23_n333), 
        .B2(my_dp_mpy2_inst_mult_23_n298), .ZN(my_dp_mpy2_inst_mult_23_n142)
         );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U274 ( .A(my_dp_r0[2]), .B(my_dp_coeff[19]), 
        .ZN(my_dp_mpy2_inst_mult_23_n324) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U273 ( .A1(my_dp_mpy2_inst_mult_23_n324), 
        .A2(my_dp_mpy2_inst_mult_23_n323), .B1(my_dp_mpy2_inst_mult_23_n332), 
        .B2(my_dp_mpy2_inst_mult_23_n298), .ZN(my_dp_mpy2_inst_mult_23_n143)
         );
  XOR2_X1 my_dp_mpy2_inst_mult_23_U272 ( .A(my_dp_r0[8]), .B(my_dp_coeff[26]), 
        .Z(my_dp_mpy2_inst_mult_23_n301) );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U271 ( .A1(my_dp_mpy2_inst_mult_23_n301), 
        .A2(my_dp_mpy2_inst_mult_23_n293), .ZN(my_dp_mpy2_inst_mult_23_n19) );
  XOR2_X1 my_dp_mpy2_inst_mult_23_U270 ( .A(my_dp_r0[6]), .B(my_dp_coeff[26]), 
        .Z(my_dp_mpy2_inst_mult_23_n330) );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U269 ( .A1(my_dp_mpy2_inst_mult_23_n330), 
        .A2(my_dp_mpy2_inst_mult_23_n293), .ZN(my_dp_mpy2_inst_mult_23_n25) );
  XOR2_X1 my_dp_mpy2_inst_mult_23_U268 ( .A(my_dp_r0[4]), .B(my_dp_coeff[26]), 
        .Z(my_dp_mpy2_inst_mult_23_n329) );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U267 ( .A1(my_dp_mpy2_inst_mult_23_n329), 
        .A2(my_dp_mpy2_inst_mult_23_n293), .ZN(my_dp_mpy2_inst_mult_23_n35) );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U266 ( .A1(my_dp_mpy2_inst_mult_23_n328), 
        .A2(my_dp_mpy2_inst_mult_23_n293), .ZN(my_dp_mpy2_inst_mult_23_n49) );
  NAND3_X1 my_dp_mpy2_inst_mult_23_U265 ( .A1(my_dp_mpy2_inst_mult_23_n293), 
        .A2(my_dp_mpy2_inst_mult_23_n292), .A3(my_dp_coeff[26]), .ZN(
        my_dp_mpy2_inst_mult_23_n325) );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U264 ( .A(my_dp_mpy2_inst_mult_23_n291), 
        .B(my_dp_coeff[26]), .ZN(my_dp_mpy2_inst_mult_23_n327) );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U263 ( .A1(my_dp_mpy2_inst_mult_23_n327), 
        .A2(my_dp_mpy2_inst_mult_23_n293), .ZN(my_dp_mpy2_inst_mult_23_n326)
         );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U262 ( .A1(my_dp_mpy2_inst_mult_23_n325), 
        .A2(my_dp_mpy2_inst_mult_23_n326), .ZN(my_dp_mpy2_inst_mult_23_n56) );
  XNOR2_X1 my_dp_mpy2_inst_mult_23_U261 ( .A(my_dp_mpy2_inst_mult_23_n325), 
        .B(my_dp_mpy2_inst_mult_23_n326), .ZN(my_dp_mpy2_inst_mult_23_n57) );
  OAI22_X1 my_dp_mpy2_inst_mult_23_U260 ( .A1(my_dp_r0[1]), .A2(
        my_dp_mpy2_inst_mult_23_n323), .B1(my_dp_mpy2_inst_mult_23_n324), .B2(
        my_dp_mpy2_inst_mult_23_n298), .ZN(my_dp_mpy2_inst_mult_23_n322) );
  NAND2_X1 my_dp_mpy2_inst_mult_23_U259 ( .A1(my_dp_mpy2_inst_mult_23_n318), 
        .A2(my_dp_mpy2_inst_mult_23_n322), .ZN(my_dp_mpy2_inst_mult_23_n320)
         );
  NAND3_X1 my_dp_mpy2_inst_mult_23_U258 ( .A1(my_dp_mpy2_inst_mult_23_n322), 
        .A2(my_dp_mpy2_inst_mult_23_n291), .A3(my_dp_coeff[19]), .ZN(
        my_dp_mpy2_inst_mult_23_n321) );
  MUX2_X1 my_dp_mpy2_inst_mult_23_U257 ( .A(my_dp_mpy2_inst_mult_23_n320), .B(
        my_dp_mpy2_inst_mult_23_n321), .S(my_dp_mpy2_inst_mult_23_n292), .Z(
        my_dp_mpy2_inst_mult_23_n319) );
  NAND3_X1 my_dp_mpy2_inst_mult_23_U256 ( .A1(my_dp_mpy2_inst_mult_23_n318), 
        .A2(my_dp_mpy2_inst_mult_23_n292), .A3(my_dp_coeff[21]), .ZN(
        my_dp_mpy2_inst_mult_23_n317) );
  OAI21_X1 my_dp_mpy2_inst_mult_23_U255 ( .B1(my_dp_mpy2_inst_mult_23_n296), 
        .B2(my_dp_mpy2_inst_mult_23_n316), .A(my_dp_mpy2_inst_mult_23_n317), 
        .ZN(my_dp_mpy2_inst_mult_23_n315) );
  AOI222_X1 my_dp_mpy2_inst_mult_23_U254 ( .A1(my_dp_mpy2_inst_mult_23_n290), 
        .A2(my_dp_mpy2_inst_mult_23_n81), .B1(my_dp_mpy2_inst_mult_23_n315), 
        .B2(my_dp_mpy2_inst_mult_23_n290), .C1(my_dp_mpy2_inst_mult_23_n315), 
        .C2(my_dp_mpy2_inst_mult_23_n81), .ZN(my_dp_mpy2_inst_mult_23_n314) );
  AOI222_X1 my_dp_mpy2_inst_mult_23_U253 ( .A1(my_dp_mpy2_inst_mult_23_n288), 
        .A2(my_dp_mpy2_inst_mult_23_n79), .B1(my_dp_mpy2_inst_mult_23_n288), 
        .B2(my_dp_mpy2_inst_mult_23_n80), .C1(my_dp_mpy2_inst_mult_23_n80), 
        .C2(my_dp_mpy2_inst_mult_23_n79), .ZN(my_dp_mpy2_inst_mult_23_n313) );
  AOI222_X1 my_dp_mpy2_inst_mult_23_U252 ( .A1(my_dp_mpy2_inst_mult_23_n287), 
        .A2(my_dp_mpy2_inst_mult_23_n75), .B1(my_dp_mpy2_inst_mult_23_n287), 
        .B2(my_dp_mpy2_inst_mult_23_n78), .C1(my_dp_mpy2_inst_mult_23_n78), 
        .C2(my_dp_mpy2_inst_mult_23_n75), .ZN(my_dp_mpy2_inst_mult_23_n312) );
  AOI222_X1 my_dp_mpy2_inst_mult_23_U251 ( .A1(my_dp_mpy2_inst_mult_23_n285), 
        .A2(my_dp_mpy2_inst_mult_23_n71), .B1(my_dp_mpy2_inst_mult_23_n285), 
        .B2(my_dp_mpy2_inst_mult_23_n74), .C1(my_dp_mpy2_inst_mult_23_n74), 
        .C2(my_dp_mpy2_inst_mult_23_n71), .ZN(my_dp_mpy2_inst_mult_23_n311) );
  AOI222_X1 my_dp_mpy2_inst_mult_23_U250 ( .A1(my_dp_mpy2_inst_mult_23_n284), 
        .A2(my_dp_mpy2_inst_mult_23_n65), .B1(my_dp_mpy2_inst_mult_23_n284), 
        .B2(my_dp_mpy2_inst_mult_23_n70), .C1(my_dp_mpy2_inst_mult_23_n70), 
        .C2(my_dp_mpy2_inst_mult_23_n65), .ZN(my_dp_mpy2_inst_mult_23_n310) );
  OAI222_X1 my_dp_mpy2_inst_mult_23_U249 ( .A1(my_dp_mpy2_inst_mult_23_n310), 
        .A2(my_dp_mpy2_inst_mult_23_n278), .B1(my_dp_mpy2_inst_mult_23_n310), 
        .B2(my_dp_mpy2_inst_mult_23_n282), .C1(my_dp_mpy2_inst_mult_23_n282), 
        .C2(my_dp_mpy2_inst_mult_23_n278), .ZN(my_dp_mpy2_inst_mult_23_n309)
         );
  AOI222_X1 my_dp_mpy2_inst_mult_23_U248 ( .A1(my_dp_mpy2_inst_mult_23_n309), 
        .A2(my_dp_mpy2_inst_mult_23_n51), .B1(my_dp_mpy2_inst_mult_23_n309), 
        .B2(my_dp_mpy2_inst_mult_23_n58), .C1(my_dp_mpy2_inst_mult_23_n58), 
        .C2(my_dp_mpy2_inst_mult_23_n51), .ZN(my_dp_mpy2_inst_mult_23_n308) );
  OAI222_X1 my_dp_mpy2_inst_mult_23_U247 ( .A1(my_dp_mpy2_inst_mult_23_n308), 
        .A2(my_dp_mpy2_inst_mult_23_n275), .B1(my_dp_mpy2_inst_mult_23_n308), 
        .B2(my_dp_mpy2_inst_mult_23_n276), .C1(my_dp_mpy2_inst_mult_23_n276), 
        .C2(my_dp_mpy2_inst_mult_23_n275), .ZN(my_dp_mpy2_inst_mult_23_n8) );
  OR3_X1 my_dp_mpy2_inst_mult_23_U246 ( .A1(my_dp_mpy2_inst_mult_23_n307), 
        .A2(my_dp_r0[0]), .A3(my_dp_mpy2_inst_mult_23_n294), .ZN(
        my_dp_mpy2_inst_mult_23_n306) );
  OAI21_X1 my_dp_mpy2_inst_mult_23_U245 ( .B1(my_dp_mpy2_inst_mult_23_n294), 
        .B2(my_dp_mpy2_inst_mult_23_n305), .A(my_dp_mpy2_inst_mult_23_n306), 
        .ZN(my_dp_mpy2_inst_mult_23_n97) );
  OR3_X1 my_dp_mpy2_inst_mult_23_U244 ( .A1(my_dp_mpy2_inst_mult_23_n304), 
        .A2(my_dp_r0[0]), .A3(my_dp_mpy2_inst_mult_23_n295), .ZN(
        my_dp_mpy2_inst_mult_23_n303) );
  OAI21_X1 my_dp_mpy2_inst_mult_23_U243 ( .B1(my_dp_mpy2_inst_mult_23_n295), 
        .B2(my_dp_mpy2_inst_mult_23_n302), .A(my_dp_mpy2_inst_mult_23_n303), 
        .ZN(my_dp_mpy2_inst_mult_23_n98) );
  NOR2_X1 my_dp_mpy2_inst_mult_23_U242 ( .A1(my_dp_mpy2_inst_mult_23_n298), 
        .A2(my_dp_mpy2_inst_mult_23_n292), .ZN(my_dp_mpy2_inst_outc_0_) );
  XOR2_X1 my_dp_mpy2_inst_mult_23_U241 ( .A(my_dp_mpy2_inst_mult_23_n19), .B(
        my_dp_mpy2_inst_mult_23_n2), .Z(my_dp_mpy2_inst_mult_23_n299) );
  AND2_X1 my_dp_mpy2_inst_mult_23_U240 ( .A1(my_dp_mpy2_inst_mult_23_n293), 
        .A2(my_dp_mpy2_inst_mult_23_n301), .ZN(my_dp_mpy2_inst_mult_23_n300)
         );
  XOR2_X1 my_dp_mpy2_inst_mult_23_U239 ( .A(my_dp_mpy2_inst_mult_23_n299), .B(
        my_dp_mpy2_inst_mult_23_n300), .Z(my_dp_mpy2_inst_outc_17_) );
  XOR2_X1 my_dp_mpy2_inst_mult_23_U238 ( .A(my_dp_r0[2]), .B(my_dp_coeff[26]), 
        .Z(my_dp_mpy2_inst_mult_23_n328) );
  INV_X1 my_dp_mpy2_inst_mult_23_U237 ( .A(my_dp_coeff[25]), .ZN(
        my_dp_mpy2_inst_mult_23_n294) );
  XOR2_X1 my_dp_mpy2_inst_mult_23_U236 ( .A(my_dp_coeff[24]), .B(
        my_dp_mpy2_inst_mult_23_n295), .Z(my_dp_mpy2_inst_mult_23_n307) );
  INV_X1 my_dp_mpy2_inst_mult_23_U235 ( .A(my_dp_r0[1]), .ZN(
        my_dp_mpy2_inst_mult_23_n291) );
  INV_X1 my_dp_mpy2_inst_mult_23_U234 ( .A(my_dp_coeff[23]), .ZN(
        my_dp_mpy2_inst_mult_23_n295) );
  INV_X1 my_dp_mpy2_inst_mult_23_U233 ( .A(my_dp_r0[0]), .ZN(
        my_dp_mpy2_inst_mult_23_n292) );
  INV_X1 my_dp_mpy2_inst_mult_23_U232 ( .A(my_dp_coeff[18]), .ZN(
        my_dp_mpy2_inst_mult_23_n298) );
  XOR2_X1 my_dp_mpy2_inst_mult_23_U231 ( .A(my_dp_coeff[22]), .B(
        my_dp_mpy2_inst_mult_23_n296), .Z(my_dp_mpy2_inst_mult_23_n304) );
  INV_X1 my_dp_mpy2_inst_mult_23_U230 ( .A(my_dp_coeff[21]), .ZN(
        my_dp_mpy2_inst_mult_23_n296) );
  INV_X1 my_dp_mpy2_inst_mult_23_U229 ( .A(my_dp_mpy2_inst_mult_23_n370), .ZN(
        my_dp_mpy2_inst_mult_23_n281) );
  INV_X1 my_dp_mpy2_inst_mult_23_U228 ( .A(my_dp_mpy2_inst_mult_23_n25), .ZN(
        my_dp_mpy2_inst_mult_23_n283) );
  INV_X1 my_dp_mpy2_inst_mult_23_U227 ( .A(my_dp_mpy2_inst_mult_23_n35), .ZN(
        my_dp_mpy2_inst_mult_23_n286) );
  INV_X1 my_dp_mpy2_inst_mult_23_U226 ( .A(my_dp_mpy2_inst_mult_23_n359), .ZN(
        my_dp_mpy2_inst_mult_23_n280) );
  INV_X1 my_dp_mpy2_inst_mult_23_U225 ( .A(my_dp_mpy2_inst_mult_23_n49), .ZN(
        my_dp_mpy2_inst_mult_23_n289) );
  INV_X1 my_dp_mpy2_inst_mult_23_U224 ( .A(my_dp_mpy2_inst_mult_23_n348), .ZN(
        my_dp_mpy2_inst_mult_23_n279) );
  INV_X1 my_dp_mpy2_inst_mult_23_U223 ( .A(my_dp_mpy2_inst_mult_23_n331), .ZN(
        my_dp_mpy2_inst_mult_23_n293) );
  INV_X1 my_dp_mpy2_inst_mult_23_U222 ( .A(my_dp_mpy2_inst_mult_23_n338), .ZN(
        my_dp_mpy2_inst_mult_23_n277) );
  INV_X1 my_dp_mpy2_inst_mult_23_U221 ( .A(my_dp_mpy2_inst_mult_23_n313), .ZN(
        my_dp_mpy2_inst_mult_23_n287) );
  INV_X1 my_dp_mpy2_inst_mult_23_U220 ( .A(my_dp_mpy2_inst_mult_23_n312), .ZN(
        my_dp_mpy2_inst_mult_23_n285) );
  INV_X1 my_dp_mpy2_inst_mult_23_U219 ( .A(my_dp_mpy2_inst_mult_23_n318), .ZN(
        my_dp_mpy2_inst_mult_23_n297) );
  INV_X1 my_dp_mpy2_inst_mult_23_U218 ( .A(my_dp_mpy2_inst_mult_23_n319), .ZN(
        my_dp_mpy2_inst_mult_23_n290) );
  INV_X1 my_dp_mpy2_inst_mult_23_U217 ( .A(my_dp_mpy2_inst_mult_23_n314), .ZN(
        my_dp_mpy2_inst_mult_23_n288) );
  INV_X1 my_dp_mpy2_inst_mult_23_U216 ( .A(my_dp_mpy2_inst_mult_23_n311), .ZN(
        my_dp_mpy2_inst_mult_23_n284) );
  INV_X1 my_dp_mpy2_inst_mult_23_U215 ( .A(my_dp_mpy2_inst_mult_23_n59), .ZN(
        my_dp_mpy2_inst_mult_23_n278) );
  INV_X1 my_dp_mpy2_inst_mult_23_U214 ( .A(my_dp_mpy2_inst_mult_23_n64), .ZN(
        my_dp_mpy2_inst_mult_23_n282) );
  INV_X1 my_dp_mpy2_inst_mult_23_U213 ( .A(my_dp_mpy2_inst_mult_23_n43), .ZN(
        my_dp_mpy2_inst_mult_23_n275) );
  INV_X1 my_dp_mpy2_inst_mult_23_U212 ( .A(my_dp_mpy2_inst_mult_23_n50), .ZN(
        my_dp_mpy2_inst_mult_23_n276) );
  HA_X1 my_dp_mpy2_inst_mult_23_U51 ( .A(my_dp_mpy2_inst_mult_23_n135), .B(
        my_dp_mpy2_inst_mult_23_n143), .CO(my_dp_mpy2_inst_mult_23_n80), .S(
        my_dp_mpy2_inst_mult_23_n81) );
  FA_X1 my_dp_mpy2_inst_mult_23_U50 ( .A(my_dp_mpy2_inst_mult_23_n142), .B(
        my_dp_mpy2_inst_mult_23_n126), .CI(my_dp_mpy2_inst_mult_23_n134), .CO(
        my_dp_mpy2_inst_mult_23_n78), .S(my_dp_mpy2_inst_mult_23_n79) );
  HA_X1 my_dp_mpy2_inst_mult_23_U49 ( .A(my_dp_mpy2_inst_mult_23_n98), .B(
        my_dp_mpy2_inst_mult_23_n125), .CO(my_dp_mpy2_inst_mult_23_n76), .S(
        my_dp_mpy2_inst_mult_23_n77) );
  FA_X1 my_dp_mpy2_inst_mult_23_U48 ( .A(my_dp_mpy2_inst_mult_23_n133), .B(
        my_dp_mpy2_inst_mult_23_n141), .CI(my_dp_mpy2_inst_mult_23_n77), .CO(
        my_dp_mpy2_inst_mult_23_n74), .S(my_dp_mpy2_inst_mult_23_n75) );
  FA_X1 my_dp_mpy2_inst_mult_23_U47 ( .A(my_dp_mpy2_inst_mult_23_n140), .B(
        my_dp_mpy2_inst_mult_23_n116), .CI(my_dp_mpy2_inst_mult_23_n132), .CO(
        my_dp_mpy2_inst_mult_23_n72), .S(my_dp_mpy2_inst_mult_23_n73) );
  FA_X1 my_dp_mpy2_inst_mult_23_U46 ( .A(my_dp_mpy2_inst_mult_23_n76), .B(
        my_dp_mpy2_inst_mult_23_n124), .CI(my_dp_mpy2_inst_mult_23_n73), .CO(
        my_dp_mpy2_inst_mult_23_n70), .S(my_dp_mpy2_inst_mult_23_n71) );
  HA_X1 my_dp_mpy2_inst_mult_23_U45 ( .A(my_dp_mpy2_inst_mult_23_n97), .B(
        my_dp_mpy2_inst_mult_23_n115), .CO(my_dp_mpy2_inst_mult_23_n68), .S(
        my_dp_mpy2_inst_mult_23_n69) );
  FA_X1 my_dp_mpy2_inst_mult_23_U44 ( .A(my_dp_mpy2_inst_mult_23_n123), .B(
        my_dp_mpy2_inst_mult_23_n139), .CI(my_dp_mpy2_inst_mult_23_n131), .CO(
        my_dp_mpy2_inst_mult_23_n66), .S(my_dp_mpy2_inst_mult_23_n67) );
  FA_X1 my_dp_mpy2_inst_mult_23_U43 ( .A(my_dp_mpy2_inst_mult_23_n72), .B(
        my_dp_mpy2_inst_mult_23_n69), .CI(my_dp_mpy2_inst_mult_23_n67), .CO(
        my_dp_mpy2_inst_mult_23_n64), .S(my_dp_mpy2_inst_mult_23_n65) );
  FA_X1 my_dp_mpy2_inst_mult_23_U42 ( .A(my_dp_mpy2_inst_mult_23_n122), .B(
        my_dp_mpy2_inst_mult_23_n106), .CI(my_dp_mpy2_inst_mult_23_n138), .CO(
        my_dp_mpy2_inst_mult_23_n62), .S(my_dp_mpy2_inst_mult_23_n63) );
  FA_X1 my_dp_mpy2_inst_mult_23_U41 ( .A(my_dp_mpy2_inst_mult_23_n114), .B(
        my_dp_mpy2_inst_mult_23_n130), .CI(my_dp_mpy2_inst_mult_23_n68), .CO(
        my_dp_mpy2_inst_mult_23_n60), .S(my_dp_mpy2_inst_mult_23_n61) );
  FA_X1 my_dp_mpy2_inst_mult_23_U40 ( .A(my_dp_mpy2_inst_mult_23_n63), .B(
        my_dp_mpy2_inst_mult_23_n66), .CI(my_dp_mpy2_inst_mult_23_n61), .CO(
        my_dp_mpy2_inst_mult_23_n58), .S(my_dp_mpy2_inst_mult_23_n59) );
  FA_X1 my_dp_mpy2_inst_mult_23_U37 ( .A(my_dp_mpy2_inst_mult_23_n113), .B(
        my_dp_mpy2_inst_mult_23_n121), .CI(my_dp_mpy2_inst_mult_23_n277), .CO(
        my_dp_mpy2_inst_mult_23_n54), .S(my_dp_mpy2_inst_mult_23_n55) );
  FA_X1 my_dp_mpy2_inst_mult_23_U36 ( .A(my_dp_mpy2_inst_mult_23_n57), .B(
        my_dp_mpy2_inst_mult_23_n129), .CI(my_dp_mpy2_inst_mult_23_n62), .CO(
        my_dp_mpy2_inst_mult_23_n52), .S(my_dp_mpy2_inst_mult_23_n53) );
  FA_X1 my_dp_mpy2_inst_mult_23_U35 ( .A(my_dp_mpy2_inst_mult_23_n55), .B(
        my_dp_mpy2_inst_mult_23_n60), .CI(my_dp_mpy2_inst_mult_23_n53), .CO(
        my_dp_mpy2_inst_mult_23_n50), .S(my_dp_mpy2_inst_mult_23_n51) );
  FA_X1 my_dp_mpy2_inst_mult_23_U33 ( .A(my_dp_mpy2_inst_mult_23_n128), .B(
        my_dp_mpy2_inst_mult_23_n49), .CI(my_dp_mpy2_inst_mult_23_n112), .CO(
        my_dp_mpy2_inst_mult_23_n46), .S(my_dp_mpy2_inst_mult_23_n47) );
  FA_X1 my_dp_mpy2_inst_mult_23_U32 ( .A(my_dp_mpy2_inst_mult_23_n56), .B(
        my_dp_mpy2_inst_mult_23_n120), .CI(my_dp_mpy2_inst_mult_23_n54), .CO(
        my_dp_mpy2_inst_mult_23_n44), .S(my_dp_mpy2_inst_mult_23_n45) );
  FA_X1 my_dp_mpy2_inst_mult_23_U31 ( .A(my_dp_mpy2_inst_mult_23_n52), .B(
        my_dp_mpy2_inst_mult_23_n47), .CI(my_dp_mpy2_inst_mult_23_n45), .CO(
        my_dp_mpy2_inst_mult_23_n42), .S(my_dp_mpy2_inst_mult_23_n43) );
  FA_X1 my_dp_mpy2_inst_mult_23_U30 ( .A(my_dp_mpy2_inst_mult_23_n104), .B(
        my_dp_mpy2_inst_mult_23_n289), .CI(my_dp_mpy2_inst_mult_23_n119), .CO(
        my_dp_mpy2_inst_mult_23_n40), .S(my_dp_mpy2_inst_mult_23_n41) );
  FA_X1 my_dp_mpy2_inst_mult_23_U29 ( .A(my_dp_mpy2_inst_mult_23_n279), .B(
        my_dp_mpy2_inst_mult_23_n111), .CI(my_dp_mpy2_inst_mult_23_n46), .CO(
        my_dp_mpy2_inst_mult_23_n38), .S(my_dp_mpy2_inst_mult_23_n39) );
  FA_X1 my_dp_mpy2_inst_mult_23_U28 ( .A(my_dp_mpy2_inst_mult_23_n44), .B(
        my_dp_mpy2_inst_mult_23_n41), .CI(my_dp_mpy2_inst_mult_23_n39), .CO(
        my_dp_mpy2_inst_mult_23_n36), .S(my_dp_mpy2_inst_mult_23_n37) );
  FA_X1 my_dp_mpy2_inst_mult_23_U26 ( .A(my_dp_mpy2_inst_mult_23_n118), .B(
        my_dp_mpy2_inst_mult_23_n35), .CI(my_dp_mpy2_inst_mult_23_n110), .CO(
        my_dp_mpy2_inst_mult_23_n32), .S(my_dp_mpy2_inst_mult_23_n33) );
  FA_X1 my_dp_mpy2_inst_mult_23_U25 ( .A(my_dp_mpy2_inst_mult_23_n33), .B(
        my_dp_mpy2_inst_mult_23_n40), .CI(my_dp_mpy2_inst_mult_23_n38), .CO(
        my_dp_mpy2_inst_mult_23_n30), .S(my_dp_mpy2_inst_mult_23_n31) );
  FA_X1 my_dp_mpy2_inst_mult_23_U24 ( .A(my_dp_mpy2_inst_mult_23_n103), .B(
        my_dp_mpy2_inst_mult_23_n286), .CI(my_dp_mpy2_inst_mult_23_n109), .CO(
        my_dp_mpy2_inst_mult_23_n28), .S(my_dp_mpy2_inst_mult_23_n29) );
  FA_X1 my_dp_mpy2_inst_mult_23_U23 ( .A(my_dp_mpy2_inst_mult_23_n32), .B(
        my_dp_mpy2_inst_mult_23_n280), .CI(my_dp_mpy2_inst_mult_23_n29), .CO(
        my_dp_mpy2_inst_mult_23_n26), .S(my_dp_mpy2_inst_mult_23_n27) );
  FA_X1 my_dp_mpy2_inst_mult_23_U21 ( .A(my_dp_mpy2_inst_mult_23_n108), .B(
        my_dp_mpy2_inst_mult_23_n25), .CI(my_dp_mpy2_inst_mult_23_n28), .CO(
        my_dp_mpy2_inst_mult_23_n22), .S(my_dp_mpy2_inst_mult_23_n23) );
  FA_X1 my_dp_mpy2_inst_mult_23_U20 ( .A(my_dp_mpy2_inst_mult_23_n102), .B(
        my_dp_mpy2_inst_mult_23_n283), .CI(my_dp_mpy2_inst_mult_23_n281), .CO(
        my_dp_mpy2_inst_mult_23_n20), .S(my_dp_mpy2_inst_mult_23_n21) );
  FA_X1 my_dp_mpy2_inst_mult_23_U8 ( .A(my_dp_mpy2_inst_mult_23_n37), .B(
        my_dp_mpy2_inst_mult_23_n42), .CI(my_dp_mpy2_inst_mult_23_n8), .CO(
        my_dp_mpy2_inst_mult_23_n7), .S(my_dp_mpy_2__3_) );
  FA_X1 my_dp_mpy2_inst_mult_23_U7 ( .A(my_dp_mpy2_inst_mult_23_n31), .B(
        my_dp_mpy2_inst_mult_23_n36), .CI(my_dp_mpy2_inst_mult_23_n7), .CO(
        my_dp_mpy2_inst_mult_23_n6), .S(my_dp_mpy_2__4_) );
  FA_X1 my_dp_mpy2_inst_mult_23_U6 ( .A(my_dp_mpy2_inst_mult_23_n27), .B(
        my_dp_mpy2_inst_mult_23_n30), .CI(my_dp_mpy2_inst_mult_23_n6), .CO(
        my_dp_mpy2_inst_mult_23_n5), .S(my_dp_mpy_2__5_) );
  FA_X1 my_dp_mpy2_inst_mult_23_U5 ( .A(my_dp_mpy2_inst_mult_23_n23), .B(
        my_dp_mpy2_inst_mult_23_n26), .CI(my_dp_mpy2_inst_mult_23_n5), .CO(
        my_dp_mpy2_inst_mult_23_n4), .S(my_dp_mpy_2__6_) );
  FA_X1 my_dp_mpy2_inst_mult_23_U4 ( .A(my_dp_mpy2_inst_mult_23_n22), .B(
        my_dp_mpy2_inst_mult_23_n21), .CI(my_dp_mpy2_inst_mult_23_n4), .CO(
        my_dp_mpy2_inst_mult_23_n3), .S(my_dp_mpy_2__7_) );
  FA_X1 my_dp_mpy2_inst_mult_23_U3 ( .A(my_dp_mpy2_inst_mult_23_n20), .B(
        my_dp_mpy2_inst_mult_23_n19), .CI(my_dp_mpy2_inst_mult_23_n3), .CO(
        my_dp_mpy2_inst_mult_23_n2), .S(my_dp_mpy_2__8_) );
  XOR2_X1 my_dp_mpy3_inst_mult_23_U358 ( .A(my_dp_coeff[17]), .B(
        my_dp_mpy3_inst_mult_23_n294), .Z(my_dp_mpy3_inst_mult_23_n331) );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U357 ( .A(my_dp_r1[7]), .B(my_dp_coeff[17]), 
        .ZN(my_dp_mpy3_inst_mult_23_n374) );
  NOR2_X1 my_dp_mpy3_inst_mult_23_U356 ( .A1(my_dp_mpy3_inst_mult_23_n331), 
        .A2(my_dp_mpy3_inst_mult_23_n374), .ZN(my_dp_mpy3_inst_mult_23_n102)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U355 ( .A(my_dp_r1[5]), .B(my_dp_coeff[17]), 
        .ZN(my_dp_mpy3_inst_mult_23_n373) );
  NOR2_X1 my_dp_mpy3_inst_mult_23_U354 ( .A1(my_dp_mpy3_inst_mult_23_n331), 
        .A2(my_dp_mpy3_inst_mult_23_n373), .ZN(my_dp_mpy3_inst_mult_23_n103)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U353 ( .A(my_dp_r1[3]), .B(my_dp_coeff[17]), 
        .ZN(my_dp_mpy3_inst_mult_23_n372) );
  NOR2_X1 my_dp_mpy3_inst_mult_23_U352 ( .A1(my_dp_mpy3_inst_mult_23_n331), 
        .A2(my_dp_mpy3_inst_mult_23_n372), .ZN(my_dp_mpy3_inst_mult_23_n104)
         );
  NOR2_X1 my_dp_mpy3_inst_mult_23_U351 ( .A1(my_dp_mpy3_inst_mult_23_n331), 
        .A2(my_dp_mpy3_inst_mult_23_n292), .ZN(my_dp_mpy3_inst_mult_23_n106)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U350 ( .A(my_dp_r1[8]), .B(my_dp_coeff[16]), 
        .ZN(my_dp_mpy3_inst_mult_23_n369) );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U349 ( .A(my_dp_mpy3_inst_mult_23_n294), 
        .B(my_dp_coeff[15]), .ZN(my_dp_mpy3_inst_mult_23_n371) );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U348 ( .A1(my_dp_mpy3_inst_mult_23_n307), 
        .A2(my_dp_mpy3_inst_mult_23_n371), .ZN(my_dp_mpy3_inst_mult_23_n305)
         );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U347 ( .A1(my_dp_mpy3_inst_mult_23_n369), 
        .A2(my_dp_mpy3_inst_mult_23_n307), .B1(my_dp_mpy3_inst_mult_23_n305), 
        .B2(my_dp_mpy3_inst_mult_23_n369), .ZN(my_dp_mpy3_inst_mult_23_n370)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U346 ( .A(my_dp_r1[7]), .B(my_dp_coeff[16]), 
        .ZN(my_dp_mpy3_inst_mult_23_n368) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U345 ( .A1(my_dp_mpy3_inst_mult_23_n368), 
        .A2(my_dp_mpy3_inst_mult_23_n305), .B1(my_dp_mpy3_inst_mult_23_n307), 
        .B2(my_dp_mpy3_inst_mult_23_n369), .ZN(my_dp_mpy3_inst_mult_23_n108)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U344 ( .A(my_dp_r1[6]), .B(my_dp_coeff[16]), 
        .ZN(my_dp_mpy3_inst_mult_23_n367) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U343 ( .A1(my_dp_mpy3_inst_mult_23_n367), 
        .A2(my_dp_mpy3_inst_mult_23_n305), .B1(my_dp_mpy3_inst_mult_23_n307), 
        .B2(my_dp_mpy3_inst_mult_23_n368), .ZN(my_dp_mpy3_inst_mult_23_n109)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U342 ( .A(my_dp_r1[5]), .B(my_dp_coeff[16]), 
        .ZN(my_dp_mpy3_inst_mult_23_n366) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U341 ( .A1(my_dp_mpy3_inst_mult_23_n366), 
        .A2(my_dp_mpy3_inst_mult_23_n305), .B1(my_dp_mpy3_inst_mult_23_n307), 
        .B2(my_dp_mpy3_inst_mult_23_n367), .ZN(my_dp_mpy3_inst_mult_23_n110)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U340 ( .A(my_dp_r1[4]), .B(my_dp_coeff[16]), 
        .ZN(my_dp_mpy3_inst_mult_23_n365) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U339 ( .A1(my_dp_mpy3_inst_mult_23_n365), 
        .A2(my_dp_mpy3_inst_mult_23_n305), .B1(my_dp_mpy3_inst_mult_23_n307), 
        .B2(my_dp_mpy3_inst_mult_23_n366), .ZN(my_dp_mpy3_inst_mult_23_n111)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U338 ( .A(my_dp_r1[3]), .B(my_dp_coeff[16]), 
        .ZN(my_dp_mpy3_inst_mult_23_n364) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U337 ( .A1(my_dp_mpy3_inst_mult_23_n364), 
        .A2(my_dp_mpy3_inst_mult_23_n305), .B1(my_dp_mpy3_inst_mult_23_n307), 
        .B2(my_dp_mpy3_inst_mult_23_n365), .ZN(my_dp_mpy3_inst_mult_23_n112)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U336 ( .A(my_dp_r1[2]), .B(my_dp_coeff[16]), 
        .ZN(my_dp_mpy3_inst_mult_23_n363) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U335 ( .A1(my_dp_mpy3_inst_mult_23_n363), 
        .A2(my_dp_mpy3_inst_mult_23_n305), .B1(my_dp_mpy3_inst_mult_23_n307), 
        .B2(my_dp_mpy3_inst_mult_23_n364), .ZN(my_dp_mpy3_inst_mult_23_n113)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U334 ( .A(my_dp_r1[1]), .B(my_dp_coeff[16]), 
        .ZN(my_dp_mpy3_inst_mult_23_n362) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U333 ( .A1(my_dp_mpy3_inst_mult_23_n362), 
        .A2(my_dp_mpy3_inst_mult_23_n305), .B1(my_dp_mpy3_inst_mult_23_n307), 
        .B2(my_dp_mpy3_inst_mult_23_n363), .ZN(my_dp_mpy3_inst_mult_23_n114)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U332 ( .A(my_dp_coeff[16]), .B(my_dp_r1[0]), 
        .ZN(my_dp_mpy3_inst_mult_23_n361) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U331 ( .A1(my_dp_mpy3_inst_mult_23_n361), 
        .A2(my_dp_mpy3_inst_mult_23_n305), .B1(my_dp_mpy3_inst_mult_23_n307), 
        .B2(my_dp_mpy3_inst_mult_23_n362), .ZN(my_dp_mpy3_inst_mult_23_n115)
         );
  NOR2_X1 my_dp_mpy3_inst_mult_23_U330 ( .A1(my_dp_mpy3_inst_mult_23_n307), 
        .A2(my_dp_mpy3_inst_mult_23_n292), .ZN(my_dp_mpy3_inst_mult_23_n116)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U329 ( .A(my_dp_r1[8]), .B(my_dp_coeff[14]), 
        .ZN(my_dp_mpy3_inst_mult_23_n358) );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U328 ( .A(my_dp_mpy3_inst_mult_23_n295), 
        .B(my_dp_coeff[13]), .ZN(my_dp_mpy3_inst_mult_23_n360) );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U327 ( .A1(my_dp_mpy3_inst_mult_23_n304), 
        .A2(my_dp_mpy3_inst_mult_23_n360), .ZN(my_dp_mpy3_inst_mult_23_n302)
         );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U326 ( .A1(my_dp_mpy3_inst_mult_23_n358), 
        .A2(my_dp_mpy3_inst_mult_23_n304), .B1(my_dp_mpy3_inst_mult_23_n302), 
        .B2(my_dp_mpy3_inst_mult_23_n358), .ZN(my_dp_mpy3_inst_mult_23_n359)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U325 ( .A(my_dp_r1[7]), .B(my_dp_coeff[14]), 
        .ZN(my_dp_mpy3_inst_mult_23_n357) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U324 ( .A1(my_dp_mpy3_inst_mult_23_n357), 
        .A2(my_dp_mpy3_inst_mult_23_n302), .B1(my_dp_mpy3_inst_mult_23_n304), 
        .B2(my_dp_mpy3_inst_mult_23_n358), .ZN(my_dp_mpy3_inst_mult_23_n118)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U323 ( .A(my_dp_r1[6]), .B(my_dp_coeff[14]), 
        .ZN(my_dp_mpy3_inst_mult_23_n356) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U322 ( .A1(my_dp_mpy3_inst_mult_23_n356), 
        .A2(my_dp_mpy3_inst_mult_23_n302), .B1(my_dp_mpy3_inst_mult_23_n304), 
        .B2(my_dp_mpy3_inst_mult_23_n357), .ZN(my_dp_mpy3_inst_mult_23_n119)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U321 ( .A(my_dp_r1[5]), .B(my_dp_coeff[14]), 
        .ZN(my_dp_mpy3_inst_mult_23_n355) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U320 ( .A1(my_dp_mpy3_inst_mult_23_n355), 
        .A2(my_dp_mpy3_inst_mult_23_n302), .B1(my_dp_mpy3_inst_mult_23_n304), 
        .B2(my_dp_mpy3_inst_mult_23_n356), .ZN(my_dp_mpy3_inst_mult_23_n120)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U319 ( .A(my_dp_r1[4]), .B(my_dp_coeff[14]), 
        .ZN(my_dp_mpy3_inst_mult_23_n354) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U318 ( .A1(my_dp_mpy3_inst_mult_23_n354), 
        .A2(my_dp_mpy3_inst_mult_23_n302), .B1(my_dp_mpy3_inst_mult_23_n304), 
        .B2(my_dp_mpy3_inst_mult_23_n355), .ZN(my_dp_mpy3_inst_mult_23_n121)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U317 ( .A(my_dp_r1[3]), .B(my_dp_coeff[14]), 
        .ZN(my_dp_mpy3_inst_mult_23_n353) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U316 ( .A1(my_dp_mpy3_inst_mult_23_n353), 
        .A2(my_dp_mpy3_inst_mult_23_n302), .B1(my_dp_mpy3_inst_mult_23_n304), 
        .B2(my_dp_mpy3_inst_mult_23_n354), .ZN(my_dp_mpy3_inst_mult_23_n122)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U315 ( .A(my_dp_r1[2]), .B(my_dp_coeff[14]), 
        .ZN(my_dp_mpy3_inst_mult_23_n352) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U314 ( .A1(my_dp_mpy3_inst_mult_23_n352), 
        .A2(my_dp_mpy3_inst_mult_23_n302), .B1(my_dp_mpy3_inst_mult_23_n304), 
        .B2(my_dp_mpy3_inst_mult_23_n353), .ZN(my_dp_mpy3_inst_mult_23_n123)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U313 ( .A(my_dp_r1[1]), .B(my_dp_coeff[14]), 
        .ZN(my_dp_mpy3_inst_mult_23_n351) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U312 ( .A1(my_dp_mpy3_inst_mult_23_n351), 
        .A2(my_dp_mpy3_inst_mult_23_n302), .B1(my_dp_mpy3_inst_mult_23_n304), 
        .B2(my_dp_mpy3_inst_mult_23_n352), .ZN(my_dp_mpy3_inst_mult_23_n124)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U311 ( .A(my_dp_coeff[14]), .B(my_dp_r1[0]), 
        .ZN(my_dp_mpy3_inst_mult_23_n350) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U310 ( .A1(my_dp_mpy3_inst_mult_23_n350), 
        .A2(my_dp_mpy3_inst_mult_23_n302), .B1(my_dp_mpy3_inst_mult_23_n304), 
        .B2(my_dp_mpy3_inst_mult_23_n351), .ZN(my_dp_mpy3_inst_mult_23_n125)
         );
  NOR2_X1 my_dp_mpy3_inst_mult_23_U309 ( .A1(my_dp_mpy3_inst_mult_23_n304), 
        .A2(my_dp_mpy3_inst_mult_23_n292), .ZN(my_dp_mpy3_inst_mult_23_n126)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U308 ( .A(my_dp_r1[8]), .B(my_dp_coeff[12]), 
        .ZN(my_dp_mpy3_inst_mult_23_n347) );
  XOR2_X1 my_dp_mpy3_inst_mult_23_U307 ( .A(my_dp_coeff[11]), .B(
        my_dp_coeff[10]), .Z(my_dp_mpy3_inst_mult_23_n318) );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U306 ( .A(my_dp_mpy3_inst_mult_23_n296), 
        .B(my_dp_coeff[11]), .ZN(my_dp_mpy3_inst_mult_23_n349) );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U305 ( .A1(my_dp_mpy3_inst_mult_23_n297), 
        .A2(my_dp_mpy3_inst_mult_23_n349), .ZN(my_dp_mpy3_inst_mult_23_n316)
         );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U304 ( .A1(my_dp_mpy3_inst_mult_23_n347), 
        .A2(my_dp_mpy3_inst_mult_23_n297), .B1(my_dp_mpy3_inst_mult_23_n316), 
        .B2(my_dp_mpy3_inst_mult_23_n347), .ZN(my_dp_mpy3_inst_mult_23_n348)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U303 ( .A(my_dp_r1[7]), .B(my_dp_coeff[12]), 
        .ZN(my_dp_mpy3_inst_mult_23_n346) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U302 ( .A1(my_dp_mpy3_inst_mult_23_n346), 
        .A2(my_dp_mpy3_inst_mult_23_n316), .B1(my_dp_mpy3_inst_mult_23_n297), 
        .B2(my_dp_mpy3_inst_mult_23_n347), .ZN(my_dp_mpy3_inst_mult_23_n128)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U301 ( .A(my_dp_r1[6]), .B(my_dp_coeff[12]), 
        .ZN(my_dp_mpy3_inst_mult_23_n345) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U300 ( .A1(my_dp_mpy3_inst_mult_23_n345), 
        .A2(my_dp_mpy3_inst_mult_23_n316), .B1(my_dp_mpy3_inst_mult_23_n297), 
        .B2(my_dp_mpy3_inst_mult_23_n346), .ZN(my_dp_mpy3_inst_mult_23_n129)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U299 ( .A(my_dp_r1[5]), .B(my_dp_coeff[12]), 
        .ZN(my_dp_mpy3_inst_mult_23_n344) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U298 ( .A1(my_dp_mpy3_inst_mult_23_n344), 
        .A2(my_dp_mpy3_inst_mult_23_n316), .B1(my_dp_mpy3_inst_mult_23_n297), 
        .B2(my_dp_mpy3_inst_mult_23_n345), .ZN(my_dp_mpy3_inst_mult_23_n130)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U297 ( .A(my_dp_r1[4]), .B(my_dp_coeff[12]), 
        .ZN(my_dp_mpy3_inst_mult_23_n343) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U296 ( .A1(my_dp_mpy3_inst_mult_23_n343), 
        .A2(my_dp_mpy3_inst_mult_23_n316), .B1(my_dp_mpy3_inst_mult_23_n297), 
        .B2(my_dp_mpy3_inst_mult_23_n344), .ZN(my_dp_mpy3_inst_mult_23_n131)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U295 ( .A(my_dp_r1[3]), .B(my_dp_coeff[12]), 
        .ZN(my_dp_mpy3_inst_mult_23_n342) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U294 ( .A1(my_dp_mpy3_inst_mult_23_n342), 
        .A2(my_dp_mpy3_inst_mult_23_n316), .B1(my_dp_mpy3_inst_mult_23_n297), 
        .B2(my_dp_mpy3_inst_mult_23_n343), .ZN(my_dp_mpy3_inst_mult_23_n132)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U293 ( .A(my_dp_r1[2]), .B(my_dp_coeff[12]), 
        .ZN(my_dp_mpy3_inst_mult_23_n341) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U292 ( .A1(my_dp_mpy3_inst_mult_23_n341), 
        .A2(my_dp_mpy3_inst_mult_23_n316), .B1(my_dp_mpy3_inst_mult_23_n297), 
        .B2(my_dp_mpy3_inst_mult_23_n342), .ZN(my_dp_mpy3_inst_mult_23_n133)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U291 ( .A(my_dp_r1[1]), .B(my_dp_coeff[12]), 
        .ZN(my_dp_mpy3_inst_mult_23_n340) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U290 ( .A1(my_dp_mpy3_inst_mult_23_n340), 
        .A2(my_dp_mpy3_inst_mult_23_n316), .B1(my_dp_mpy3_inst_mult_23_n297), 
        .B2(my_dp_mpy3_inst_mult_23_n341), .ZN(my_dp_mpy3_inst_mult_23_n134)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U289 ( .A(my_dp_coeff[12]), .B(my_dp_r1[0]), 
        .ZN(my_dp_mpy3_inst_mult_23_n339) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U288 ( .A1(my_dp_mpy3_inst_mult_23_n339), 
        .A2(my_dp_mpy3_inst_mult_23_n316), .B1(my_dp_mpy3_inst_mult_23_n297), 
        .B2(my_dp_mpy3_inst_mult_23_n340), .ZN(my_dp_mpy3_inst_mult_23_n135)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U287 ( .A(my_dp_r1[8]), .B(my_dp_coeff[10]), 
        .ZN(my_dp_mpy3_inst_mult_23_n337) );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U286 ( .A1(my_dp_coeff[10]), .A2(
        my_dp_mpy3_inst_mult_23_n298), .ZN(my_dp_mpy3_inst_mult_23_n323) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U285 ( .A1(my_dp_mpy3_inst_mult_23_n298), 
        .A2(my_dp_mpy3_inst_mult_23_n337), .B1(my_dp_mpy3_inst_mult_23_n323), 
        .B2(my_dp_mpy3_inst_mult_23_n337), .ZN(my_dp_mpy3_inst_mult_23_n338)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U284 ( .A(my_dp_r1[7]), .B(my_dp_coeff[10]), 
        .ZN(my_dp_mpy3_inst_mult_23_n336) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U283 ( .A1(my_dp_mpy3_inst_mult_23_n336), 
        .A2(my_dp_mpy3_inst_mult_23_n323), .B1(my_dp_mpy3_inst_mult_23_n337), 
        .B2(my_dp_mpy3_inst_mult_23_n298), .ZN(my_dp_mpy3_inst_mult_23_n138)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U282 ( .A(my_dp_r1[6]), .B(my_dp_coeff[10]), 
        .ZN(my_dp_mpy3_inst_mult_23_n335) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U281 ( .A1(my_dp_mpy3_inst_mult_23_n335), 
        .A2(my_dp_mpy3_inst_mult_23_n323), .B1(my_dp_mpy3_inst_mult_23_n336), 
        .B2(my_dp_mpy3_inst_mult_23_n298), .ZN(my_dp_mpy3_inst_mult_23_n139)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U280 ( .A(my_dp_r1[5]), .B(my_dp_coeff[10]), 
        .ZN(my_dp_mpy3_inst_mult_23_n334) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U279 ( .A1(my_dp_mpy3_inst_mult_23_n334), 
        .A2(my_dp_mpy3_inst_mult_23_n323), .B1(my_dp_mpy3_inst_mult_23_n335), 
        .B2(my_dp_mpy3_inst_mult_23_n298), .ZN(my_dp_mpy3_inst_mult_23_n140)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U278 ( .A(my_dp_r1[4]), .B(my_dp_coeff[10]), 
        .ZN(my_dp_mpy3_inst_mult_23_n333) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U277 ( .A1(my_dp_mpy3_inst_mult_23_n333), 
        .A2(my_dp_mpy3_inst_mult_23_n323), .B1(my_dp_mpy3_inst_mult_23_n334), 
        .B2(my_dp_mpy3_inst_mult_23_n298), .ZN(my_dp_mpy3_inst_mult_23_n141)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U276 ( .A(my_dp_r1[3]), .B(my_dp_coeff[10]), 
        .ZN(my_dp_mpy3_inst_mult_23_n332) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U275 ( .A1(my_dp_mpy3_inst_mult_23_n332), 
        .A2(my_dp_mpy3_inst_mult_23_n323), .B1(my_dp_mpy3_inst_mult_23_n333), 
        .B2(my_dp_mpy3_inst_mult_23_n298), .ZN(my_dp_mpy3_inst_mult_23_n142)
         );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U274 ( .A(my_dp_r1[2]), .B(my_dp_coeff[10]), 
        .ZN(my_dp_mpy3_inst_mult_23_n324) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U273 ( .A1(my_dp_mpy3_inst_mult_23_n324), 
        .A2(my_dp_mpy3_inst_mult_23_n323), .B1(my_dp_mpy3_inst_mult_23_n332), 
        .B2(my_dp_mpy3_inst_mult_23_n298), .ZN(my_dp_mpy3_inst_mult_23_n143)
         );
  XOR2_X1 my_dp_mpy3_inst_mult_23_U272 ( .A(my_dp_r1[8]), .B(my_dp_coeff[17]), 
        .Z(my_dp_mpy3_inst_mult_23_n301) );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U271 ( .A1(my_dp_mpy3_inst_mult_23_n301), 
        .A2(my_dp_mpy3_inst_mult_23_n293), .ZN(my_dp_mpy3_inst_mult_23_n19) );
  XOR2_X1 my_dp_mpy3_inst_mult_23_U270 ( .A(my_dp_r1[6]), .B(my_dp_coeff[17]), 
        .Z(my_dp_mpy3_inst_mult_23_n330) );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U269 ( .A1(my_dp_mpy3_inst_mult_23_n330), 
        .A2(my_dp_mpy3_inst_mult_23_n293), .ZN(my_dp_mpy3_inst_mult_23_n25) );
  XOR2_X1 my_dp_mpy3_inst_mult_23_U268 ( .A(my_dp_r1[4]), .B(my_dp_coeff[17]), 
        .Z(my_dp_mpy3_inst_mult_23_n329) );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U267 ( .A1(my_dp_mpy3_inst_mult_23_n329), 
        .A2(my_dp_mpy3_inst_mult_23_n293), .ZN(my_dp_mpy3_inst_mult_23_n35) );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U266 ( .A1(my_dp_mpy3_inst_mult_23_n328), 
        .A2(my_dp_mpy3_inst_mult_23_n293), .ZN(my_dp_mpy3_inst_mult_23_n49) );
  NAND3_X1 my_dp_mpy3_inst_mult_23_U265 ( .A1(my_dp_mpy3_inst_mult_23_n293), 
        .A2(my_dp_mpy3_inst_mult_23_n292), .A3(my_dp_coeff[17]), .ZN(
        my_dp_mpy3_inst_mult_23_n325) );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U264 ( .A(my_dp_mpy3_inst_mult_23_n291), 
        .B(my_dp_coeff[17]), .ZN(my_dp_mpy3_inst_mult_23_n327) );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U263 ( .A1(my_dp_mpy3_inst_mult_23_n327), 
        .A2(my_dp_mpy3_inst_mult_23_n293), .ZN(my_dp_mpy3_inst_mult_23_n326)
         );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U262 ( .A1(my_dp_mpy3_inst_mult_23_n325), 
        .A2(my_dp_mpy3_inst_mult_23_n326), .ZN(my_dp_mpy3_inst_mult_23_n56) );
  XNOR2_X1 my_dp_mpy3_inst_mult_23_U261 ( .A(my_dp_mpy3_inst_mult_23_n325), 
        .B(my_dp_mpy3_inst_mult_23_n326), .ZN(my_dp_mpy3_inst_mult_23_n57) );
  OAI22_X1 my_dp_mpy3_inst_mult_23_U260 ( .A1(my_dp_r1[1]), .A2(
        my_dp_mpy3_inst_mult_23_n323), .B1(my_dp_mpy3_inst_mult_23_n324), .B2(
        my_dp_mpy3_inst_mult_23_n298), .ZN(my_dp_mpy3_inst_mult_23_n322) );
  NAND2_X1 my_dp_mpy3_inst_mult_23_U259 ( .A1(my_dp_mpy3_inst_mult_23_n318), 
        .A2(my_dp_mpy3_inst_mult_23_n322), .ZN(my_dp_mpy3_inst_mult_23_n320)
         );
  NAND3_X1 my_dp_mpy3_inst_mult_23_U258 ( .A1(my_dp_mpy3_inst_mult_23_n322), 
        .A2(my_dp_mpy3_inst_mult_23_n291), .A3(my_dp_coeff[10]), .ZN(
        my_dp_mpy3_inst_mult_23_n321) );
  MUX2_X1 my_dp_mpy3_inst_mult_23_U257 ( .A(my_dp_mpy3_inst_mult_23_n320), .B(
        my_dp_mpy3_inst_mult_23_n321), .S(my_dp_mpy3_inst_mult_23_n292), .Z(
        my_dp_mpy3_inst_mult_23_n319) );
  NAND3_X1 my_dp_mpy3_inst_mult_23_U256 ( .A1(my_dp_mpy3_inst_mult_23_n318), 
        .A2(my_dp_mpy3_inst_mult_23_n292), .A3(my_dp_coeff[12]), .ZN(
        my_dp_mpy3_inst_mult_23_n317) );
  OAI21_X1 my_dp_mpy3_inst_mult_23_U255 ( .B1(my_dp_mpy3_inst_mult_23_n296), 
        .B2(my_dp_mpy3_inst_mult_23_n316), .A(my_dp_mpy3_inst_mult_23_n317), 
        .ZN(my_dp_mpy3_inst_mult_23_n315) );
  AOI222_X1 my_dp_mpy3_inst_mult_23_U254 ( .A1(my_dp_mpy3_inst_mult_23_n290), 
        .A2(my_dp_mpy3_inst_mult_23_n81), .B1(my_dp_mpy3_inst_mult_23_n315), 
        .B2(my_dp_mpy3_inst_mult_23_n290), .C1(my_dp_mpy3_inst_mult_23_n315), 
        .C2(my_dp_mpy3_inst_mult_23_n81), .ZN(my_dp_mpy3_inst_mult_23_n314) );
  AOI222_X1 my_dp_mpy3_inst_mult_23_U253 ( .A1(my_dp_mpy3_inst_mult_23_n288), 
        .A2(my_dp_mpy3_inst_mult_23_n79), .B1(my_dp_mpy3_inst_mult_23_n288), 
        .B2(my_dp_mpy3_inst_mult_23_n80), .C1(my_dp_mpy3_inst_mult_23_n80), 
        .C2(my_dp_mpy3_inst_mult_23_n79), .ZN(my_dp_mpy3_inst_mult_23_n313) );
  AOI222_X1 my_dp_mpy3_inst_mult_23_U252 ( .A1(my_dp_mpy3_inst_mult_23_n287), 
        .A2(my_dp_mpy3_inst_mult_23_n75), .B1(my_dp_mpy3_inst_mult_23_n287), 
        .B2(my_dp_mpy3_inst_mult_23_n78), .C1(my_dp_mpy3_inst_mult_23_n78), 
        .C2(my_dp_mpy3_inst_mult_23_n75), .ZN(my_dp_mpy3_inst_mult_23_n312) );
  AOI222_X1 my_dp_mpy3_inst_mult_23_U251 ( .A1(my_dp_mpy3_inst_mult_23_n285), 
        .A2(my_dp_mpy3_inst_mult_23_n71), .B1(my_dp_mpy3_inst_mult_23_n285), 
        .B2(my_dp_mpy3_inst_mult_23_n74), .C1(my_dp_mpy3_inst_mult_23_n74), 
        .C2(my_dp_mpy3_inst_mult_23_n71), .ZN(my_dp_mpy3_inst_mult_23_n311) );
  AOI222_X1 my_dp_mpy3_inst_mult_23_U250 ( .A1(my_dp_mpy3_inst_mult_23_n284), 
        .A2(my_dp_mpy3_inst_mult_23_n65), .B1(my_dp_mpy3_inst_mult_23_n284), 
        .B2(my_dp_mpy3_inst_mult_23_n70), .C1(my_dp_mpy3_inst_mult_23_n70), 
        .C2(my_dp_mpy3_inst_mult_23_n65), .ZN(my_dp_mpy3_inst_mult_23_n310) );
  OAI222_X1 my_dp_mpy3_inst_mult_23_U249 ( .A1(my_dp_mpy3_inst_mult_23_n310), 
        .A2(my_dp_mpy3_inst_mult_23_n278), .B1(my_dp_mpy3_inst_mult_23_n310), 
        .B2(my_dp_mpy3_inst_mult_23_n282), .C1(my_dp_mpy3_inst_mult_23_n282), 
        .C2(my_dp_mpy3_inst_mult_23_n278), .ZN(my_dp_mpy3_inst_mult_23_n309)
         );
  AOI222_X1 my_dp_mpy3_inst_mult_23_U248 ( .A1(my_dp_mpy3_inst_mult_23_n309), 
        .A2(my_dp_mpy3_inst_mult_23_n51), .B1(my_dp_mpy3_inst_mult_23_n309), 
        .B2(my_dp_mpy3_inst_mult_23_n58), .C1(my_dp_mpy3_inst_mult_23_n58), 
        .C2(my_dp_mpy3_inst_mult_23_n51), .ZN(my_dp_mpy3_inst_mult_23_n308) );
  OAI222_X1 my_dp_mpy3_inst_mult_23_U247 ( .A1(my_dp_mpy3_inst_mult_23_n308), 
        .A2(my_dp_mpy3_inst_mult_23_n275), .B1(my_dp_mpy3_inst_mult_23_n308), 
        .B2(my_dp_mpy3_inst_mult_23_n276), .C1(my_dp_mpy3_inst_mult_23_n276), 
        .C2(my_dp_mpy3_inst_mult_23_n275), .ZN(my_dp_mpy3_inst_mult_23_n8) );
  OR3_X1 my_dp_mpy3_inst_mult_23_U246 ( .A1(my_dp_mpy3_inst_mult_23_n307), 
        .A2(my_dp_r1[0]), .A3(my_dp_mpy3_inst_mult_23_n294), .ZN(
        my_dp_mpy3_inst_mult_23_n306) );
  OAI21_X1 my_dp_mpy3_inst_mult_23_U245 ( .B1(my_dp_mpy3_inst_mult_23_n294), 
        .B2(my_dp_mpy3_inst_mult_23_n305), .A(my_dp_mpy3_inst_mult_23_n306), 
        .ZN(my_dp_mpy3_inst_mult_23_n97) );
  OR3_X1 my_dp_mpy3_inst_mult_23_U244 ( .A1(my_dp_mpy3_inst_mult_23_n304), 
        .A2(my_dp_r1[0]), .A3(my_dp_mpy3_inst_mult_23_n295), .ZN(
        my_dp_mpy3_inst_mult_23_n303) );
  OAI21_X1 my_dp_mpy3_inst_mult_23_U243 ( .B1(my_dp_mpy3_inst_mult_23_n295), 
        .B2(my_dp_mpy3_inst_mult_23_n302), .A(my_dp_mpy3_inst_mult_23_n303), 
        .ZN(my_dp_mpy3_inst_mult_23_n98) );
  NOR2_X1 my_dp_mpy3_inst_mult_23_U242 ( .A1(my_dp_mpy3_inst_mult_23_n298), 
        .A2(my_dp_mpy3_inst_mult_23_n292), .ZN(my_dp_mpy3_inst_outc_0_) );
  XOR2_X1 my_dp_mpy3_inst_mult_23_U241 ( .A(my_dp_mpy3_inst_mult_23_n19), .B(
        my_dp_mpy3_inst_mult_23_n2), .Z(my_dp_mpy3_inst_mult_23_n299) );
  AND2_X1 my_dp_mpy3_inst_mult_23_U240 ( .A1(my_dp_mpy3_inst_mult_23_n293), 
        .A2(my_dp_mpy3_inst_mult_23_n301), .ZN(my_dp_mpy3_inst_mult_23_n300)
         );
  XOR2_X1 my_dp_mpy3_inst_mult_23_U239 ( .A(my_dp_mpy3_inst_mult_23_n299), .B(
        my_dp_mpy3_inst_mult_23_n300), .Z(my_dp_mpy3_inst_outc_17_) );
  XOR2_X1 my_dp_mpy3_inst_mult_23_U238 ( .A(my_dp_r1[2]), .B(my_dp_coeff[17]), 
        .Z(my_dp_mpy3_inst_mult_23_n328) );
  INV_X1 my_dp_mpy3_inst_mult_23_U237 ( .A(my_dp_coeff[16]), .ZN(
        my_dp_mpy3_inst_mult_23_n294) );
  XOR2_X1 my_dp_mpy3_inst_mult_23_U236 ( .A(my_dp_coeff[15]), .B(
        my_dp_mpy3_inst_mult_23_n295), .Z(my_dp_mpy3_inst_mult_23_n307) );
  INV_X1 my_dp_mpy3_inst_mult_23_U235 ( .A(my_dp_r1[1]), .ZN(
        my_dp_mpy3_inst_mult_23_n291) );
  INV_X1 my_dp_mpy3_inst_mult_23_U234 ( .A(my_dp_r1[0]), .ZN(
        my_dp_mpy3_inst_mult_23_n292) );
  INV_X1 my_dp_mpy3_inst_mult_23_U233 ( .A(my_dp_coeff[14]), .ZN(
        my_dp_mpy3_inst_mult_23_n295) );
  INV_X1 my_dp_mpy3_inst_mult_23_U232 ( .A(my_dp_coeff[9]), .ZN(
        my_dp_mpy3_inst_mult_23_n298) );
  XOR2_X1 my_dp_mpy3_inst_mult_23_U231 ( .A(my_dp_coeff[13]), .B(
        my_dp_mpy3_inst_mult_23_n296), .Z(my_dp_mpy3_inst_mult_23_n304) );
  INV_X1 my_dp_mpy3_inst_mult_23_U230 ( .A(my_dp_coeff[12]), .ZN(
        my_dp_mpy3_inst_mult_23_n296) );
  INV_X1 my_dp_mpy3_inst_mult_23_U229 ( .A(my_dp_mpy3_inst_mult_23_n370), .ZN(
        my_dp_mpy3_inst_mult_23_n281) );
  INV_X1 my_dp_mpy3_inst_mult_23_U228 ( .A(my_dp_mpy3_inst_mult_23_n25), .ZN(
        my_dp_mpy3_inst_mult_23_n283) );
  INV_X1 my_dp_mpy3_inst_mult_23_U227 ( .A(my_dp_mpy3_inst_mult_23_n35), .ZN(
        my_dp_mpy3_inst_mult_23_n286) );
  INV_X1 my_dp_mpy3_inst_mult_23_U226 ( .A(my_dp_mpy3_inst_mult_23_n359), .ZN(
        my_dp_mpy3_inst_mult_23_n280) );
  INV_X1 my_dp_mpy3_inst_mult_23_U225 ( .A(my_dp_mpy3_inst_mult_23_n49), .ZN(
        my_dp_mpy3_inst_mult_23_n289) );
  INV_X1 my_dp_mpy3_inst_mult_23_U224 ( .A(my_dp_mpy3_inst_mult_23_n348), .ZN(
        my_dp_mpy3_inst_mult_23_n279) );
  INV_X1 my_dp_mpy3_inst_mult_23_U223 ( .A(my_dp_mpy3_inst_mult_23_n331), .ZN(
        my_dp_mpy3_inst_mult_23_n293) );
  INV_X1 my_dp_mpy3_inst_mult_23_U222 ( .A(my_dp_mpy3_inst_mult_23_n338), .ZN(
        my_dp_mpy3_inst_mult_23_n277) );
  INV_X1 my_dp_mpy3_inst_mult_23_U221 ( .A(my_dp_mpy3_inst_mult_23_n313), .ZN(
        my_dp_mpy3_inst_mult_23_n287) );
  INV_X1 my_dp_mpy3_inst_mult_23_U220 ( .A(my_dp_mpy3_inst_mult_23_n312), .ZN(
        my_dp_mpy3_inst_mult_23_n285) );
  INV_X1 my_dp_mpy3_inst_mult_23_U219 ( .A(my_dp_mpy3_inst_mult_23_n318), .ZN(
        my_dp_mpy3_inst_mult_23_n297) );
  INV_X1 my_dp_mpy3_inst_mult_23_U218 ( .A(my_dp_mpy3_inst_mult_23_n319), .ZN(
        my_dp_mpy3_inst_mult_23_n290) );
  INV_X1 my_dp_mpy3_inst_mult_23_U217 ( .A(my_dp_mpy3_inst_mult_23_n314), .ZN(
        my_dp_mpy3_inst_mult_23_n288) );
  INV_X1 my_dp_mpy3_inst_mult_23_U216 ( .A(my_dp_mpy3_inst_mult_23_n311), .ZN(
        my_dp_mpy3_inst_mult_23_n284) );
  INV_X1 my_dp_mpy3_inst_mult_23_U215 ( .A(my_dp_mpy3_inst_mult_23_n59), .ZN(
        my_dp_mpy3_inst_mult_23_n278) );
  INV_X1 my_dp_mpy3_inst_mult_23_U214 ( .A(my_dp_mpy3_inst_mult_23_n64), .ZN(
        my_dp_mpy3_inst_mult_23_n282) );
  INV_X1 my_dp_mpy3_inst_mult_23_U213 ( .A(my_dp_mpy3_inst_mult_23_n43), .ZN(
        my_dp_mpy3_inst_mult_23_n275) );
  INV_X1 my_dp_mpy3_inst_mult_23_U212 ( .A(my_dp_mpy3_inst_mult_23_n50), .ZN(
        my_dp_mpy3_inst_mult_23_n276) );
  HA_X1 my_dp_mpy3_inst_mult_23_U51 ( .A(my_dp_mpy3_inst_mult_23_n135), .B(
        my_dp_mpy3_inst_mult_23_n143), .CO(my_dp_mpy3_inst_mult_23_n80), .S(
        my_dp_mpy3_inst_mult_23_n81) );
  FA_X1 my_dp_mpy3_inst_mult_23_U50 ( .A(my_dp_mpy3_inst_mult_23_n142), .B(
        my_dp_mpy3_inst_mult_23_n126), .CI(my_dp_mpy3_inst_mult_23_n134), .CO(
        my_dp_mpy3_inst_mult_23_n78), .S(my_dp_mpy3_inst_mult_23_n79) );
  HA_X1 my_dp_mpy3_inst_mult_23_U49 ( .A(my_dp_mpy3_inst_mult_23_n98), .B(
        my_dp_mpy3_inst_mult_23_n125), .CO(my_dp_mpy3_inst_mult_23_n76), .S(
        my_dp_mpy3_inst_mult_23_n77) );
  FA_X1 my_dp_mpy3_inst_mult_23_U48 ( .A(my_dp_mpy3_inst_mult_23_n133), .B(
        my_dp_mpy3_inst_mult_23_n141), .CI(my_dp_mpy3_inst_mult_23_n77), .CO(
        my_dp_mpy3_inst_mult_23_n74), .S(my_dp_mpy3_inst_mult_23_n75) );
  FA_X1 my_dp_mpy3_inst_mult_23_U47 ( .A(my_dp_mpy3_inst_mult_23_n140), .B(
        my_dp_mpy3_inst_mult_23_n116), .CI(my_dp_mpy3_inst_mult_23_n132), .CO(
        my_dp_mpy3_inst_mult_23_n72), .S(my_dp_mpy3_inst_mult_23_n73) );
  FA_X1 my_dp_mpy3_inst_mult_23_U46 ( .A(my_dp_mpy3_inst_mult_23_n76), .B(
        my_dp_mpy3_inst_mult_23_n124), .CI(my_dp_mpy3_inst_mult_23_n73), .CO(
        my_dp_mpy3_inst_mult_23_n70), .S(my_dp_mpy3_inst_mult_23_n71) );
  HA_X1 my_dp_mpy3_inst_mult_23_U45 ( .A(my_dp_mpy3_inst_mult_23_n97), .B(
        my_dp_mpy3_inst_mult_23_n115), .CO(my_dp_mpy3_inst_mult_23_n68), .S(
        my_dp_mpy3_inst_mult_23_n69) );
  FA_X1 my_dp_mpy3_inst_mult_23_U44 ( .A(my_dp_mpy3_inst_mult_23_n123), .B(
        my_dp_mpy3_inst_mult_23_n139), .CI(my_dp_mpy3_inst_mult_23_n131), .CO(
        my_dp_mpy3_inst_mult_23_n66), .S(my_dp_mpy3_inst_mult_23_n67) );
  FA_X1 my_dp_mpy3_inst_mult_23_U43 ( .A(my_dp_mpy3_inst_mult_23_n72), .B(
        my_dp_mpy3_inst_mult_23_n69), .CI(my_dp_mpy3_inst_mult_23_n67), .CO(
        my_dp_mpy3_inst_mult_23_n64), .S(my_dp_mpy3_inst_mult_23_n65) );
  FA_X1 my_dp_mpy3_inst_mult_23_U42 ( .A(my_dp_mpy3_inst_mult_23_n122), .B(
        my_dp_mpy3_inst_mult_23_n106), .CI(my_dp_mpy3_inst_mult_23_n138), .CO(
        my_dp_mpy3_inst_mult_23_n62), .S(my_dp_mpy3_inst_mult_23_n63) );
  FA_X1 my_dp_mpy3_inst_mult_23_U41 ( .A(my_dp_mpy3_inst_mult_23_n114), .B(
        my_dp_mpy3_inst_mult_23_n130), .CI(my_dp_mpy3_inst_mult_23_n68), .CO(
        my_dp_mpy3_inst_mult_23_n60), .S(my_dp_mpy3_inst_mult_23_n61) );
  FA_X1 my_dp_mpy3_inst_mult_23_U40 ( .A(my_dp_mpy3_inst_mult_23_n63), .B(
        my_dp_mpy3_inst_mult_23_n66), .CI(my_dp_mpy3_inst_mult_23_n61), .CO(
        my_dp_mpy3_inst_mult_23_n58), .S(my_dp_mpy3_inst_mult_23_n59) );
  FA_X1 my_dp_mpy3_inst_mult_23_U37 ( .A(my_dp_mpy3_inst_mult_23_n113), .B(
        my_dp_mpy3_inst_mult_23_n121), .CI(my_dp_mpy3_inst_mult_23_n277), .CO(
        my_dp_mpy3_inst_mult_23_n54), .S(my_dp_mpy3_inst_mult_23_n55) );
  FA_X1 my_dp_mpy3_inst_mult_23_U36 ( .A(my_dp_mpy3_inst_mult_23_n57), .B(
        my_dp_mpy3_inst_mult_23_n129), .CI(my_dp_mpy3_inst_mult_23_n62), .CO(
        my_dp_mpy3_inst_mult_23_n52), .S(my_dp_mpy3_inst_mult_23_n53) );
  FA_X1 my_dp_mpy3_inst_mult_23_U35 ( .A(my_dp_mpy3_inst_mult_23_n55), .B(
        my_dp_mpy3_inst_mult_23_n60), .CI(my_dp_mpy3_inst_mult_23_n53), .CO(
        my_dp_mpy3_inst_mult_23_n50), .S(my_dp_mpy3_inst_mult_23_n51) );
  FA_X1 my_dp_mpy3_inst_mult_23_U33 ( .A(my_dp_mpy3_inst_mult_23_n128), .B(
        my_dp_mpy3_inst_mult_23_n49), .CI(my_dp_mpy3_inst_mult_23_n112), .CO(
        my_dp_mpy3_inst_mult_23_n46), .S(my_dp_mpy3_inst_mult_23_n47) );
  FA_X1 my_dp_mpy3_inst_mult_23_U32 ( .A(my_dp_mpy3_inst_mult_23_n56), .B(
        my_dp_mpy3_inst_mult_23_n120), .CI(my_dp_mpy3_inst_mult_23_n54), .CO(
        my_dp_mpy3_inst_mult_23_n44), .S(my_dp_mpy3_inst_mult_23_n45) );
  FA_X1 my_dp_mpy3_inst_mult_23_U31 ( .A(my_dp_mpy3_inst_mult_23_n52), .B(
        my_dp_mpy3_inst_mult_23_n47), .CI(my_dp_mpy3_inst_mult_23_n45), .CO(
        my_dp_mpy3_inst_mult_23_n42), .S(my_dp_mpy3_inst_mult_23_n43) );
  FA_X1 my_dp_mpy3_inst_mult_23_U30 ( .A(my_dp_mpy3_inst_mult_23_n104), .B(
        my_dp_mpy3_inst_mult_23_n289), .CI(my_dp_mpy3_inst_mult_23_n119), .CO(
        my_dp_mpy3_inst_mult_23_n40), .S(my_dp_mpy3_inst_mult_23_n41) );
  FA_X1 my_dp_mpy3_inst_mult_23_U29 ( .A(my_dp_mpy3_inst_mult_23_n279), .B(
        my_dp_mpy3_inst_mult_23_n111), .CI(my_dp_mpy3_inst_mult_23_n46), .CO(
        my_dp_mpy3_inst_mult_23_n38), .S(my_dp_mpy3_inst_mult_23_n39) );
  FA_X1 my_dp_mpy3_inst_mult_23_U28 ( .A(my_dp_mpy3_inst_mult_23_n44), .B(
        my_dp_mpy3_inst_mult_23_n41), .CI(my_dp_mpy3_inst_mult_23_n39), .CO(
        my_dp_mpy3_inst_mult_23_n36), .S(my_dp_mpy3_inst_mult_23_n37) );
  FA_X1 my_dp_mpy3_inst_mult_23_U26 ( .A(my_dp_mpy3_inst_mult_23_n118), .B(
        my_dp_mpy3_inst_mult_23_n35), .CI(my_dp_mpy3_inst_mult_23_n110), .CO(
        my_dp_mpy3_inst_mult_23_n32), .S(my_dp_mpy3_inst_mult_23_n33) );
  FA_X1 my_dp_mpy3_inst_mult_23_U25 ( .A(my_dp_mpy3_inst_mult_23_n33), .B(
        my_dp_mpy3_inst_mult_23_n40), .CI(my_dp_mpy3_inst_mult_23_n38), .CO(
        my_dp_mpy3_inst_mult_23_n30), .S(my_dp_mpy3_inst_mult_23_n31) );
  FA_X1 my_dp_mpy3_inst_mult_23_U24 ( .A(my_dp_mpy3_inst_mult_23_n103), .B(
        my_dp_mpy3_inst_mult_23_n286), .CI(my_dp_mpy3_inst_mult_23_n109), .CO(
        my_dp_mpy3_inst_mult_23_n28), .S(my_dp_mpy3_inst_mult_23_n29) );
  FA_X1 my_dp_mpy3_inst_mult_23_U23 ( .A(my_dp_mpy3_inst_mult_23_n32), .B(
        my_dp_mpy3_inst_mult_23_n280), .CI(my_dp_mpy3_inst_mult_23_n29), .CO(
        my_dp_mpy3_inst_mult_23_n26), .S(my_dp_mpy3_inst_mult_23_n27) );
  FA_X1 my_dp_mpy3_inst_mult_23_U21 ( .A(my_dp_mpy3_inst_mult_23_n108), .B(
        my_dp_mpy3_inst_mult_23_n25), .CI(my_dp_mpy3_inst_mult_23_n28), .CO(
        my_dp_mpy3_inst_mult_23_n22), .S(my_dp_mpy3_inst_mult_23_n23) );
  FA_X1 my_dp_mpy3_inst_mult_23_U20 ( .A(my_dp_mpy3_inst_mult_23_n102), .B(
        my_dp_mpy3_inst_mult_23_n283), .CI(my_dp_mpy3_inst_mult_23_n281), .CO(
        my_dp_mpy3_inst_mult_23_n20), .S(my_dp_mpy3_inst_mult_23_n21) );
  FA_X1 my_dp_mpy3_inst_mult_23_U8 ( .A(my_dp_mpy3_inst_mult_23_n37), .B(
        my_dp_mpy3_inst_mult_23_n42), .CI(my_dp_mpy3_inst_mult_23_n8), .CO(
        my_dp_mpy3_inst_mult_23_n7), .S(my_dp_mpy_3__3_) );
  FA_X1 my_dp_mpy3_inst_mult_23_U7 ( .A(my_dp_mpy3_inst_mult_23_n31), .B(
        my_dp_mpy3_inst_mult_23_n36), .CI(my_dp_mpy3_inst_mult_23_n7), .CO(
        my_dp_mpy3_inst_mult_23_n6), .S(my_dp_mpy_3__4_) );
  FA_X1 my_dp_mpy3_inst_mult_23_U6 ( .A(my_dp_mpy3_inst_mult_23_n27), .B(
        my_dp_mpy3_inst_mult_23_n30), .CI(my_dp_mpy3_inst_mult_23_n6), .CO(
        my_dp_mpy3_inst_mult_23_n5), .S(my_dp_mpy_3__5_) );
  FA_X1 my_dp_mpy3_inst_mult_23_U5 ( .A(my_dp_mpy3_inst_mult_23_n23), .B(
        my_dp_mpy3_inst_mult_23_n26), .CI(my_dp_mpy3_inst_mult_23_n5), .CO(
        my_dp_mpy3_inst_mult_23_n4), .S(my_dp_mpy_3__6_) );
  FA_X1 my_dp_mpy3_inst_mult_23_U4 ( .A(my_dp_mpy3_inst_mult_23_n22), .B(
        my_dp_mpy3_inst_mult_23_n21), .CI(my_dp_mpy3_inst_mult_23_n4), .CO(
        my_dp_mpy3_inst_mult_23_n3), .S(my_dp_mpy_3__7_) );
  FA_X1 my_dp_mpy3_inst_mult_23_U3 ( .A(my_dp_mpy3_inst_mult_23_n20), .B(
        my_dp_mpy3_inst_mult_23_n19), .CI(my_dp_mpy3_inst_mult_23_n3), .CO(
        my_dp_mpy3_inst_mult_23_n2), .S(my_dp_mpy_3__8_) );
  XOR2_X1 my_dp_mpy4_inst_mult_23_U358 ( .A(my_dp_coeff[8]), .B(
        my_dp_mpy4_inst_mult_23_n294), .Z(my_dp_mpy4_inst_mult_23_n331) );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U357 ( .A(my_dp_r1[7]), .B(my_dp_coeff[8]), 
        .ZN(my_dp_mpy4_inst_mult_23_n374) );
  NOR2_X1 my_dp_mpy4_inst_mult_23_U356 ( .A1(my_dp_mpy4_inst_mult_23_n331), 
        .A2(my_dp_mpy4_inst_mult_23_n374), .ZN(my_dp_mpy4_inst_mult_23_n102)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U355 ( .A(my_dp_r1[5]), .B(my_dp_coeff[8]), 
        .ZN(my_dp_mpy4_inst_mult_23_n373) );
  NOR2_X1 my_dp_mpy4_inst_mult_23_U354 ( .A1(my_dp_mpy4_inst_mult_23_n331), 
        .A2(my_dp_mpy4_inst_mult_23_n373), .ZN(my_dp_mpy4_inst_mult_23_n103)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U353 ( .A(my_dp_r1[3]), .B(my_dp_coeff[8]), 
        .ZN(my_dp_mpy4_inst_mult_23_n372) );
  NOR2_X1 my_dp_mpy4_inst_mult_23_U352 ( .A1(my_dp_mpy4_inst_mult_23_n331), 
        .A2(my_dp_mpy4_inst_mult_23_n372), .ZN(my_dp_mpy4_inst_mult_23_n104)
         );
  NOR2_X1 my_dp_mpy4_inst_mult_23_U351 ( .A1(my_dp_mpy4_inst_mult_23_n331), 
        .A2(my_dp_mpy4_inst_mult_23_n292), .ZN(my_dp_mpy4_inst_mult_23_n106)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U350 ( .A(my_dp_r1[8]), .B(my_dp_coeff[7]), 
        .ZN(my_dp_mpy4_inst_mult_23_n369) );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U349 ( .A(my_dp_mpy4_inst_mult_23_n294), 
        .B(my_dp_coeff[6]), .ZN(my_dp_mpy4_inst_mult_23_n371) );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U348 ( .A1(my_dp_mpy4_inst_mult_23_n307), 
        .A2(my_dp_mpy4_inst_mult_23_n371), .ZN(my_dp_mpy4_inst_mult_23_n305)
         );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U347 ( .A1(my_dp_mpy4_inst_mult_23_n369), 
        .A2(my_dp_mpy4_inst_mult_23_n307), .B1(my_dp_mpy4_inst_mult_23_n305), 
        .B2(my_dp_mpy4_inst_mult_23_n369), .ZN(my_dp_mpy4_inst_mult_23_n370)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U346 ( .A(my_dp_r1[7]), .B(my_dp_coeff[7]), 
        .ZN(my_dp_mpy4_inst_mult_23_n368) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U345 ( .A1(my_dp_mpy4_inst_mult_23_n368), 
        .A2(my_dp_mpy4_inst_mult_23_n305), .B1(my_dp_mpy4_inst_mult_23_n307), 
        .B2(my_dp_mpy4_inst_mult_23_n369), .ZN(my_dp_mpy4_inst_mult_23_n108)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U344 ( .A(my_dp_r1[6]), .B(my_dp_coeff[7]), 
        .ZN(my_dp_mpy4_inst_mult_23_n367) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U343 ( .A1(my_dp_mpy4_inst_mult_23_n367), 
        .A2(my_dp_mpy4_inst_mult_23_n305), .B1(my_dp_mpy4_inst_mult_23_n307), 
        .B2(my_dp_mpy4_inst_mult_23_n368), .ZN(my_dp_mpy4_inst_mult_23_n109)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U342 ( .A(my_dp_r1[5]), .B(my_dp_coeff[7]), 
        .ZN(my_dp_mpy4_inst_mult_23_n366) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U341 ( .A1(my_dp_mpy4_inst_mult_23_n366), 
        .A2(my_dp_mpy4_inst_mult_23_n305), .B1(my_dp_mpy4_inst_mult_23_n307), 
        .B2(my_dp_mpy4_inst_mult_23_n367), .ZN(my_dp_mpy4_inst_mult_23_n110)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U340 ( .A(my_dp_r1[4]), .B(my_dp_coeff[7]), 
        .ZN(my_dp_mpy4_inst_mult_23_n365) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U339 ( .A1(my_dp_mpy4_inst_mult_23_n365), 
        .A2(my_dp_mpy4_inst_mult_23_n305), .B1(my_dp_mpy4_inst_mult_23_n307), 
        .B2(my_dp_mpy4_inst_mult_23_n366), .ZN(my_dp_mpy4_inst_mult_23_n111)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U338 ( .A(my_dp_r1[3]), .B(my_dp_coeff[7]), 
        .ZN(my_dp_mpy4_inst_mult_23_n364) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U337 ( .A1(my_dp_mpy4_inst_mult_23_n364), 
        .A2(my_dp_mpy4_inst_mult_23_n305), .B1(my_dp_mpy4_inst_mult_23_n307), 
        .B2(my_dp_mpy4_inst_mult_23_n365), .ZN(my_dp_mpy4_inst_mult_23_n112)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U336 ( .A(my_dp_r1[2]), .B(my_dp_coeff[7]), 
        .ZN(my_dp_mpy4_inst_mult_23_n363) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U335 ( .A1(my_dp_mpy4_inst_mult_23_n363), 
        .A2(my_dp_mpy4_inst_mult_23_n305), .B1(my_dp_mpy4_inst_mult_23_n307), 
        .B2(my_dp_mpy4_inst_mult_23_n364), .ZN(my_dp_mpy4_inst_mult_23_n113)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U334 ( .A(my_dp_r1[1]), .B(my_dp_coeff[7]), 
        .ZN(my_dp_mpy4_inst_mult_23_n362) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U333 ( .A1(my_dp_mpy4_inst_mult_23_n362), 
        .A2(my_dp_mpy4_inst_mult_23_n305), .B1(my_dp_mpy4_inst_mult_23_n307), 
        .B2(my_dp_mpy4_inst_mult_23_n363), .ZN(my_dp_mpy4_inst_mult_23_n114)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U332 ( .A(my_dp_coeff[7]), .B(my_dp_r1[0]), 
        .ZN(my_dp_mpy4_inst_mult_23_n361) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U331 ( .A1(my_dp_mpy4_inst_mult_23_n361), 
        .A2(my_dp_mpy4_inst_mult_23_n305), .B1(my_dp_mpy4_inst_mult_23_n307), 
        .B2(my_dp_mpy4_inst_mult_23_n362), .ZN(my_dp_mpy4_inst_mult_23_n115)
         );
  NOR2_X1 my_dp_mpy4_inst_mult_23_U330 ( .A1(my_dp_mpy4_inst_mult_23_n307), 
        .A2(my_dp_mpy4_inst_mult_23_n292), .ZN(my_dp_mpy4_inst_mult_23_n116)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U329 ( .A(my_dp_r1[8]), .B(my_dp_coeff[5]), 
        .ZN(my_dp_mpy4_inst_mult_23_n358) );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U328 ( .A(my_dp_mpy4_inst_mult_23_n295), 
        .B(my_dp_coeff[4]), .ZN(my_dp_mpy4_inst_mult_23_n360) );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U327 ( .A1(my_dp_mpy4_inst_mult_23_n304), 
        .A2(my_dp_mpy4_inst_mult_23_n360), .ZN(my_dp_mpy4_inst_mult_23_n302)
         );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U326 ( .A1(my_dp_mpy4_inst_mult_23_n358), 
        .A2(my_dp_mpy4_inst_mult_23_n304), .B1(my_dp_mpy4_inst_mult_23_n302), 
        .B2(my_dp_mpy4_inst_mult_23_n358), .ZN(my_dp_mpy4_inst_mult_23_n359)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U325 ( .A(my_dp_r1[7]), .B(my_dp_coeff[5]), 
        .ZN(my_dp_mpy4_inst_mult_23_n357) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U324 ( .A1(my_dp_mpy4_inst_mult_23_n357), 
        .A2(my_dp_mpy4_inst_mult_23_n302), .B1(my_dp_mpy4_inst_mult_23_n304), 
        .B2(my_dp_mpy4_inst_mult_23_n358), .ZN(my_dp_mpy4_inst_mult_23_n118)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U323 ( .A(my_dp_r1[6]), .B(my_dp_coeff[5]), 
        .ZN(my_dp_mpy4_inst_mult_23_n356) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U322 ( .A1(my_dp_mpy4_inst_mult_23_n356), 
        .A2(my_dp_mpy4_inst_mult_23_n302), .B1(my_dp_mpy4_inst_mult_23_n304), 
        .B2(my_dp_mpy4_inst_mult_23_n357), .ZN(my_dp_mpy4_inst_mult_23_n119)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U321 ( .A(my_dp_r1[5]), .B(my_dp_coeff[5]), 
        .ZN(my_dp_mpy4_inst_mult_23_n355) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U320 ( .A1(my_dp_mpy4_inst_mult_23_n355), 
        .A2(my_dp_mpy4_inst_mult_23_n302), .B1(my_dp_mpy4_inst_mult_23_n304), 
        .B2(my_dp_mpy4_inst_mult_23_n356), .ZN(my_dp_mpy4_inst_mult_23_n120)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U319 ( .A(my_dp_r1[4]), .B(my_dp_coeff[5]), 
        .ZN(my_dp_mpy4_inst_mult_23_n354) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U318 ( .A1(my_dp_mpy4_inst_mult_23_n354), 
        .A2(my_dp_mpy4_inst_mult_23_n302), .B1(my_dp_mpy4_inst_mult_23_n304), 
        .B2(my_dp_mpy4_inst_mult_23_n355), .ZN(my_dp_mpy4_inst_mult_23_n121)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U317 ( .A(my_dp_r1[3]), .B(my_dp_coeff[5]), 
        .ZN(my_dp_mpy4_inst_mult_23_n353) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U316 ( .A1(my_dp_mpy4_inst_mult_23_n353), 
        .A2(my_dp_mpy4_inst_mult_23_n302), .B1(my_dp_mpy4_inst_mult_23_n304), 
        .B2(my_dp_mpy4_inst_mult_23_n354), .ZN(my_dp_mpy4_inst_mult_23_n122)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U315 ( .A(my_dp_r1[2]), .B(my_dp_coeff[5]), 
        .ZN(my_dp_mpy4_inst_mult_23_n352) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U314 ( .A1(my_dp_mpy4_inst_mult_23_n352), 
        .A2(my_dp_mpy4_inst_mult_23_n302), .B1(my_dp_mpy4_inst_mult_23_n304), 
        .B2(my_dp_mpy4_inst_mult_23_n353), .ZN(my_dp_mpy4_inst_mult_23_n123)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U313 ( .A(my_dp_r1[1]), .B(my_dp_coeff[5]), 
        .ZN(my_dp_mpy4_inst_mult_23_n351) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U312 ( .A1(my_dp_mpy4_inst_mult_23_n351), 
        .A2(my_dp_mpy4_inst_mult_23_n302), .B1(my_dp_mpy4_inst_mult_23_n304), 
        .B2(my_dp_mpy4_inst_mult_23_n352), .ZN(my_dp_mpy4_inst_mult_23_n124)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U311 ( .A(my_dp_coeff[5]), .B(my_dp_r1[0]), 
        .ZN(my_dp_mpy4_inst_mult_23_n350) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U310 ( .A1(my_dp_mpy4_inst_mult_23_n350), 
        .A2(my_dp_mpy4_inst_mult_23_n302), .B1(my_dp_mpy4_inst_mult_23_n304), 
        .B2(my_dp_mpy4_inst_mult_23_n351), .ZN(my_dp_mpy4_inst_mult_23_n125)
         );
  NOR2_X1 my_dp_mpy4_inst_mult_23_U309 ( .A1(my_dp_mpy4_inst_mult_23_n304), 
        .A2(my_dp_mpy4_inst_mult_23_n292), .ZN(my_dp_mpy4_inst_mult_23_n126)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U308 ( .A(my_dp_r1[8]), .B(my_dp_coeff[3]), 
        .ZN(my_dp_mpy4_inst_mult_23_n347) );
  XOR2_X1 my_dp_mpy4_inst_mult_23_U307 ( .A(my_dp_coeff[2]), .B(my_dp_coeff[1]), .Z(my_dp_mpy4_inst_mult_23_n318) );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U306 ( .A(my_dp_mpy4_inst_mult_23_n296), 
        .B(my_dp_coeff[2]), .ZN(my_dp_mpy4_inst_mult_23_n349) );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U305 ( .A1(my_dp_mpy4_inst_mult_23_n297), 
        .A2(my_dp_mpy4_inst_mult_23_n349), .ZN(my_dp_mpy4_inst_mult_23_n316)
         );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U304 ( .A1(my_dp_mpy4_inst_mult_23_n347), 
        .A2(my_dp_mpy4_inst_mult_23_n297), .B1(my_dp_mpy4_inst_mult_23_n316), 
        .B2(my_dp_mpy4_inst_mult_23_n347), .ZN(my_dp_mpy4_inst_mult_23_n348)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U303 ( .A(my_dp_r1[7]), .B(my_dp_coeff[3]), 
        .ZN(my_dp_mpy4_inst_mult_23_n346) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U302 ( .A1(my_dp_mpy4_inst_mult_23_n346), 
        .A2(my_dp_mpy4_inst_mult_23_n316), .B1(my_dp_mpy4_inst_mult_23_n297), 
        .B2(my_dp_mpy4_inst_mult_23_n347), .ZN(my_dp_mpy4_inst_mult_23_n128)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U301 ( .A(my_dp_r1[6]), .B(my_dp_coeff[3]), 
        .ZN(my_dp_mpy4_inst_mult_23_n345) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U300 ( .A1(my_dp_mpy4_inst_mult_23_n345), 
        .A2(my_dp_mpy4_inst_mult_23_n316), .B1(my_dp_mpy4_inst_mult_23_n297), 
        .B2(my_dp_mpy4_inst_mult_23_n346), .ZN(my_dp_mpy4_inst_mult_23_n129)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U299 ( .A(my_dp_r1[5]), .B(my_dp_coeff[3]), 
        .ZN(my_dp_mpy4_inst_mult_23_n344) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U298 ( .A1(my_dp_mpy4_inst_mult_23_n344), 
        .A2(my_dp_mpy4_inst_mult_23_n316), .B1(my_dp_mpy4_inst_mult_23_n297), 
        .B2(my_dp_mpy4_inst_mult_23_n345), .ZN(my_dp_mpy4_inst_mult_23_n130)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U297 ( .A(my_dp_r1[4]), .B(my_dp_coeff[3]), 
        .ZN(my_dp_mpy4_inst_mult_23_n343) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U296 ( .A1(my_dp_mpy4_inst_mult_23_n343), 
        .A2(my_dp_mpy4_inst_mult_23_n316), .B1(my_dp_mpy4_inst_mult_23_n297), 
        .B2(my_dp_mpy4_inst_mult_23_n344), .ZN(my_dp_mpy4_inst_mult_23_n131)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U295 ( .A(my_dp_r1[3]), .B(my_dp_coeff[3]), 
        .ZN(my_dp_mpy4_inst_mult_23_n342) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U294 ( .A1(my_dp_mpy4_inst_mult_23_n342), 
        .A2(my_dp_mpy4_inst_mult_23_n316), .B1(my_dp_mpy4_inst_mult_23_n297), 
        .B2(my_dp_mpy4_inst_mult_23_n343), .ZN(my_dp_mpy4_inst_mult_23_n132)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U293 ( .A(my_dp_r1[2]), .B(my_dp_coeff[3]), 
        .ZN(my_dp_mpy4_inst_mult_23_n341) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U292 ( .A1(my_dp_mpy4_inst_mult_23_n341), 
        .A2(my_dp_mpy4_inst_mult_23_n316), .B1(my_dp_mpy4_inst_mult_23_n297), 
        .B2(my_dp_mpy4_inst_mult_23_n342), .ZN(my_dp_mpy4_inst_mult_23_n133)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U291 ( .A(my_dp_r1[1]), .B(my_dp_coeff[3]), 
        .ZN(my_dp_mpy4_inst_mult_23_n340) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U290 ( .A1(my_dp_mpy4_inst_mult_23_n340), 
        .A2(my_dp_mpy4_inst_mult_23_n316), .B1(my_dp_mpy4_inst_mult_23_n297), 
        .B2(my_dp_mpy4_inst_mult_23_n341), .ZN(my_dp_mpy4_inst_mult_23_n134)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U289 ( .A(my_dp_coeff[3]), .B(my_dp_r1[0]), 
        .ZN(my_dp_mpy4_inst_mult_23_n339) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U288 ( .A1(my_dp_mpy4_inst_mult_23_n339), 
        .A2(my_dp_mpy4_inst_mult_23_n316), .B1(my_dp_mpy4_inst_mult_23_n297), 
        .B2(my_dp_mpy4_inst_mult_23_n340), .ZN(my_dp_mpy4_inst_mult_23_n135)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U287 ( .A(my_dp_r1[8]), .B(my_dp_coeff[1]), 
        .ZN(my_dp_mpy4_inst_mult_23_n337) );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U286 ( .A1(my_dp_coeff[1]), .A2(
        my_dp_mpy4_inst_mult_23_n298), .ZN(my_dp_mpy4_inst_mult_23_n323) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U285 ( .A1(my_dp_mpy4_inst_mult_23_n298), 
        .A2(my_dp_mpy4_inst_mult_23_n337), .B1(my_dp_mpy4_inst_mult_23_n323), 
        .B2(my_dp_mpy4_inst_mult_23_n337), .ZN(my_dp_mpy4_inst_mult_23_n338)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U284 ( .A(my_dp_r1[7]), .B(my_dp_coeff[1]), 
        .ZN(my_dp_mpy4_inst_mult_23_n336) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U283 ( .A1(my_dp_mpy4_inst_mult_23_n336), 
        .A2(my_dp_mpy4_inst_mult_23_n323), .B1(my_dp_mpy4_inst_mult_23_n337), 
        .B2(my_dp_mpy4_inst_mult_23_n298), .ZN(my_dp_mpy4_inst_mult_23_n138)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U282 ( .A(my_dp_r1[6]), .B(my_dp_coeff[1]), 
        .ZN(my_dp_mpy4_inst_mult_23_n335) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U281 ( .A1(my_dp_mpy4_inst_mult_23_n335), 
        .A2(my_dp_mpy4_inst_mult_23_n323), .B1(my_dp_mpy4_inst_mult_23_n336), 
        .B2(my_dp_mpy4_inst_mult_23_n298), .ZN(my_dp_mpy4_inst_mult_23_n139)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U280 ( .A(my_dp_r1[5]), .B(my_dp_coeff[1]), 
        .ZN(my_dp_mpy4_inst_mult_23_n334) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U279 ( .A1(my_dp_mpy4_inst_mult_23_n334), 
        .A2(my_dp_mpy4_inst_mult_23_n323), .B1(my_dp_mpy4_inst_mult_23_n335), 
        .B2(my_dp_mpy4_inst_mult_23_n298), .ZN(my_dp_mpy4_inst_mult_23_n140)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U278 ( .A(my_dp_r1[4]), .B(my_dp_coeff[1]), 
        .ZN(my_dp_mpy4_inst_mult_23_n333) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U277 ( .A1(my_dp_mpy4_inst_mult_23_n333), 
        .A2(my_dp_mpy4_inst_mult_23_n323), .B1(my_dp_mpy4_inst_mult_23_n334), 
        .B2(my_dp_mpy4_inst_mult_23_n298), .ZN(my_dp_mpy4_inst_mult_23_n141)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U276 ( .A(my_dp_r1[3]), .B(my_dp_coeff[1]), 
        .ZN(my_dp_mpy4_inst_mult_23_n332) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U275 ( .A1(my_dp_mpy4_inst_mult_23_n332), 
        .A2(my_dp_mpy4_inst_mult_23_n323), .B1(my_dp_mpy4_inst_mult_23_n333), 
        .B2(my_dp_mpy4_inst_mult_23_n298), .ZN(my_dp_mpy4_inst_mult_23_n142)
         );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U274 ( .A(my_dp_r1[2]), .B(my_dp_coeff[1]), 
        .ZN(my_dp_mpy4_inst_mult_23_n324) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U273 ( .A1(my_dp_mpy4_inst_mult_23_n324), 
        .A2(my_dp_mpy4_inst_mult_23_n323), .B1(my_dp_mpy4_inst_mult_23_n332), 
        .B2(my_dp_mpy4_inst_mult_23_n298), .ZN(my_dp_mpy4_inst_mult_23_n143)
         );
  XOR2_X1 my_dp_mpy4_inst_mult_23_U272 ( .A(my_dp_r1[8]), .B(my_dp_coeff[8]), 
        .Z(my_dp_mpy4_inst_mult_23_n301) );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U271 ( .A1(my_dp_mpy4_inst_mult_23_n301), 
        .A2(my_dp_mpy4_inst_mult_23_n293), .ZN(my_dp_mpy4_inst_mult_23_n19) );
  XOR2_X1 my_dp_mpy4_inst_mult_23_U270 ( .A(my_dp_r1[6]), .B(my_dp_coeff[8]), 
        .Z(my_dp_mpy4_inst_mult_23_n330) );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U269 ( .A1(my_dp_mpy4_inst_mult_23_n330), 
        .A2(my_dp_mpy4_inst_mult_23_n293), .ZN(my_dp_mpy4_inst_mult_23_n25) );
  XOR2_X1 my_dp_mpy4_inst_mult_23_U268 ( .A(my_dp_r1[4]), .B(my_dp_coeff[8]), 
        .Z(my_dp_mpy4_inst_mult_23_n329) );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U267 ( .A1(my_dp_mpy4_inst_mult_23_n329), 
        .A2(my_dp_mpy4_inst_mult_23_n293), .ZN(my_dp_mpy4_inst_mult_23_n35) );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U266 ( .A1(my_dp_mpy4_inst_mult_23_n328), 
        .A2(my_dp_mpy4_inst_mult_23_n293), .ZN(my_dp_mpy4_inst_mult_23_n49) );
  NAND3_X1 my_dp_mpy4_inst_mult_23_U265 ( .A1(my_dp_mpy4_inst_mult_23_n293), 
        .A2(my_dp_mpy4_inst_mult_23_n292), .A3(my_dp_coeff[8]), .ZN(
        my_dp_mpy4_inst_mult_23_n325) );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U264 ( .A(my_dp_mpy4_inst_mult_23_n291), 
        .B(my_dp_coeff[8]), .ZN(my_dp_mpy4_inst_mult_23_n327) );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U263 ( .A1(my_dp_mpy4_inst_mult_23_n327), 
        .A2(my_dp_mpy4_inst_mult_23_n293), .ZN(my_dp_mpy4_inst_mult_23_n326)
         );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U262 ( .A1(my_dp_mpy4_inst_mult_23_n325), 
        .A2(my_dp_mpy4_inst_mult_23_n326), .ZN(my_dp_mpy4_inst_mult_23_n56) );
  XNOR2_X1 my_dp_mpy4_inst_mult_23_U261 ( .A(my_dp_mpy4_inst_mult_23_n325), 
        .B(my_dp_mpy4_inst_mult_23_n326), .ZN(my_dp_mpy4_inst_mult_23_n57) );
  OAI22_X1 my_dp_mpy4_inst_mult_23_U260 ( .A1(my_dp_r1[1]), .A2(
        my_dp_mpy4_inst_mult_23_n323), .B1(my_dp_mpy4_inst_mult_23_n324), .B2(
        my_dp_mpy4_inst_mult_23_n298), .ZN(my_dp_mpy4_inst_mult_23_n322) );
  NAND2_X1 my_dp_mpy4_inst_mult_23_U259 ( .A1(my_dp_mpy4_inst_mult_23_n318), 
        .A2(my_dp_mpy4_inst_mult_23_n322), .ZN(my_dp_mpy4_inst_mult_23_n320)
         );
  NAND3_X1 my_dp_mpy4_inst_mult_23_U258 ( .A1(my_dp_mpy4_inst_mult_23_n322), 
        .A2(my_dp_mpy4_inst_mult_23_n291), .A3(my_dp_coeff[1]), .ZN(
        my_dp_mpy4_inst_mult_23_n321) );
  MUX2_X1 my_dp_mpy4_inst_mult_23_U257 ( .A(my_dp_mpy4_inst_mult_23_n320), .B(
        my_dp_mpy4_inst_mult_23_n321), .S(my_dp_mpy4_inst_mult_23_n292), .Z(
        my_dp_mpy4_inst_mult_23_n319) );
  NAND3_X1 my_dp_mpy4_inst_mult_23_U256 ( .A1(my_dp_mpy4_inst_mult_23_n318), 
        .A2(my_dp_mpy4_inst_mult_23_n292), .A3(my_dp_coeff[3]), .ZN(
        my_dp_mpy4_inst_mult_23_n317) );
  OAI21_X1 my_dp_mpy4_inst_mult_23_U255 ( .B1(my_dp_mpy4_inst_mult_23_n296), 
        .B2(my_dp_mpy4_inst_mult_23_n316), .A(my_dp_mpy4_inst_mult_23_n317), 
        .ZN(my_dp_mpy4_inst_mult_23_n315) );
  AOI222_X1 my_dp_mpy4_inst_mult_23_U254 ( .A1(my_dp_mpy4_inst_mult_23_n290), 
        .A2(my_dp_mpy4_inst_mult_23_n81), .B1(my_dp_mpy4_inst_mult_23_n315), 
        .B2(my_dp_mpy4_inst_mult_23_n290), .C1(my_dp_mpy4_inst_mult_23_n315), 
        .C2(my_dp_mpy4_inst_mult_23_n81), .ZN(my_dp_mpy4_inst_mult_23_n314) );
  AOI222_X1 my_dp_mpy4_inst_mult_23_U253 ( .A1(my_dp_mpy4_inst_mult_23_n288), 
        .A2(my_dp_mpy4_inst_mult_23_n79), .B1(my_dp_mpy4_inst_mult_23_n288), 
        .B2(my_dp_mpy4_inst_mult_23_n80), .C1(my_dp_mpy4_inst_mult_23_n80), 
        .C2(my_dp_mpy4_inst_mult_23_n79), .ZN(my_dp_mpy4_inst_mult_23_n313) );
  AOI222_X1 my_dp_mpy4_inst_mult_23_U252 ( .A1(my_dp_mpy4_inst_mult_23_n287), 
        .A2(my_dp_mpy4_inst_mult_23_n75), .B1(my_dp_mpy4_inst_mult_23_n287), 
        .B2(my_dp_mpy4_inst_mult_23_n78), .C1(my_dp_mpy4_inst_mult_23_n78), 
        .C2(my_dp_mpy4_inst_mult_23_n75), .ZN(my_dp_mpy4_inst_mult_23_n312) );
  AOI222_X1 my_dp_mpy4_inst_mult_23_U251 ( .A1(my_dp_mpy4_inst_mult_23_n285), 
        .A2(my_dp_mpy4_inst_mult_23_n71), .B1(my_dp_mpy4_inst_mult_23_n285), 
        .B2(my_dp_mpy4_inst_mult_23_n74), .C1(my_dp_mpy4_inst_mult_23_n74), 
        .C2(my_dp_mpy4_inst_mult_23_n71), .ZN(my_dp_mpy4_inst_mult_23_n311) );
  AOI222_X1 my_dp_mpy4_inst_mult_23_U250 ( .A1(my_dp_mpy4_inst_mult_23_n284), 
        .A2(my_dp_mpy4_inst_mult_23_n65), .B1(my_dp_mpy4_inst_mult_23_n284), 
        .B2(my_dp_mpy4_inst_mult_23_n70), .C1(my_dp_mpy4_inst_mult_23_n70), 
        .C2(my_dp_mpy4_inst_mult_23_n65), .ZN(my_dp_mpy4_inst_mult_23_n310) );
  OAI222_X1 my_dp_mpy4_inst_mult_23_U249 ( .A1(my_dp_mpy4_inst_mult_23_n310), 
        .A2(my_dp_mpy4_inst_mult_23_n278), .B1(my_dp_mpy4_inst_mult_23_n310), 
        .B2(my_dp_mpy4_inst_mult_23_n282), .C1(my_dp_mpy4_inst_mult_23_n282), 
        .C2(my_dp_mpy4_inst_mult_23_n278), .ZN(my_dp_mpy4_inst_mult_23_n309)
         );
  AOI222_X1 my_dp_mpy4_inst_mult_23_U248 ( .A1(my_dp_mpy4_inst_mult_23_n309), 
        .A2(my_dp_mpy4_inst_mult_23_n51), .B1(my_dp_mpy4_inst_mult_23_n309), 
        .B2(my_dp_mpy4_inst_mult_23_n58), .C1(my_dp_mpy4_inst_mult_23_n58), 
        .C2(my_dp_mpy4_inst_mult_23_n51), .ZN(my_dp_mpy4_inst_mult_23_n308) );
  OAI222_X1 my_dp_mpy4_inst_mult_23_U247 ( .A1(my_dp_mpy4_inst_mult_23_n308), 
        .A2(my_dp_mpy4_inst_mult_23_n275), .B1(my_dp_mpy4_inst_mult_23_n308), 
        .B2(my_dp_mpy4_inst_mult_23_n276), .C1(my_dp_mpy4_inst_mult_23_n276), 
        .C2(my_dp_mpy4_inst_mult_23_n275), .ZN(my_dp_mpy4_inst_mult_23_n8) );
  OR3_X1 my_dp_mpy4_inst_mult_23_U246 ( .A1(my_dp_mpy4_inst_mult_23_n307), 
        .A2(my_dp_r1[0]), .A3(my_dp_mpy4_inst_mult_23_n294), .ZN(
        my_dp_mpy4_inst_mult_23_n306) );
  OAI21_X1 my_dp_mpy4_inst_mult_23_U245 ( .B1(my_dp_mpy4_inst_mult_23_n294), 
        .B2(my_dp_mpy4_inst_mult_23_n305), .A(my_dp_mpy4_inst_mult_23_n306), 
        .ZN(my_dp_mpy4_inst_mult_23_n97) );
  OR3_X1 my_dp_mpy4_inst_mult_23_U244 ( .A1(my_dp_mpy4_inst_mult_23_n304), 
        .A2(my_dp_r1[0]), .A3(my_dp_mpy4_inst_mult_23_n295), .ZN(
        my_dp_mpy4_inst_mult_23_n303) );
  OAI21_X1 my_dp_mpy4_inst_mult_23_U243 ( .B1(my_dp_mpy4_inst_mult_23_n295), 
        .B2(my_dp_mpy4_inst_mult_23_n302), .A(my_dp_mpy4_inst_mult_23_n303), 
        .ZN(my_dp_mpy4_inst_mult_23_n98) );
  NOR2_X1 my_dp_mpy4_inst_mult_23_U242 ( .A1(my_dp_mpy4_inst_mult_23_n298), 
        .A2(my_dp_mpy4_inst_mult_23_n292), .ZN(my_dp_mpy4_inst_outc_0_) );
  XOR2_X1 my_dp_mpy4_inst_mult_23_U241 ( .A(my_dp_mpy4_inst_mult_23_n19), .B(
        my_dp_mpy4_inst_mult_23_n2), .Z(my_dp_mpy4_inst_mult_23_n299) );
  AND2_X1 my_dp_mpy4_inst_mult_23_U240 ( .A1(my_dp_mpy4_inst_mult_23_n293), 
        .A2(my_dp_mpy4_inst_mult_23_n301), .ZN(my_dp_mpy4_inst_mult_23_n300)
         );
  XOR2_X1 my_dp_mpy4_inst_mult_23_U239 ( .A(my_dp_mpy4_inst_mult_23_n299), .B(
        my_dp_mpy4_inst_mult_23_n300), .Z(my_dp_mpy4_inst_outc_17_) );
  XOR2_X1 my_dp_mpy4_inst_mult_23_U238 ( .A(my_dp_r1[2]), .B(my_dp_coeff[8]), 
        .Z(my_dp_mpy4_inst_mult_23_n328) );
  INV_X1 my_dp_mpy4_inst_mult_23_U237 ( .A(my_dp_coeff[7]), .ZN(
        my_dp_mpy4_inst_mult_23_n294) );
  XOR2_X1 my_dp_mpy4_inst_mult_23_U236 ( .A(my_dp_coeff[6]), .B(
        my_dp_mpy4_inst_mult_23_n295), .Z(my_dp_mpy4_inst_mult_23_n307) );
  INV_X1 my_dp_mpy4_inst_mult_23_U235 ( .A(my_dp_r1[1]), .ZN(
        my_dp_mpy4_inst_mult_23_n291) );
  INV_X1 my_dp_mpy4_inst_mult_23_U234 ( .A(my_dp_r1[0]), .ZN(
        my_dp_mpy4_inst_mult_23_n292) );
  INV_X1 my_dp_mpy4_inst_mult_23_U233 ( .A(my_dp_coeff[5]), .ZN(
        my_dp_mpy4_inst_mult_23_n295) );
  INV_X1 my_dp_mpy4_inst_mult_23_U232 ( .A(my_dp_coeff[0]), .ZN(
        my_dp_mpy4_inst_mult_23_n298) );
  XOR2_X1 my_dp_mpy4_inst_mult_23_U231 ( .A(my_dp_coeff[4]), .B(
        my_dp_mpy4_inst_mult_23_n296), .Z(my_dp_mpy4_inst_mult_23_n304) );
  INV_X1 my_dp_mpy4_inst_mult_23_U230 ( .A(my_dp_coeff[3]), .ZN(
        my_dp_mpy4_inst_mult_23_n296) );
  INV_X1 my_dp_mpy4_inst_mult_23_U229 ( .A(my_dp_mpy4_inst_mult_23_n370), .ZN(
        my_dp_mpy4_inst_mult_23_n281) );
  INV_X1 my_dp_mpy4_inst_mult_23_U228 ( .A(my_dp_mpy4_inst_mult_23_n25), .ZN(
        my_dp_mpy4_inst_mult_23_n283) );
  INV_X1 my_dp_mpy4_inst_mult_23_U227 ( .A(my_dp_mpy4_inst_mult_23_n35), .ZN(
        my_dp_mpy4_inst_mult_23_n286) );
  INV_X1 my_dp_mpy4_inst_mult_23_U226 ( .A(my_dp_mpy4_inst_mult_23_n359), .ZN(
        my_dp_mpy4_inst_mult_23_n280) );
  INV_X1 my_dp_mpy4_inst_mult_23_U225 ( .A(my_dp_mpy4_inst_mult_23_n49), .ZN(
        my_dp_mpy4_inst_mult_23_n289) );
  INV_X1 my_dp_mpy4_inst_mult_23_U224 ( .A(my_dp_mpy4_inst_mult_23_n348), .ZN(
        my_dp_mpy4_inst_mult_23_n279) );
  INV_X1 my_dp_mpy4_inst_mult_23_U223 ( .A(my_dp_mpy4_inst_mult_23_n331), .ZN(
        my_dp_mpy4_inst_mult_23_n293) );
  INV_X1 my_dp_mpy4_inst_mult_23_U222 ( .A(my_dp_mpy4_inst_mult_23_n338), .ZN(
        my_dp_mpy4_inst_mult_23_n277) );
  INV_X1 my_dp_mpy4_inst_mult_23_U221 ( .A(my_dp_mpy4_inst_mult_23_n313), .ZN(
        my_dp_mpy4_inst_mult_23_n287) );
  INV_X1 my_dp_mpy4_inst_mult_23_U220 ( .A(my_dp_mpy4_inst_mult_23_n312), .ZN(
        my_dp_mpy4_inst_mult_23_n285) );
  INV_X1 my_dp_mpy4_inst_mult_23_U219 ( .A(my_dp_mpy4_inst_mult_23_n318), .ZN(
        my_dp_mpy4_inst_mult_23_n297) );
  INV_X1 my_dp_mpy4_inst_mult_23_U218 ( .A(my_dp_mpy4_inst_mult_23_n319), .ZN(
        my_dp_mpy4_inst_mult_23_n290) );
  INV_X1 my_dp_mpy4_inst_mult_23_U217 ( .A(my_dp_mpy4_inst_mult_23_n314), .ZN(
        my_dp_mpy4_inst_mult_23_n288) );
  INV_X1 my_dp_mpy4_inst_mult_23_U216 ( .A(my_dp_mpy4_inst_mult_23_n311), .ZN(
        my_dp_mpy4_inst_mult_23_n284) );
  INV_X1 my_dp_mpy4_inst_mult_23_U215 ( .A(my_dp_mpy4_inst_mult_23_n59), .ZN(
        my_dp_mpy4_inst_mult_23_n278) );
  INV_X1 my_dp_mpy4_inst_mult_23_U214 ( .A(my_dp_mpy4_inst_mult_23_n64), .ZN(
        my_dp_mpy4_inst_mult_23_n282) );
  INV_X1 my_dp_mpy4_inst_mult_23_U213 ( .A(my_dp_mpy4_inst_mult_23_n43), .ZN(
        my_dp_mpy4_inst_mult_23_n275) );
  INV_X1 my_dp_mpy4_inst_mult_23_U212 ( .A(my_dp_mpy4_inst_mult_23_n50), .ZN(
        my_dp_mpy4_inst_mult_23_n276) );
  HA_X1 my_dp_mpy4_inst_mult_23_U51 ( .A(my_dp_mpy4_inst_mult_23_n135), .B(
        my_dp_mpy4_inst_mult_23_n143), .CO(my_dp_mpy4_inst_mult_23_n80), .S(
        my_dp_mpy4_inst_mult_23_n81) );
  FA_X1 my_dp_mpy4_inst_mult_23_U50 ( .A(my_dp_mpy4_inst_mult_23_n142), .B(
        my_dp_mpy4_inst_mult_23_n126), .CI(my_dp_mpy4_inst_mult_23_n134), .CO(
        my_dp_mpy4_inst_mult_23_n78), .S(my_dp_mpy4_inst_mult_23_n79) );
  HA_X1 my_dp_mpy4_inst_mult_23_U49 ( .A(my_dp_mpy4_inst_mult_23_n98), .B(
        my_dp_mpy4_inst_mult_23_n125), .CO(my_dp_mpy4_inst_mult_23_n76), .S(
        my_dp_mpy4_inst_mult_23_n77) );
  FA_X1 my_dp_mpy4_inst_mult_23_U48 ( .A(my_dp_mpy4_inst_mult_23_n133), .B(
        my_dp_mpy4_inst_mult_23_n141), .CI(my_dp_mpy4_inst_mult_23_n77), .CO(
        my_dp_mpy4_inst_mult_23_n74), .S(my_dp_mpy4_inst_mult_23_n75) );
  FA_X1 my_dp_mpy4_inst_mult_23_U47 ( .A(my_dp_mpy4_inst_mult_23_n140), .B(
        my_dp_mpy4_inst_mult_23_n116), .CI(my_dp_mpy4_inst_mult_23_n132), .CO(
        my_dp_mpy4_inst_mult_23_n72), .S(my_dp_mpy4_inst_mult_23_n73) );
  FA_X1 my_dp_mpy4_inst_mult_23_U46 ( .A(my_dp_mpy4_inst_mult_23_n76), .B(
        my_dp_mpy4_inst_mult_23_n124), .CI(my_dp_mpy4_inst_mult_23_n73), .CO(
        my_dp_mpy4_inst_mult_23_n70), .S(my_dp_mpy4_inst_mult_23_n71) );
  HA_X1 my_dp_mpy4_inst_mult_23_U45 ( .A(my_dp_mpy4_inst_mult_23_n97), .B(
        my_dp_mpy4_inst_mult_23_n115), .CO(my_dp_mpy4_inst_mult_23_n68), .S(
        my_dp_mpy4_inst_mult_23_n69) );
  FA_X1 my_dp_mpy4_inst_mult_23_U44 ( .A(my_dp_mpy4_inst_mult_23_n123), .B(
        my_dp_mpy4_inst_mult_23_n139), .CI(my_dp_mpy4_inst_mult_23_n131), .CO(
        my_dp_mpy4_inst_mult_23_n66), .S(my_dp_mpy4_inst_mult_23_n67) );
  FA_X1 my_dp_mpy4_inst_mult_23_U43 ( .A(my_dp_mpy4_inst_mult_23_n72), .B(
        my_dp_mpy4_inst_mult_23_n69), .CI(my_dp_mpy4_inst_mult_23_n67), .CO(
        my_dp_mpy4_inst_mult_23_n64), .S(my_dp_mpy4_inst_mult_23_n65) );
  FA_X1 my_dp_mpy4_inst_mult_23_U42 ( .A(my_dp_mpy4_inst_mult_23_n122), .B(
        my_dp_mpy4_inst_mult_23_n106), .CI(my_dp_mpy4_inst_mult_23_n138), .CO(
        my_dp_mpy4_inst_mult_23_n62), .S(my_dp_mpy4_inst_mult_23_n63) );
  FA_X1 my_dp_mpy4_inst_mult_23_U41 ( .A(my_dp_mpy4_inst_mult_23_n114), .B(
        my_dp_mpy4_inst_mult_23_n130), .CI(my_dp_mpy4_inst_mult_23_n68), .CO(
        my_dp_mpy4_inst_mult_23_n60), .S(my_dp_mpy4_inst_mult_23_n61) );
  FA_X1 my_dp_mpy4_inst_mult_23_U40 ( .A(my_dp_mpy4_inst_mult_23_n63), .B(
        my_dp_mpy4_inst_mult_23_n66), .CI(my_dp_mpy4_inst_mult_23_n61), .CO(
        my_dp_mpy4_inst_mult_23_n58), .S(my_dp_mpy4_inst_mult_23_n59) );
  FA_X1 my_dp_mpy4_inst_mult_23_U37 ( .A(my_dp_mpy4_inst_mult_23_n113), .B(
        my_dp_mpy4_inst_mult_23_n121), .CI(my_dp_mpy4_inst_mult_23_n277), .CO(
        my_dp_mpy4_inst_mult_23_n54), .S(my_dp_mpy4_inst_mult_23_n55) );
  FA_X1 my_dp_mpy4_inst_mult_23_U36 ( .A(my_dp_mpy4_inst_mult_23_n57), .B(
        my_dp_mpy4_inst_mult_23_n129), .CI(my_dp_mpy4_inst_mult_23_n62), .CO(
        my_dp_mpy4_inst_mult_23_n52), .S(my_dp_mpy4_inst_mult_23_n53) );
  FA_X1 my_dp_mpy4_inst_mult_23_U35 ( .A(my_dp_mpy4_inst_mult_23_n55), .B(
        my_dp_mpy4_inst_mult_23_n60), .CI(my_dp_mpy4_inst_mult_23_n53), .CO(
        my_dp_mpy4_inst_mult_23_n50), .S(my_dp_mpy4_inst_mult_23_n51) );
  FA_X1 my_dp_mpy4_inst_mult_23_U33 ( .A(my_dp_mpy4_inst_mult_23_n128), .B(
        my_dp_mpy4_inst_mult_23_n49), .CI(my_dp_mpy4_inst_mult_23_n112), .CO(
        my_dp_mpy4_inst_mult_23_n46), .S(my_dp_mpy4_inst_mult_23_n47) );
  FA_X1 my_dp_mpy4_inst_mult_23_U32 ( .A(my_dp_mpy4_inst_mult_23_n56), .B(
        my_dp_mpy4_inst_mult_23_n120), .CI(my_dp_mpy4_inst_mult_23_n54), .CO(
        my_dp_mpy4_inst_mult_23_n44), .S(my_dp_mpy4_inst_mult_23_n45) );
  FA_X1 my_dp_mpy4_inst_mult_23_U31 ( .A(my_dp_mpy4_inst_mult_23_n52), .B(
        my_dp_mpy4_inst_mult_23_n47), .CI(my_dp_mpy4_inst_mult_23_n45), .CO(
        my_dp_mpy4_inst_mult_23_n42), .S(my_dp_mpy4_inst_mult_23_n43) );
  FA_X1 my_dp_mpy4_inst_mult_23_U30 ( .A(my_dp_mpy4_inst_mult_23_n104), .B(
        my_dp_mpy4_inst_mult_23_n289), .CI(my_dp_mpy4_inst_mult_23_n119), .CO(
        my_dp_mpy4_inst_mult_23_n40), .S(my_dp_mpy4_inst_mult_23_n41) );
  FA_X1 my_dp_mpy4_inst_mult_23_U29 ( .A(my_dp_mpy4_inst_mult_23_n279), .B(
        my_dp_mpy4_inst_mult_23_n111), .CI(my_dp_mpy4_inst_mult_23_n46), .CO(
        my_dp_mpy4_inst_mult_23_n38), .S(my_dp_mpy4_inst_mult_23_n39) );
  FA_X1 my_dp_mpy4_inst_mult_23_U28 ( .A(my_dp_mpy4_inst_mult_23_n44), .B(
        my_dp_mpy4_inst_mult_23_n41), .CI(my_dp_mpy4_inst_mult_23_n39), .CO(
        my_dp_mpy4_inst_mult_23_n36), .S(my_dp_mpy4_inst_mult_23_n37) );
  FA_X1 my_dp_mpy4_inst_mult_23_U26 ( .A(my_dp_mpy4_inst_mult_23_n118), .B(
        my_dp_mpy4_inst_mult_23_n35), .CI(my_dp_mpy4_inst_mult_23_n110), .CO(
        my_dp_mpy4_inst_mult_23_n32), .S(my_dp_mpy4_inst_mult_23_n33) );
  FA_X1 my_dp_mpy4_inst_mult_23_U25 ( .A(my_dp_mpy4_inst_mult_23_n33), .B(
        my_dp_mpy4_inst_mult_23_n40), .CI(my_dp_mpy4_inst_mult_23_n38), .CO(
        my_dp_mpy4_inst_mult_23_n30), .S(my_dp_mpy4_inst_mult_23_n31) );
  FA_X1 my_dp_mpy4_inst_mult_23_U24 ( .A(my_dp_mpy4_inst_mult_23_n103), .B(
        my_dp_mpy4_inst_mult_23_n286), .CI(my_dp_mpy4_inst_mult_23_n109), .CO(
        my_dp_mpy4_inst_mult_23_n28), .S(my_dp_mpy4_inst_mult_23_n29) );
  FA_X1 my_dp_mpy4_inst_mult_23_U23 ( .A(my_dp_mpy4_inst_mult_23_n32), .B(
        my_dp_mpy4_inst_mult_23_n280), .CI(my_dp_mpy4_inst_mult_23_n29), .CO(
        my_dp_mpy4_inst_mult_23_n26), .S(my_dp_mpy4_inst_mult_23_n27) );
  FA_X1 my_dp_mpy4_inst_mult_23_U21 ( .A(my_dp_mpy4_inst_mult_23_n108), .B(
        my_dp_mpy4_inst_mult_23_n25), .CI(my_dp_mpy4_inst_mult_23_n28), .CO(
        my_dp_mpy4_inst_mult_23_n22), .S(my_dp_mpy4_inst_mult_23_n23) );
  FA_X1 my_dp_mpy4_inst_mult_23_U20 ( .A(my_dp_mpy4_inst_mult_23_n102), .B(
        my_dp_mpy4_inst_mult_23_n283), .CI(my_dp_mpy4_inst_mult_23_n281), .CO(
        my_dp_mpy4_inst_mult_23_n20), .S(my_dp_mpy4_inst_mult_23_n21) );
  FA_X1 my_dp_mpy4_inst_mult_23_U8 ( .A(my_dp_mpy4_inst_mult_23_n37), .B(
        my_dp_mpy4_inst_mult_23_n42), .CI(my_dp_mpy4_inst_mult_23_n8), .CO(
        my_dp_mpy4_inst_mult_23_n7), .S(my_dp_mpy_4__3_) );
  FA_X1 my_dp_mpy4_inst_mult_23_U7 ( .A(my_dp_mpy4_inst_mult_23_n31), .B(
        my_dp_mpy4_inst_mult_23_n36), .CI(my_dp_mpy4_inst_mult_23_n7), .CO(
        my_dp_mpy4_inst_mult_23_n6), .S(my_dp_mpy_4__4_) );
  FA_X1 my_dp_mpy4_inst_mult_23_U6 ( .A(my_dp_mpy4_inst_mult_23_n27), .B(
        my_dp_mpy4_inst_mult_23_n30), .CI(my_dp_mpy4_inst_mult_23_n6), .CO(
        my_dp_mpy4_inst_mult_23_n5), .S(my_dp_mpy_4__5_) );
  FA_X1 my_dp_mpy4_inst_mult_23_U5 ( .A(my_dp_mpy4_inst_mult_23_n23), .B(
        my_dp_mpy4_inst_mult_23_n26), .CI(my_dp_mpy4_inst_mult_23_n5), .CO(
        my_dp_mpy4_inst_mult_23_n4), .S(my_dp_mpy_4__6_) );
  FA_X1 my_dp_mpy4_inst_mult_23_U4 ( .A(my_dp_mpy4_inst_mult_23_n22), .B(
        my_dp_mpy4_inst_mult_23_n21), .CI(my_dp_mpy4_inst_mult_23_n4), .CO(
        my_dp_mpy4_inst_mult_23_n3), .S(my_dp_mpy_4__7_) );
  FA_X1 my_dp_mpy4_inst_mult_23_U3 ( .A(my_dp_mpy4_inst_mult_23_n20), .B(
        my_dp_mpy4_inst_mult_23_n19), .CI(my_dp_mpy4_inst_mult_23_n3), .CO(
        my_dp_mpy4_inst_mult_23_n2), .S(my_dp_mpy_4__8_) );
  AOI22_X1 my_dp_rin_inst_U23 ( .A1(DIN[8]), .A2(my_dp_rin_inst_n12), .B1(
        my_dp_rin[8]), .B2(my_dp_rin_inst_n13), .ZN(my_dp_rin_inst_n21) );
  INV_X1 my_dp_rin_inst_U22 ( .A(my_dp_rin_inst_n21), .ZN(my_dp_rin_inst_n1)
         );
  AOI22_X1 my_dp_rin_inst_U21 ( .A1(DIN[7]), .A2(my_dp_rin_inst_n12), .B1(
        my_dp_rin[7]), .B2(my_dp_rin_inst_n13), .ZN(my_dp_rin_inst_n20) );
  INV_X1 my_dp_rin_inst_U20 ( .A(my_dp_rin_inst_n20), .ZN(my_dp_rin_inst_n2)
         );
  AOI22_X1 my_dp_rin_inst_U19 ( .A1(DIN[6]), .A2(my_dp_rin_inst_n12), .B1(
        my_dp_rin[6]), .B2(my_dp_rin_inst_n13), .ZN(my_dp_rin_inst_n19) );
  INV_X1 my_dp_rin_inst_U18 ( .A(my_dp_rin_inst_n19), .ZN(my_dp_rin_inst_n3)
         );
  AOI22_X1 my_dp_rin_inst_U17 ( .A1(DIN[5]), .A2(my_dp_rin_inst_n12), .B1(
        my_dp_rin[5]), .B2(my_dp_rin_inst_n13), .ZN(my_dp_rin_inst_n18) );
  INV_X1 my_dp_rin_inst_U16 ( .A(my_dp_rin_inst_n18), .ZN(my_dp_rin_inst_n4)
         );
  AOI22_X1 my_dp_rin_inst_U15 ( .A1(DIN[4]), .A2(my_dp_rin_inst_n12), .B1(
        my_dp_rin[4]), .B2(my_dp_rin_inst_n13), .ZN(my_dp_rin_inst_n17) );
  INV_X1 my_dp_rin_inst_U14 ( .A(my_dp_rin_inst_n17), .ZN(my_dp_rin_inst_n5)
         );
  AOI22_X1 my_dp_rin_inst_U13 ( .A1(DIN[3]), .A2(my_dp_rin_inst_n12), .B1(
        my_dp_rin[3]), .B2(my_dp_rin_inst_n13), .ZN(my_dp_rin_inst_n16) );
  INV_X1 my_dp_rin_inst_U12 ( .A(my_dp_rin_inst_n16), .ZN(my_dp_rin_inst_n6)
         );
  AOI22_X1 my_dp_rin_inst_U11 ( .A1(DIN[2]), .A2(my_dp_rin_inst_n12), .B1(
        my_dp_rin[2]), .B2(my_dp_rin_inst_n13), .ZN(my_dp_rin_inst_n15) );
  INV_X1 my_dp_rin_inst_U10 ( .A(my_dp_rin_inst_n15), .ZN(my_dp_rin_inst_n7)
         );
  AOI22_X1 my_dp_rin_inst_U9 ( .A1(DIN[1]), .A2(my_dp_rin_inst_n12), .B1(
        my_dp_rin[1]), .B2(my_dp_rin_inst_n13), .ZN(my_dp_rin_inst_n14) );
  INV_X1 my_dp_rin_inst_U8 ( .A(my_dp_rin_inst_n14), .ZN(my_dp_rin_inst_n8) );
  AOI22_X1 my_dp_rin_inst_U7 ( .A1(DIN[0]), .A2(my_dp_rin_inst_n12), .B1(
        my_dp_rin[0]), .B2(my_dp_rin_inst_n13), .ZN(my_dp_rin_inst_n11) );
  INV_X1 my_dp_rin_inst_U6 ( .A(my_dp_rin_inst_n11), .ZN(my_dp_rin_inst_n9) );
  INV_X1 my_dp_rin_inst_U5 ( .A(logic_enable1), .ZN(my_dp_rin_inst_n10) );
  NOR2_X1 my_dp_rin_inst_U4 ( .A1(logic_enable1), .A2(my_dp_rin_inst_n10), 
        .ZN(my_dp_rin_inst_n13) );
  NOR2_X1 my_dp_rin_inst_U3 ( .A1(my_dp_rin_inst_n10), .A2(my_dp_rin_inst_n13), 
        .ZN(my_dp_rin_inst_n12) );
  DFF_X1 my_dp_rin_inst_d_out_reg_0_ ( .D(my_dp_rin_inst_n9), .CK(CLK), .Q(
        my_dp_rin[0]) );
  DFF_X1 my_dp_rin_inst_d_out_reg_1_ ( .D(my_dp_rin_inst_n8), .CK(CLK), .Q(
        my_dp_rin[1]) );
  DFF_X1 my_dp_rin_inst_d_out_reg_2_ ( .D(my_dp_rin_inst_n7), .CK(CLK), .Q(
        my_dp_rin[2]) );
  DFF_X1 my_dp_rin_inst_d_out_reg_3_ ( .D(my_dp_rin_inst_n6), .CK(CLK), .Q(
        my_dp_rin[3]) );
  DFF_X1 my_dp_rin_inst_d_out_reg_4_ ( .D(my_dp_rin_inst_n5), .CK(CLK), .Q(
        my_dp_rin[4]) );
  DFF_X1 my_dp_rin_inst_d_out_reg_5_ ( .D(my_dp_rin_inst_n4), .CK(CLK), .Q(
        my_dp_rin[5]) );
  DFF_X1 my_dp_rin_inst_d_out_reg_6_ ( .D(my_dp_rin_inst_n3), .CK(CLK), .Q(
        my_dp_rin[6]) );
  DFF_X1 my_dp_rin_inst_d_out_reg_7_ ( .D(my_dp_rin_inst_n2), .CK(CLK), .Q(
        my_dp_rin[7]) );
  DFF_X1 my_dp_rin_inst_d_out_reg_8_ ( .D(my_dp_rin_inst_n1), .CK(CLK), .Q(
        my_dp_rin[8]) );
  AOI22_X1 my_dp_rout_inst_U23 ( .A1(my_dp_add1[2]), .A2(my_dp_rout_inst_n31), 
        .B1(DOUT[2]), .B2(my_dp_rout_inst_n30), .ZN(my_dp_rout_inst_n28) );
  INV_X1 my_dp_rout_inst_U22 ( .A(my_dp_rout_inst_n28), .ZN(my_dp_rout_inst_n7) );
  AOI22_X1 my_dp_rout_inst_U21 ( .A1(my_dp_add1[1]), .A2(my_dp_rout_inst_n31), 
        .B1(DOUT[1]), .B2(my_dp_rout_inst_n30), .ZN(my_dp_rout_inst_n29) );
  INV_X1 my_dp_rout_inst_U20 ( .A(my_dp_rout_inst_n29), .ZN(my_dp_rout_inst_n8) );
  AOI22_X1 my_dp_rout_inst_U19 ( .A1(my_dp_add1[0]), .A2(my_dp_rout_inst_n31), 
        .B1(DOUT[0]), .B2(my_dp_rout_inst_n30), .ZN(my_dp_rout_inst_n32) );
  INV_X1 my_dp_rout_inst_U18 ( .A(my_dp_rout_inst_n32), .ZN(my_dp_rout_inst_n9) );
  AOI22_X1 my_dp_rout_inst_U17 ( .A1(my_dp_add1[3]), .A2(my_dp_rout_inst_n31), 
        .B1(DOUT[3]), .B2(my_dp_rout_inst_n30), .ZN(my_dp_rout_inst_n27) );
  INV_X1 my_dp_rout_inst_U16 ( .A(my_dp_rout_inst_n27), .ZN(my_dp_rout_inst_n6) );
  AOI22_X1 my_dp_rout_inst_U15 ( .A1(my_dp_add1[4]), .A2(my_dp_rout_inst_n31), 
        .B1(DOUT[4]), .B2(my_dp_rout_inst_n30), .ZN(my_dp_rout_inst_n26) );
  INV_X1 my_dp_rout_inst_U14 ( .A(my_dp_rout_inst_n26), .ZN(my_dp_rout_inst_n5) );
  AOI22_X1 my_dp_rout_inst_U13 ( .A1(my_dp_add1[5]), .A2(my_dp_rout_inst_n31), 
        .B1(DOUT[5]), .B2(my_dp_rout_inst_n30), .ZN(my_dp_rout_inst_n25) );
  INV_X1 my_dp_rout_inst_U12 ( .A(my_dp_rout_inst_n25), .ZN(my_dp_rout_inst_n4) );
  AOI22_X1 my_dp_rout_inst_U11 ( .A1(my_dp_add1[6]), .A2(my_dp_rout_inst_n31), 
        .B1(DOUT[6]), .B2(my_dp_rout_inst_n30), .ZN(my_dp_rout_inst_n24) );
  INV_X1 my_dp_rout_inst_U10 ( .A(my_dp_rout_inst_n24), .ZN(my_dp_rout_inst_n3) );
  AOI22_X1 my_dp_rout_inst_U9 ( .A1(my_dp_add1[7]), .A2(my_dp_rout_inst_n31), 
        .B1(DOUT[7]), .B2(my_dp_rout_inst_n30), .ZN(my_dp_rout_inst_n23) );
  INV_X1 my_dp_rout_inst_U8 ( .A(my_dp_rout_inst_n23), .ZN(my_dp_rout_inst_n2)
         );
  AOI22_X1 my_dp_rout_inst_U7 ( .A1(my_dp_add1[8]), .A2(my_dp_rout_inst_n31), 
        .B1(DOUT[8]), .B2(my_dp_rout_inst_n30), .ZN(my_dp_rout_inst_n22) );
  INV_X1 my_dp_rout_inst_U6 ( .A(my_dp_rout_inst_n22), .ZN(my_dp_rout_inst_n1)
         );
  NOR2_X1 my_dp_rout_inst_U5 ( .A1(logic_enable2), .A2(my_dp_rout_inst_n10), 
        .ZN(my_dp_rout_inst_n30) );
  INV_X1 my_dp_rout_inst_U4 ( .A(logic_enable1), .ZN(my_dp_rout_inst_n10) );
  NOR2_X1 my_dp_rout_inst_U3 ( .A1(my_dp_rout_inst_n10), .A2(
        my_dp_rout_inst_n30), .ZN(my_dp_rout_inst_n31) );
  DFF_X1 my_dp_rout_inst_d_out_reg_0_ ( .D(my_dp_rout_inst_n9), .CK(CLK), .Q(
        DOUT[0]) );
  DFF_X1 my_dp_rout_inst_d_out_reg_1_ ( .D(my_dp_rout_inst_n8), .CK(CLK), .Q(
        DOUT[1]) );
  DFF_X1 my_dp_rout_inst_d_out_reg_2_ ( .D(my_dp_rout_inst_n7), .CK(CLK), .Q(
        DOUT[2]) );
  DFF_X1 my_dp_rout_inst_d_out_reg_3_ ( .D(my_dp_rout_inst_n6), .CK(CLK), .Q(
        DOUT[3]) );
  DFF_X1 my_dp_rout_inst_d_out_reg_4_ ( .D(my_dp_rout_inst_n5), .CK(CLK), .Q(
        DOUT[4]) );
  DFF_X1 my_dp_rout_inst_d_out_reg_5_ ( .D(my_dp_rout_inst_n4), .CK(CLK), .Q(
        DOUT[5]) );
  DFF_X1 my_dp_rout_inst_d_out_reg_6_ ( .D(my_dp_rout_inst_n3), .CK(CLK), .Q(
        DOUT[6]) );
  DFF_X1 my_dp_rout_inst_d_out_reg_7_ ( .D(my_dp_rout_inst_n2), .CK(CLK), .Q(
        DOUT[7]) );
  DFF_X1 my_dp_rout_inst_d_out_reg_8_ ( .D(my_dp_rout_inst_n1), .CK(CLK), .Q(
        DOUT[8]) );
  AOI22_X1 my_dp_r0_inst_U23 ( .A1(my_dp_add0[1]), .A2(my_dp_r0_inst_n31), 
        .B1(my_dp_r0[1]), .B2(my_dp_r0_inst_n30), .ZN(my_dp_r0_inst_n29) );
  INV_X1 my_dp_r0_inst_U22 ( .A(my_dp_r0_inst_n29), .ZN(my_dp_r0_inst_n8) );
  AOI22_X1 my_dp_r0_inst_U21 ( .A1(my_dp_add0[2]), .A2(my_dp_r0_inst_n31), 
        .B1(my_dp_r0[2]), .B2(my_dp_r0_inst_n30), .ZN(my_dp_r0_inst_n28) );
  INV_X1 my_dp_r0_inst_U20 ( .A(my_dp_r0_inst_n28), .ZN(my_dp_r0_inst_n7) );
  AOI22_X1 my_dp_r0_inst_U19 ( .A1(my_dp_add0[0]), .A2(my_dp_r0_inst_n31), 
        .B1(my_dp_r0[0]), .B2(my_dp_r0_inst_n30), .ZN(my_dp_r0_inst_n32) );
  INV_X1 my_dp_r0_inst_U18 ( .A(my_dp_r0_inst_n32), .ZN(my_dp_r0_inst_n9) );
  AOI22_X1 my_dp_r0_inst_U17 ( .A1(my_dp_add0[3]), .A2(my_dp_r0_inst_n31), 
        .B1(my_dp_r0[3]), .B2(my_dp_r0_inst_n30), .ZN(my_dp_r0_inst_n27) );
  INV_X1 my_dp_r0_inst_U16 ( .A(my_dp_r0_inst_n27), .ZN(my_dp_r0_inst_n6) );
  AOI22_X1 my_dp_r0_inst_U15 ( .A1(my_dp_add0[4]), .A2(my_dp_r0_inst_n31), 
        .B1(my_dp_r0[4]), .B2(my_dp_r0_inst_n30), .ZN(my_dp_r0_inst_n26) );
  INV_X1 my_dp_r0_inst_U14 ( .A(my_dp_r0_inst_n26), .ZN(my_dp_r0_inst_n5) );
  AOI22_X1 my_dp_r0_inst_U13 ( .A1(my_dp_add0[5]), .A2(my_dp_r0_inst_n31), 
        .B1(my_dp_r0[5]), .B2(my_dp_r0_inst_n30), .ZN(my_dp_r0_inst_n25) );
  INV_X1 my_dp_r0_inst_U12 ( .A(my_dp_r0_inst_n25), .ZN(my_dp_r0_inst_n4) );
  AOI22_X1 my_dp_r0_inst_U11 ( .A1(my_dp_add0[6]), .A2(my_dp_r0_inst_n31), 
        .B1(my_dp_r0[6]), .B2(my_dp_r0_inst_n30), .ZN(my_dp_r0_inst_n24) );
  INV_X1 my_dp_r0_inst_U10 ( .A(my_dp_r0_inst_n24), .ZN(my_dp_r0_inst_n3) );
  AOI22_X1 my_dp_r0_inst_U9 ( .A1(my_dp_add0[7]), .A2(my_dp_r0_inst_n31), .B1(
        my_dp_r0[7]), .B2(my_dp_r0_inst_n30), .ZN(my_dp_r0_inst_n23) );
  INV_X1 my_dp_r0_inst_U8 ( .A(my_dp_r0_inst_n23), .ZN(my_dp_r0_inst_n2) );
  AOI22_X1 my_dp_r0_inst_U7 ( .A1(my_dp_add0[8]), .A2(my_dp_r0_inst_n31), .B1(
        my_dp_r0[8]), .B2(my_dp_r0_inst_n30), .ZN(my_dp_r0_inst_n22) );
  INV_X1 my_dp_r0_inst_U6 ( .A(my_dp_r0_inst_n22), .ZN(my_dp_r0_inst_n1) );
  NOR2_X1 my_dp_r0_inst_U5 ( .A1(logic_enable2), .A2(my_dp_r0_inst_n10), .ZN(
        my_dp_r0_inst_n30) );
  INV_X1 my_dp_r0_inst_U4 ( .A(logic_enable1), .ZN(my_dp_r0_inst_n10) );
  NOR2_X1 my_dp_r0_inst_U3 ( .A1(my_dp_r0_inst_n10), .A2(my_dp_r0_inst_n30), 
        .ZN(my_dp_r0_inst_n31) );
  DFF_X1 my_dp_r0_inst_d_out_reg_0_ ( .D(my_dp_r0_inst_n9), .CK(CLK), .Q(
        my_dp_r0[0]) );
  DFF_X1 my_dp_r0_inst_d_out_reg_1_ ( .D(my_dp_r0_inst_n8), .CK(CLK), .Q(
        my_dp_r0[1]) );
  DFF_X1 my_dp_r0_inst_d_out_reg_2_ ( .D(my_dp_r0_inst_n7), .CK(CLK), .Q(
        my_dp_r0[2]) );
  DFF_X1 my_dp_r0_inst_d_out_reg_3_ ( .D(my_dp_r0_inst_n6), .CK(CLK), .Q(
        my_dp_r0[3]) );
  DFF_X1 my_dp_r0_inst_d_out_reg_4_ ( .D(my_dp_r0_inst_n5), .CK(CLK), .Q(
        my_dp_r0[4]) );
  DFF_X1 my_dp_r0_inst_d_out_reg_5_ ( .D(my_dp_r0_inst_n4), .CK(CLK), .Q(
        my_dp_r0[5]) );
  DFF_X1 my_dp_r0_inst_d_out_reg_6_ ( .D(my_dp_r0_inst_n3), .CK(CLK), .Q(
        my_dp_r0[6]) );
  DFF_X1 my_dp_r0_inst_d_out_reg_7_ ( .D(my_dp_r0_inst_n2), .CK(CLK), .Q(
        my_dp_r0[7]) );
  DFF_X1 my_dp_r0_inst_d_out_reg_8_ ( .D(my_dp_r0_inst_n1), .CK(CLK), .Q(
        my_dp_r0[8]) );
  AOI22_X1 my_dp_r1_inst_U23 ( .A1(my_dp_r0[8]), .A2(my_dp_r1_inst_n31), .B1(
        my_dp_r1[8]), .B2(my_dp_r1_inst_n30), .ZN(my_dp_r1_inst_n22) );
  INV_X1 my_dp_r1_inst_U22 ( .A(my_dp_r1_inst_n22), .ZN(my_dp_r1_inst_n1) );
  AOI22_X1 my_dp_r1_inst_U21 ( .A1(my_dp_r0[7]), .A2(my_dp_r1_inst_n31), .B1(
        my_dp_r1[7]), .B2(my_dp_r1_inst_n30), .ZN(my_dp_r1_inst_n23) );
  INV_X1 my_dp_r1_inst_U20 ( .A(my_dp_r1_inst_n23), .ZN(my_dp_r1_inst_n2) );
  AOI22_X1 my_dp_r1_inst_U19 ( .A1(my_dp_r0[6]), .A2(my_dp_r1_inst_n31), .B1(
        my_dp_r1[6]), .B2(my_dp_r1_inst_n30), .ZN(my_dp_r1_inst_n24) );
  INV_X1 my_dp_r1_inst_U18 ( .A(my_dp_r1_inst_n24), .ZN(my_dp_r1_inst_n3) );
  AOI22_X1 my_dp_r1_inst_U17 ( .A1(my_dp_r0[5]), .A2(my_dp_r1_inst_n31), .B1(
        my_dp_r1[5]), .B2(my_dp_r1_inst_n30), .ZN(my_dp_r1_inst_n25) );
  INV_X1 my_dp_r1_inst_U16 ( .A(my_dp_r1_inst_n25), .ZN(my_dp_r1_inst_n4) );
  AOI22_X1 my_dp_r1_inst_U15 ( .A1(my_dp_r0[4]), .A2(my_dp_r1_inst_n31), .B1(
        my_dp_r1[4]), .B2(my_dp_r1_inst_n30), .ZN(my_dp_r1_inst_n26) );
  INV_X1 my_dp_r1_inst_U14 ( .A(my_dp_r1_inst_n26), .ZN(my_dp_r1_inst_n5) );
  AOI22_X1 my_dp_r1_inst_U13 ( .A1(my_dp_r0[3]), .A2(my_dp_r1_inst_n31), .B1(
        my_dp_r1[3]), .B2(my_dp_r1_inst_n30), .ZN(my_dp_r1_inst_n27) );
  INV_X1 my_dp_r1_inst_U12 ( .A(my_dp_r1_inst_n27), .ZN(my_dp_r1_inst_n6) );
  AOI22_X1 my_dp_r1_inst_U11 ( .A1(my_dp_r0[1]), .A2(my_dp_r1_inst_n31), .B1(
        my_dp_r1[1]), .B2(my_dp_r1_inst_n30), .ZN(my_dp_r1_inst_n29) );
  INV_X1 my_dp_r1_inst_U10 ( .A(my_dp_r1_inst_n29), .ZN(my_dp_r1_inst_n8) );
  AOI22_X1 my_dp_r1_inst_U9 ( .A1(my_dp_r0[2]), .A2(my_dp_r1_inst_n31), .B1(
        my_dp_r1[2]), .B2(my_dp_r1_inst_n30), .ZN(my_dp_r1_inst_n28) );
  INV_X1 my_dp_r1_inst_U8 ( .A(my_dp_r1_inst_n28), .ZN(my_dp_r1_inst_n7) );
  AOI22_X1 my_dp_r1_inst_U7 ( .A1(my_dp_r0[0]), .A2(my_dp_r1_inst_n31), .B1(
        my_dp_r1[0]), .B2(my_dp_r1_inst_n30), .ZN(my_dp_r1_inst_n32) );
  INV_X1 my_dp_r1_inst_U6 ( .A(my_dp_r1_inst_n32), .ZN(my_dp_r1_inst_n9) );
  NOR2_X1 my_dp_r1_inst_U5 ( .A1(logic_enable2), .A2(my_dp_r1_inst_n10), .ZN(
        my_dp_r1_inst_n30) );
  INV_X1 my_dp_r1_inst_U4 ( .A(logic_enable1), .ZN(my_dp_r1_inst_n10) );
  NOR2_X1 my_dp_r1_inst_U3 ( .A1(my_dp_r1_inst_n10), .A2(my_dp_r1_inst_n30), 
        .ZN(my_dp_r1_inst_n31) );
  DFF_X1 my_dp_r1_inst_d_out_reg_0_ ( .D(my_dp_r1_inst_n9), .CK(CLK), .Q(
        my_dp_r1[0]) );
  DFF_X1 my_dp_r1_inst_d_out_reg_1_ ( .D(my_dp_r1_inst_n8), .CK(CLK), .Q(
        my_dp_r1[1]) );
  DFF_X1 my_dp_r1_inst_d_out_reg_2_ ( .D(my_dp_r1_inst_n7), .CK(CLK), .Q(
        my_dp_r1[2]) );
  DFF_X1 my_dp_r1_inst_d_out_reg_3_ ( .D(my_dp_r1_inst_n6), .CK(CLK), .Q(
        my_dp_r1[3]) );
  DFF_X1 my_dp_r1_inst_d_out_reg_4_ ( .D(my_dp_r1_inst_n5), .CK(CLK), .Q(
        my_dp_r1[4]) );
  DFF_X1 my_dp_r1_inst_d_out_reg_5_ ( .D(my_dp_r1_inst_n4), .CK(CLK), .Q(
        my_dp_r1[5]) );
  DFF_X1 my_dp_r1_inst_d_out_reg_6_ ( .D(my_dp_r1_inst_n3), .CK(CLK), .Q(
        my_dp_r1[6]) );
  DFF_X1 my_dp_r1_inst_d_out_reg_7_ ( .D(my_dp_r1_inst_n2), .CK(CLK), .Q(
        my_dp_r1[7]) );
  DFF_X1 my_dp_r1_inst_d_out_reg_8_ ( .D(my_dp_r1_inst_n1), .CK(CLK), .Q(
        my_dp_r1[8]) );
  INV_X1 my_dp_rb0_inst_U23 ( .A(1'b1), .ZN(my_dp_rb0_inst_n10) );
  AOI22_X1 my_dp_rb0_inst_U22 ( .A1(B0[8]), .A2(my_dp_rb0_inst_n31), .B1(
        my_dp_coeff[44]), .B2(my_dp_rb0_inst_n30), .ZN(my_dp_rb0_inst_n22) );
  INV_X1 my_dp_rb0_inst_U21 ( .A(my_dp_rb0_inst_n22), .ZN(my_dp_rb0_inst_n1)
         );
  AOI22_X1 my_dp_rb0_inst_U20 ( .A1(B0[6]), .A2(my_dp_rb0_inst_n31), .B1(
        my_dp_coeff[42]), .B2(my_dp_rb0_inst_n30), .ZN(my_dp_rb0_inst_n24) );
  INV_X1 my_dp_rb0_inst_U19 ( .A(my_dp_rb0_inst_n24), .ZN(my_dp_rb0_inst_n3)
         );
  AOI22_X1 my_dp_rb0_inst_U18 ( .A1(B0[4]), .A2(my_dp_rb0_inst_n31), .B1(
        my_dp_coeff[40]), .B2(my_dp_rb0_inst_n30), .ZN(my_dp_rb0_inst_n26) );
  INV_X1 my_dp_rb0_inst_U17 ( .A(my_dp_rb0_inst_n26), .ZN(my_dp_rb0_inst_n5)
         );
  AOI22_X1 my_dp_rb0_inst_U16 ( .A1(B0[2]), .A2(my_dp_rb0_inst_n31), .B1(
        my_dp_coeff[38]), .B2(my_dp_rb0_inst_n30), .ZN(my_dp_rb0_inst_n28) );
  INV_X1 my_dp_rb0_inst_U15 ( .A(my_dp_rb0_inst_n28), .ZN(my_dp_rb0_inst_n7)
         );
  AOI22_X1 my_dp_rb0_inst_U14 ( .A1(B0[1]), .A2(my_dp_rb0_inst_n31), .B1(
        my_dp_coeff[37]), .B2(my_dp_rb0_inst_n30), .ZN(my_dp_rb0_inst_n29) );
  INV_X1 my_dp_rb0_inst_U13 ( .A(my_dp_rb0_inst_n29), .ZN(my_dp_rb0_inst_n8)
         );
  AOI22_X1 my_dp_rb0_inst_U12 ( .A1(B0[0]), .A2(my_dp_rb0_inst_n31), .B1(
        my_dp_coeff[36]), .B2(my_dp_rb0_inst_n30), .ZN(my_dp_rb0_inst_n32) );
  INV_X1 my_dp_rb0_inst_U11 ( .A(my_dp_rb0_inst_n32), .ZN(my_dp_rb0_inst_n9)
         );
  AOI22_X1 my_dp_rb0_inst_U10 ( .A1(B0[7]), .A2(my_dp_rb0_inst_n31), .B1(
        my_dp_coeff[43]), .B2(my_dp_rb0_inst_n30), .ZN(my_dp_rb0_inst_n23) );
  INV_X1 my_dp_rb0_inst_U9 ( .A(my_dp_rb0_inst_n23), .ZN(my_dp_rb0_inst_n2) );
  AOI22_X1 my_dp_rb0_inst_U8 ( .A1(B0[5]), .A2(my_dp_rb0_inst_n31), .B1(
        my_dp_coeff[41]), .B2(my_dp_rb0_inst_n30), .ZN(my_dp_rb0_inst_n25) );
  INV_X1 my_dp_rb0_inst_U7 ( .A(my_dp_rb0_inst_n25), .ZN(my_dp_rb0_inst_n4) );
  AOI22_X1 my_dp_rb0_inst_U6 ( .A1(B0[3]), .A2(my_dp_rb0_inst_n31), .B1(
        my_dp_coeff[39]), .B2(my_dp_rb0_inst_n30), .ZN(my_dp_rb0_inst_n27) );
  INV_X1 my_dp_rb0_inst_U5 ( .A(my_dp_rb0_inst_n27), .ZN(my_dp_rb0_inst_n6) );
  NOR2_X1 my_dp_rb0_inst_U4 ( .A1(my_dp_rb0_inst_n10), .A2(my_dp_rb0_inst_n30), 
        .ZN(my_dp_rb0_inst_n31) );
  NOR2_X1 my_dp_rb0_inst_U3 ( .A1(logic_enable3), .A2(my_dp_rb0_inst_n10), 
        .ZN(my_dp_rb0_inst_n30) );
  DFF_X1 my_dp_rb0_inst_d_out_reg_0_ ( .D(my_dp_rb0_inst_n9), .CK(CLK), .Q(
        my_dp_coeff[36]) );
  DFF_X1 my_dp_rb0_inst_d_out_reg_1_ ( .D(my_dp_rb0_inst_n8), .CK(CLK), .Q(
        my_dp_coeff[37]) );
  DFF_X1 my_dp_rb0_inst_d_out_reg_2_ ( .D(my_dp_rb0_inst_n7), .CK(CLK), .Q(
        my_dp_coeff[38]) );
  DFF_X1 my_dp_rb0_inst_d_out_reg_3_ ( .D(my_dp_rb0_inst_n6), .CK(CLK), .Q(
        my_dp_coeff[39]) );
  DFF_X1 my_dp_rb0_inst_d_out_reg_4_ ( .D(my_dp_rb0_inst_n5), .CK(CLK), .Q(
        my_dp_coeff[40]) );
  DFF_X1 my_dp_rb0_inst_d_out_reg_5_ ( .D(my_dp_rb0_inst_n4), .CK(CLK), .Q(
        my_dp_coeff[41]) );
  DFF_X1 my_dp_rb0_inst_d_out_reg_6_ ( .D(my_dp_rb0_inst_n3), .CK(CLK), .Q(
        my_dp_coeff[42]) );
  DFF_X1 my_dp_rb0_inst_d_out_reg_7_ ( .D(my_dp_rb0_inst_n2), .CK(CLK), .Q(
        my_dp_coeff[43]) );
  DFF_X1 my_dp_rb0_inst_d_out_reg_8_ ( .D(my_dp_rb0_inst_n1), .CK(CLK), .Q(
        my_dp_coeff[44]) );
  INV_X1 my_dp_ra1_inst_U23 ( .A(1'b1), .ZN(my_dp_ra1_inst_n10) );
  AOI22_X1 my_dp_ra1_inst_U22 ( .A1(A1[8]), .A2(my_dp_ra1_inst_n31), .B1(
        my_dp_coeff[35]), .B2(my_dp_ra1_inst_n30), .ZN(my_dp_ra1_inst_n22) );
  INV_X1 my_dp_ra1_inst_U21 ( .A(my_dp_ra1_inst_n22), .ZN(my_dp_ra1_inst_n1)
         );
  AOI22_X1 my_dp_ra1_inst_U20 ( .A1(A1[6]), .A2(my_dp_ra1_inst_n31), .B1(
        my_dp_coeff[33]), .B2(my_dp_ra1_inst_n30), .ZN(my_dp_ra1_inst_n24) );
  INV_X1 my_dp_ra1_inst_U19 ( .A(my_dp_ra1_inst_n24), .ZN(my_dp_ra1_inst_n3)
         );
  AOI22_X1 my_dp_ra1_inst_U18 ( .A1(A1[4]), .A2(my_dp_ra1_inst_n31), .B1(
        my_dp_coeff[31]), .B2(my_dp_ra1_inst_n30), .ZN(my_dp_ra1_inst_n26) );
  INV_X1 my_dp_ra1_inst_U17 ( .A(my_dp_ra1_inst_n26), .ZN(my_dp_ra1_inst_n5)
         );
  AOI22_X1 my_dp_ra1_inst_U16 ( .A1(A1[2]), .A2(my_dp_ra1_inst_n31), .B1(
        my_dp_coeff[29]), .B2(my_dp_ra1_inst_n30), .ZN(my_dp_ra1_inst_n28) );
  INV_X1 my_dp_ra1_inst_U15 ( .A(my_dp_ra1_inst_n28), .ZN(my_dp_ra1_inst_n7)
         );
  AOI22_X1 my_dp_ra1_inst_U14 ( .A1(A1[1]), .A2(my_dp_ra1_inst_n31), .B1(
        my_dp_coeff[28]), .B2(my_dp_ra1_inst_n30), .ZN(my_dp_ra1_inst_n29) );
  INV_X1 my_dp_ra1_inst_U13 ( .A(my_dp_ra1_inst_n29), .ZN(my_dp_ra1_inst_n8)
         );
  AOI22_X1 my_dp_ra1_inst_U12 ( .A1(A1[0]), .A2(my_dp_ra1_inst_n31), .B1(
        my_dp_coeff[27]), .B2(my_dp_ra1_inst_n30), .ZN(my_dp_ra1_inst_n32) );
  INV_X1 my_dp_ra1_inst_U11 ( .A(my_dp_ra1_inst_n32), .ZN(my_dp_ra1_inst_n9)
         );
  AOI22_X1 my_dp_ra1_inst_U10 ( .A1(A1[7]), .A2(my_dp_ra1_inst_n31), .B1(
        my_dp_coeff[34]), .B2(my_dp_ra1_inst_n30), .ZN(my_dp_ra1_inst_n23) );
  INV_X1 my_dp_ra1_inst_U9 ( .A(my_dp_ra1_inst_n23), .ZN(my_dp_ra1_inst_n2) );
  AOI22_X1 my_dp_ra1_inst_U8 ( .A1(A1[5]), .A2(my_dp_ra1_inst_n31), .B1(
        my_dp_coeff[32]), .B2(my_dp_ra1_inst_n30), .ZN(my_dp_ra1_inst_n25) );
  INV_X1 my_dp_ra1_inst_U7 ( .A(my_dp_ra1_inst_n25), .ZN(my_dp_ra1_inst_n4) );
  AOI22_X1 my_dp_ra1_inst_U6 ( .A1(A1[3]), .A2(my_dp_ra1_inst_n31), .B1(
        my_dp_coeff[30]), .B2(my_dp_ra1_inst_n30), .ZN(my_dp_ra1_inst_n27) );
  INV_X1 my_dp_ra1_inst_U5 ( .A(my_dp_ra1_inst_n27), .ZN(my_dp_ra1_inst_n6) );
  NOR2_X1 my_dp_ra1_inst_U4 ( .A1(my_dp_ra1_inst_n10), .A2(my_dp_ra1_inst_n30), 
        .ZN(my_dp_ra1_inst_n31) );
  NOR2_X1 my_dp_ra1_inst_U3 ( .A1(logic_enable3), .A2(my_dp_ra1_inst_n10), 
        .ZN(my_dp_ra1_inst_n30) );
  DFF_X1 my_dp_ra1_inst_d_out_reg_0_ ( .D(my_dp_ra1_inst_n9), .CK(CLK), .Q(
        my_dp_coeff[27]) );
  DFF_X1 my_dp_ra1_inst_d_out_reg_1_ ( .D(my_dp_ra1_inst_n8), .CK(CLK), .Q(
        my_dp_coeff[28]) );
  DFF_X1 my_dp_ra1_inst_d_out_reg_2_ ( .D(my_dp_ra1_inst_n7), .CK(CLK), .Q(
        my_dp_coeff[29]) );
  DFF_X1 my_dp_ra1_inst_d_out_reg_3_ ( .D(my_dp_ra1_inst_n6), .CK(CLK), .Q(
        my_dp_coeff[30]) );
  DFF_X1 my_dp_ra1_inst_d_out_reg_4_ ( .D(my_dp_ra1_inst_n5), .CK(CLK), .Q(
        my_dp_coeff[31]) );
  DFF_X1 my_dp_ra1_inst_d_out_reg_5_ ( .D(my_dp_ra1_inst_n4), .CK(CLK), .Q(
        my_dp_coeff[32]) );
  DFF_X1 my_dp_ra1_inst_d_out_reg_6_ ( .D(my_dp_ra1_inst_n3), .CK(CLK), .Q(
        my_dp_coeff[33]) );
  DFF_X1 my_dp_ra1_inst_d_out_reg_7_ ( .D(my_dp_ra1_inst_n2), .CK(CLK), .Q(
        my_dp_coeff[34]) );
  DFF_X1 my_dp_ra1_inst_d_out_reg_8_ ( .D(my_dp_ra1_inst_n1), .CK(CLK), .Q(
        my_dp_coeff[35]) );
  INV_X1 my_dp_rb1_inst_U23 ( .A(1'b1), .ZN(my_dp_rb1_inst_n10) );
  AOI22_X1 my_dp_rb1_inst_U22 ( .A1(B1[8]), .A2(my_dp_rb1_inst_n31), .B1(
        my_dp_coeff[26]), .B2(my_dp_rb1_inst_n30), .ZN(my_dp_rb1_inst_n22) );
  INV_X1 my_dp_rb1_inst_U21 ( .A(my_dp_rb1_inst_n22), .ZN(my_dp_rb1_inst_n1)
         );
  AOI22_X1 my_dp_rb1_inst_U20 ( .A1(B1[6]), .A2(my_dp_rb1_inst_n31), .B1(
        my_dp_coeff[24]), .B2(my_dp_rb1_inst_n30), .ZN(my_dp_rb1_inst_n24) );
  INV_X1 my_dp_rb1_inst_U19 ( .A(my_dp_rb1_inst_n24), .ZN(my_dp_rb1_inst_n3)
         );
  AOI22_X1 my_dp_rb1_inst_U18 ( .A1(B1[4]), .A2(my_dp_rb1_inst_n31), .B1(
        my_dp_coeff[22]), .B2(my_dp_rb1_inst_n30), .ZN(my_dp_rb1_inst_n26) );
  INV_X1 my_dp_rb1_inst_U17 ( .A(my_dp_rb1_inst_n26), .ZN(my_dp_rb1_inst_n5)
         );
  AOI22_X1 my_dp_rb1_inst_U16 ( .A1(B1[2]), .A2(my_dp_rb1_inst_n31), .B1(
        my_dp_coeff[20]), .B2(my_dp_rb1_inst_n30), .ZN(my_dp_rb1_inst_n28) );
  INV_X1 my_dp_rb1_inst_U15 ( .A(my_dp_rb1_inst_n28), .ZN(my_dp_rb1_inst_n7)
         );
  AOI22_X1 my_dp_rb1_inst_U14 ( .A1(B1[1]), .A2(my_dp_rb1_inst_n31), .B1(
        my_dp_coeff[19]), .B2(my_dp_rb1_inst_n30), .ZN(my_dp_rb1_inst_n29) );
  INV_X1 my_dp_rb1_inst_U13 ( .A(my_dp_rb1_inst_n29), .ZN(my_dp_rb1_inst_n8)
         );
  AOI22_X1 my_dp_rb1_inst_U12 ( .A1(B1[0]), .A2(my_dp_rb1_inst_n31), .B1(
        my_dp_coeff[18]), .B2(my_dp_rb1_inst_n30), .ZN(my_dp_rb1_inst_n32) );
  INV_X1 my_dp_rb1_inst_U11 ( .A(my_dp_rb1_inst_n32), .ZN(my_dp_rb1_inst_n9)
         );
  AOI22_X1 my_dp_rb1_inst_U10 ( .A1(B1[7]), .A2(my_dp_rb1_inst_n31), .B1(
        my_dp_coeff[25]), .B2(my_dp_rb1_inst_n30), .ZN(my_dp_rb1_inst_n23) );
  INV_X1 my_dp_rb1_inst_U9 ( .A(my_dp_rb1_inst_n23), .ZN(my_dp_rb1_inst_n2) );
  AOI22_X1 my_dp_rb1_inst_U8 ( .A1(B1[5]), .A2(my_dp_rb1_inst_n31), .B1(
        my_dp_coeff[23]), .B2(my_dp_rb1_inst_n30), .ZN(my_dp_rb1_inst_n25) );
  INV_X1 my_dp_rb1_inst_U7 ( .A(my_dp_rb1_inst_n25), .ZN(my_dp_rb1_inst_n4) );
  AOI22_X1 my_dp_rb1_inst_U6 ( .A1(B1[3]), .A2(my_dp_rb1_inst_n31), .B1(
        my_dp_coeff[21]), .B2(my_dp_rb1_inst_n30), .ZN(my_dp_rb1_inst_n27) );
  INV_X1 my_dp_rb1_inst_U5 ( .A(my_dp_rb1_inst_n27), .ZN(my_dp_rb1_inst_n6) );
  NOR2_X1 my_dp_rb1_inst_U4 ( .A1(my_dp_rb1_inst_n10), .A2(my_dp_rb1_inst_n30), 
        .ZN(my_dp_rb1_inst_n31) );
  NOR2_X1 my_dp_rb1_inst_U3 ( .A1(logic_enable3), .A2(my_dp_rb1_inst_n10), 
        .ZN(my_dp_rb1_inst_n30) );
  DFF_X1 my_dp_rb1_inst_d_out_reg_0_ ( .D(my_dp_rb1_inst_n9), .CK(CLK), .Q(
        my_dp_coeff[18]) );
  DFF_X1 my_dp_rb1_inst_d_out_reg_1_ ( .D(my_dp_rb1_inst_n8), .CK(CLK), .Q(
        my_dp_coeff[19]) );
  DFF_X1 my_dp_rb1_inst_d_out_reg_2_ ( .D(my_dp_rb1_inst_n7), .CK(CLK), .Q(
        my_dp_coeff[20]) );
  DFF_X1 my_dp_rb1_inst_d_out_reg_3_ ( .D(my_dp_rb1_inst_n6), .CK(CLK), .Q(
        my_dp_coeff[21]) );
  DFF_X1 my_dp_rb1_inst_d_out_reg_4_ ( .D(my_dp_rb1_inst_n5), .CK(CLK), .Q(
        my_dp_coeff[22]) );
  DFF_X1 my_dp_rb1_inst_d_out_reg_5_ ( .D(my_dp_rb1_inst_n4), .CK(CLK), .Q(
        my_dp_coeff[23]) );
  DFF_X1 my_dp_rb1_inst_d_out_reg_6_ ( .D(my_dp_rb1_inst_n3), .CK(CLK), .Q(
        my_dp_coeff[24]) );
  DFF_X1 my_dp_rb1_inst_d_out_reg_7_ ( .D(my_dp_rb1_inst_n2), .CK(CLK), .Q(
        my_dp_coeff[25]) );
  DFF_X1 my_dp_rb1_inst_d_out_reg_8_ ( .D(my_dp_rb1_inst_n1), .CK(CLK), .Q(
        my_dp_coeff[26]) );
  INV_X1 my_dp_ra2_inst_U23 ( .A(1'b1), .ZN(my_dp_ra2_inst_n10) );
  AOI22_X1 my_dp_ra2_inst_U22 ( .A1(A2[8]), .A2(my_dp_ra2_inst_n31), .B1(
        my_dp_coeff[17]), .B2(my_dp_ra2_inst_n30), .ZN(my_dp_ra2_inst_n22) );
  INV_X1 my_dp_ra2_inst_U21 ( .A(my_dp_ra2_inst_n22), .ZN(my_dp_ra2_inst_n1)
         );
  AOI22_X1 my_dp_ra2_inst_U20 ( .A1(A2[6]), .A2(my_dp_ra2_inst_n31), .B1(
        my_dp_coeff[15]), .B2(my_dp_ra2_inst_n30), .ZN(my_dp_ra2_inst_n24) );
  INV_X1 my_dp_ra2_inst_U19 ( .A(my_dp_ra2_inst_n24), .ZN(my_dp_ra2_inst_n3)
         );
  AOI22_X1 my_dp_ra2_inst_U18 ( .A1(A2[4]), .A2(my_dp_ra2_inst_n31), .B1(
        my_dp_coeff[13]), .B2(my_dp_ra2_inst_n30), .ZN(my_dp_ra2_inst_n26) );
  INV_X1 my_dp_ra2_inst_U17 ( .A(my_dp_ra2_inst_n26), .ZN(my_dp_ra2_inst_n5)
         );
  AOI22_X1 my_dp_ra2_inst_U16 ( .A1(A2[2]), .A2(my_dp_ra2_inst_n31), .B1(
        my_dp_coeff[11]), .B2(my_dp_ra2_inst_n30), .ZN(my_dp_ra2_inst_n28) );
  INV_X1 my_dp_ra2_inst_U15 ( .A(my_dp_ra2_inst_n28), .ZN(my_dp_ra2_inst_n7)
         );
  AOI22_X1 my_dp_ra2_inst_U14 ( .A1(A2[1]), .A2(my_dp_ra2_inst_n31), .B1(
        my_dp_coeff[10]), .B2(my_dp_ra2_inst_n30), .ZN(my_dp_ra2_inst_n29) );
  INV_X1 my_dp_ra2_inst_U13 ( .A(my_dp_ra2_inst_n29), .ZN(my_dp_ra2_inst_n8)
         );
  AOI22_X1 my_dp_ra2_inst_U12 ( .A1(A2[0]), .A2(my_dp_ra2_inst_n31), .B1(
        my_dp_coeff[9]), .B2(my_dp_ra2_inst_n30), .ZN(my_dp_ra2_inst_n32) );
  INV_X1 my_dp_ra2_inst_U11 ( .A(my_dp_ra2_inst_n32), .ZN(my_dp_ra2_inst_n9)
         );
  AOI22_X1 my_dp_ra2_inst_U10 ( .A1(A2[7]), .A2(my_dp_ra2_inst_n31), .B1(
        my_dp_coeff[16]), .B2(my_dp_ra2_inst_n30), .ZN(my_dp_ra2_inst_n23) );
  INV_X1 my_dp_ra2_inst_U9 ( .A(my_dp_ra2_inst_n23), .ZN(my_dp_ra2_inst_n2) );
  AOI22_X1 my_dp_ra2_inst_U8 ( .A1(A2[5]), .A2(my_dp_ra2_inst_n31), .B1(
        my_dp_coeff[14]), .B2(my_dp_ra2_inst_n30), .ZN(my_dp_ra2_inst_n25) );
  INV_X1 my_dp_ra2_inst_U7 ( .A(my_dp_ra2_inst_n25), .ZN(my_dp_ra2_inst_n4) );
  AOI22_X1 my_dp_ra2_inst_U6 ( .A1(A2[3]), .A2(my_dp_ra2_inst_n31), .B1(
        my_dp_coeff[12]), .B2(my_dp_ra2_inst_n30), .ZN(my_dp_ra2_inst_n27) );
  INV_X1 my_dp_ra2_inst_U5 ( .A(my_dp_ra2_inst_n27), .ZN(my_dp_ra2_inst_n6) );
  NOR2_X1 my_dp_ra2_inst_U4 ( .A1(my_dp_ra2_inst_n10), .A2(my_dp_ra2_inst_n30), 
        .ZN(my_dp_ra2_inst_n31) );
  NOR2_X1 my_dp_ra2_inst_U3 ( .A1(logic_enable3), .A2(my_dp_ra2_inst_n10), 
        .ZN(my_dp_ra2_inst_n30) );
  DFF_X1 my_dp_ra2_inst_d_out_reg_0_ ( .D(my_dp_ra2_inst_n9), .CK(CLK), .Q(
        my_dp_coeff[9]) );
  DFF_X1 my_dp_ra2_inst_d_out_reg_1_ ( .D(my_dp_ra2_inst_n8), .CK(CLK), .Q(
        my_dp_coeff[10]) );
  DFF_X1 my_dp_ra2_inst_d_out_reg_2_ ( .D(my_dp_ra2_inst_n7), .CK(CLK), .Q(
        my_dp_coeff[11]) );
  DFF_X1 my_dp_ra2_inst_d_out_reg_3_ ( .D(my_dp_ra2_inst_n6), .CK(CLK), .Q(
        my_dp_coeff[12]) );
  DFF_X1 my_dp_ra2_inst_d_out_reg_4_ ( .D(my_dp_ra2_inst_n5), .CK(CLK), .Q(
        my_dp_coeff[13]) );
  DFF_X1 my_dp_ra2_inst_d_out_reg_5_ ( .D(my_dp_ra2_inst_n4), .CK(CLK), .Q(
        my_dp_coeff[14]) );
  DFF_X1 my_dp_ra2_inst_d_out_reg_6_ ( .D(my_dp_ra2_inst_n3), .CK(CLK), .Q(
        my_dp_coeff[15]) );
  DFF_X1 my_dp_ra2_inst_d_out_reg_7_ ( .D(my_dp_ra2_inst_n2), .CK(CLK), .Q(
        my_dp_coeff[16]) );
  DFF_X1 my_dp_ra2_inst_d_out_reg_8_ ( .D(my_dp_ra2_inst_n1), .CK(CLK), .Q(
        my_dp_coeff[17]) );
  INV_X1 my_dp_rb2_inst_U23 ( .A(1'b1), .ZN(my_dp_rb2_inst_n10) );
  AOI22_X1 my_dp_rb2_inst_U22 ( .A1(B2[8]), .A2(my_dp_rb2_inst_n31), .B1(
        my_dp_coeff[8]), .B2(my_dp_rb2_inst_n30), .ZN(my_dp_rb2_inst_n22) );
  INV_X1 my_dp_rb2_inst_U21 ( .A(my_dp_rb2_inst_n22), .ZN(my_dp_rb2_inst_n1)
         );
  AOI22_X1 my_dp_rb2_inst_U20 ( .A1(B2[6]), .A2(my_dp_rb2_inst_n31), .B1(
        my_dp_coeff[6]), .B2(my_dp_rb2_inst_n30), .ZN(my_dp_rb2_inst_n24) );
  INV_X1 my_dp_rb2_inst_U19 ( .A(my_dp_rb2_inst_n24), .ZN(my_dp_rb2_inst_n3)
         );
  AOI22_X1 my_dp_rb2_inst_U18 ( .A1(B2[4]), .A2(my_dp_rb2_inst_n31), .B1(
        my_dp_coeff[4]), .B2(my_dp_rb2_inst_n30), .ZN(my_dp_rb2_inst_n26) );
  INV_X1 my_dp_rb2_inst_U17 ( .A(my_dp_rb2_inst_n26), .ZN(my_dp_rb2_inst_n5)
         );
  AOI22_X1 my_dp_rb2_inst_U16 ( .A1(B2[2]), .A2(my_dp_rb2_inst_n31), .B1(
        my_dp_coeff[2]), .B2(my_dp_rb2_inst_n30), .ZN(my_dp_rb2_inst_n28) );
  INV_X1 my_dp_rb2_inst_U15 ( .A(my_dp_rb2_inst_n28), .ZN(my_dp_rb2_inst_n7)
         );
  AOI22_X1 my_dp_rb2_inst_U14 ( .A1(B2[1]), .A2(my_dp_rb2_inst_n31), .B1(
        my_dp_coeff[1]), .B2(my_dp_rb2_inst_n30), .ZN(my_dp_rb2_inst_n29) );
  INV_X1 my_dp_rb2_inst_U13 ( .A(my_dp_rb2_inst_n29), .ZN(my_dp_rb2_inst_n8)
         );
  AOI22_X1 my_dp_rb2_inst_U12 ( .A1(B2[0]), .A2(my_dp_rb2_inst_n31), .B1(
        my_dp_coeff[0]), .B2(my_dp_rb2_inst_n30), .ZN(my_dp_rb2_inst_n32) );
  INV_X1 my_dp_rb2_inst_U11 ( .A(my_dp_rb2_inst_n32), .ZN(my_dp_rb2_inst_n9)
         );
  AOI22_X1 my_dp_rb2_inst_U10 ( .A1(B2[7]), .A2(my_dp_rb2_inst_n31), .B1(
        my_dp_coeff[7]), .B2(my_dp_rb2_inst_n30), .ZN(my_dp_rb2_inst_n23) );
  INV_X1 my_dp_rb2_inst_U9 ( .A(my_dp_rb2_inst_n23), .ZN(my_dp_rb2_inst_n2) );
  AOI22_X1 my_dp_rb2_inst_U8 ( .A1(B2[5]), .A2(my_dp_rb2_inst_n31), .B1(
        my_dp_coeff[5]), .B2(my_dp_rb2_inst_n30), .ZN(my_dp_rb2_inst_n25) );
  INV_X1 my_dp_rb2_inst_U7 ( .A(my_dp_rb2_inst_n25), .ZN(my_dp_rb2_inst_n4) );
  AOI22_X1 my_dp_rb2_inst_U6 ( .A1(B2[3]), .A2(my_dp_rb2_inst_n31), .B1(
        my_dp_coeff[3]), .B2(my_dp_rb2_inst_n30), .ZN(my_dp_rb2_inst_n27) );
  INV_X1 my_dp_rb2_inst_U5 ( .A(my_dp_rb2_inst_n27), .ZN(my_dp_rb2_inst_n6) );
  NOR2_X1 my_dp_rb2_inst_U4 ( .A1(my_dp_rb2_inst_n10), .A2(my_dp_rb2_inst_n30), 
        .ZN(my_dp_rb2_inst_n31) );
  NOR2_X1 my_dp_rb2_inst_U3 ( .A1(logic_enable3), .A2(my_dp_rb2_inst_n10), 
        .ZN(my_dp_rb2_inst_n30) );
  DFF_X1 my_dp_rb2_inst_d_out_reg_0_ ( .D(my_dp_rb2_inst_n9), .CK(CLK), .Q(
        my_dp_coeff[0]) );
  DFF_X1 my_dp_rb2_inst_d_out_reg_1_ ( .D(my_dp_rb2_inst_n8), .CK(CLK), .Q(
        my_dp_coeff[1]) );
  DFF_X1 my_dp_rb2_inst_d_out_reg_2_ ( .D(my_dp_rb2_inst_n7), .CK(CLK), .Q(
        my_dp_coeff[2]) );
  DFF_X1 my_dp_rb2_inst_d_out_reg_3_ ( .D(my_dp_rb2_inst_n6), .CK(CLK), .Q(
        my_dp_coeff[3]) );
  DFF_X1 my_dp_rb2_inst_d_out_reg_4_ ( .D(my_dp_rb2_inst_n5), .CK(CLK), .Q(
        my_dp_coeff[4]) );
  DFF_X1 my_dp_rb2_inst_d_out_reg_5_ ( .D(my_dp_rb2_inst_n4), .CK(CLK), .Q(
        my_dp_coeff[5]) );
  DFF_X1 my_dp_rb2_inst_d_out_reg_6_ ( .D(my_dp_rb2_inst_n3), .CK(CLK), .Q(
        my_dp_coeff[6]) );
  DFF_X1 my_dp_rb2_inst_d_out_reg_7_ ( .D(my_dp_rb2_inst_n2), .CK(CLK), .Q(
        my_dp_coeff[7]) );
  DFF_X1 my_dp_rb2_inst_d_out_reg_8_ ( .D(my_dp_rb2_inst_n1), .CK(CLK), .Q(
        my_dp_coeff[8]) );
  INV_X1 my_dp_dff_inst_U6 ( .A(logic_enable1), .ZN(my_dp_dff_inst_n1) );
  AOI22_X1 my_dp_dff_inst_U5 ( .A1(logic_enable1), .A2(logic_enable2), .B1(
        VOUT), .B2(my_dp_dff_inst_n1), .ZN(my_dp_dff_inst_n3) );
  INV_X1 my_dp_dff_inst_U4 ( .A(logic_enable1), .ZN(my_dp_dff_inst_n2) );
  NOR2_X1 my_dp_dff_inst_U3 ( .A1(my_dp_dff_inst_n3), .A2(my_dp_dff_inst_n2), 
        .ZN(my_dp_dff_inst_n4) );
  DFF_X1 my_dp_dff_inst_d_out_reg ( .D(my_dp_dff_inst_n4), .CK(CLK), .Q(VOUT)
         );
endmodule

