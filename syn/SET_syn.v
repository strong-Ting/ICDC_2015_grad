/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Sep 26 15:40:02 2020
/////////////////////////////////////////////////////////////


module SET_DW01_inc_0_DW01_inc_2 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2XL U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module SET_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n2;
  wire   [8:1] carry;

  XOR3X1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .Y(SUM[8]) );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[1]) );
  XOR2X1 U3 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X4 U1 ( .A(B[2]), .B(A[2]), .Y(SUM[2]) );
  NAND2X4 U4 ( .A(B[2]), .B(A[2]), .Y(n2) );
  CLKINVX6 U5 ( .A(n2), .Y(carry[3]) );
endmodule


module SET ( clk, rst, en, central, radius, mode, busy, valid, candidate );
  input [23:0] central;
  input [11:0] radius;
  input [1:0] mode;
  output [7:0] candidate;
  input clk, rst, en;
  output busy, valid;
  wire   n665, n666, n667, n668, n669, n670, n671, n672, union_A, union_B,
         union_C, N121, N122, N123, N124, N125, N126, N129, N130, N131, N132,
         N133, N134, N143, N144, N145, N146, N147, N148, N149, N150, N151,
         N153, N155, N156, N157, N158, N159, N160, N161, N163, N164, N165,
         N166, N167, N168, N189, N190, N191, N192, N193, N194, N197, N198,
         N199, N200, N201, N202, N382, N383, N384, N385, N386, N387, N388,
         N389, n230, n231, n232, n233, n234, n235, n236, n237, n239, n240,
         n241, n242, n243, n244, n245, n246, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n298, n299, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n328, n329, n330, n331, n332, n333, n334, n335, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, \mult_277/n13 ,
         \mult_277/n12 , \mult_277/n10 , \mult_277/n9 , \mult_277/n8 ,
         \mult_277/n7 , \mult_277/n5 , \mult_277/n4 , \mult_277/n3 ,
         \mult_277/n2 , \mult_277/n1 , \mult_297/n13 , \mult_297/n12 ,
         \mult_297/n10 , \mult_297/n9 , \mult_297/n8 , \mult_297/n7 ,
         \mult_297/n5 , \mult_297/n4 , \mult_297/n3 , \mult_297/n2 ,
         \mult_297/n1 , \mult_287/n13 , \mult_287/n12 , \mult_287/n10 ,
         \mult_287/n9 , \mult_287/n8 , \mult_287/n7 , \mult_287/n5 ,
         \mult_287/n4 , \mult_287/n3 , \mult_287/n2 , \mult_287/n1 ,
         \mult_278/n13 , \mult_278/n12 , \mult_278/n10 , \mult_278/n9 ,
         \mult_278/n8 , \mult_278/n7 , \mult_278/n5 , \mult_278/n4 ,
         \mult_278/n3 , \mult_278/n2 , \mult_278/n1 , \mult_298/n13 ,
         \mult_298/n12 , \mult_298/n10 , \mult_298/n9 , \mult_298/n8 ,
         \mult_298/n7 , \mult_298/n5 , \mult_298/n4 , \mult_298/n3 ,
         \mult_298/n2 , \mult_298/n1 , \mult_288/n13 , \mult_288/n12 ,
         \mult_288/n10 , \mult_288/n9 , \mult_288/n8 , \mult_288/n7 ,
         \mult_288/n5 , \mult_288/n4 , \mult_288/n3 , \mult_288/n2 ,
         \mult_288/n1 , n675, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, n475,
         n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486,
         n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497,
         n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, n508,
         n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519,
         n520, n521, n522, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n673;
  wire   [3:0] x1;
  wire   [3:0] y1;
  wire   [3:0] x2;
  wire   [3:0] y2;
  wire   [3:0] x3;
  wire   [3:0] y3;
  wire   [3:0] r1;
  wire   [3:0] r2;
  wire   [3:0] r3;
  wire   [3:0] next_state;
  wire   [3:0] x;
  wire   [3:0] y;
  wire   [3:0] x_a;
  wire   [3:0] y_b;
  wire   [8:0] a;
  wire   [8:0] b;
  assign busy = 1'b0;

  ADDHXL \mult_277/U6  ( .A(x_a[1]), .B(\mult_277/n13 ), .CO(\mult_277/n5 ), 
        .S(N121) );
  ADDHXL \mult_277/U5  ( .A(\mult_277/n12 ), .B(\mult_277/n5 ), .CO(
        \mult_277/n4 ), .S(N122) );
  ADDFXL \mult_277/U4  ( .A(\mult_277/n7 ), .B(\mult_277/n10 ), .CI(
        \mult_277/n4 ), .CO(\mult_277/n3 ), .S(N123) );
  ADDFXL \mult_277/U3  ( .A(x_a[2]), .B(\mult_277/n9 ), .CI(\mult_277/n3 ), 
        .CO(\mult_277/n2 ), .S(N124) );
  ADDFXL \mult_277/U2  ( .A(\mult_277/n8 ), .B(x_a[3]), .CI(\mult_277/n2 ), 
        .CO(\mult_277/n1 ), .S(N125) );
  ADDHXL \mult_297/U6  ( .A(x_a[1]), .B(\mult_297/n13 ), .CO(\mult_297/n5 ), 
        .S(N189) );
  ADDHXL \mult_297/U5  ( .A(\mult_297/n12 ), .B(\mult_297/n5 ), .CO(
        \mult_297/n4 ), .S(N190) );
  ADDFXL \mult_297/U4  ( .A(\mult_297/n7 ), .B(\mult_297/n10 ), .CI(
        \mult_297/n4 ), .CO(\mult_297/n3 ), .S(N191) );
  ADDFXL \mult_297/U3  ( .A(x_a[2]), .B(\mult_297/n9 ), .CI(\mult_297/n3 ), 
        .CO(\mult_297/n2 ), .S(N192) );
  ADDFXL \mult_297/U2  ( .A(\mult_297/n8 ), .B(x_a[3]), .CI(\mult_297/n2 ), 
        .CO(\mult_297/n1 ), .S(N193) );
  ADDHXL \mult_287/U6  ( .A(x_a[1]), .B(\mult_287/n13 ), .CO(\mult_287/n5 ), 
        .S(N155) );
  ADDHXL \mult_287/U5  ( .A(\mult_287/n12 ), .B(\mult_287/n5 ), .CO(
        \mult_287/n4 ), .S(N156) );
  ADDFXL \mult_287/U4  ( .A(\mult_287/n7 ), .B(\mult_287/n10 ), .CI(
        \mult_287/n4 ), .CO(\mult_287/n3 ), .S(N157) );
  ADDFXL \mult_287/U3  ( .A(x_a[2]), .B(\mult_287/n9 ), .CI(\mult_287/n3 ), 
        .CO(\mult_287/n2 ), .S(N158) );
  ADDFXL \mult_287/U2  ( .A(\mult_287/n8 ), .B(x_a[3]), .CI(\mult_287/n2 ), 
        .CO(\mult_287/n1 ), .S(N159) );
  ADDHXL \mult_278/U6  ( .A(y_b[1]), .B(\mult_278/n13 ), .CO(\mult_278/n5 ), 
        .S(N129) );
  ADDHXL \mult_278/U5  ( .A(\mult_278/n12 ), .B(\mult_278/n5 ), .CO(
        \mult_278/n4 ), .S(N130) );
  ADDFXL \mult_278/U4  ( .A(\mult_278/n7 ), .B(\mult_278/n10 ), .CI(
        \mult_278/n4 ), .CO(\mult_278/n3 ), .S(N131) );
  ADDFXL \mult_278/U3  ( .A(y_b[2]), .B(\mult_278/n9 ), .CI(\mult_278/n3 ), 
        .CO(\mult_278/n2 ), .S(N132) );
  ADDFXL \mult_278/U2  ( .A(\mult_278/n8 ), .B(y_b[3]), .CI(\mult_278/n2 ), 
        .CO(\mult_278/n1 ), .S(N133) );
  ADDHXL \mult_298/U6  ( .A(y_b[1]), .B(\mult_298/n13 ), .CO(\mult_298/n5 ), 
        .S(N197) );
  ADDHXL \mult_298/U5  ( .A(\mult_298/n12 ), .B(\mult_298/n5 ), .CO(
        \mult_298/n4 ), .S(N198) );
  ADDFXL \mult_298/U4  ( .A(\mult_298/n7 ), .B(\mult_298/n10 ), .CI(
        \mult_298/n4 ), .CO(\mult_298/n3 ), .S(N199) );
  ADDFXL \mult_298/U3  ( .A(y_b[2]), .B(\mult_298/n9 ), .CI(\mult_298/n3 ), 
        .CO(\mult_298/n2 ), .S(N200) );
  ADDFXL \mult_298/U2  ( .A(\mult_298/n8 ), .B(y_b[3]), .CI(\mult_298/n2 ), 
        .CO(\mult_298/n1 ), .S(N201) );
  ADDHXL \mult_288/U6  ( .A(y_b[1]), .B(\mult_288/n13 ), .CO(\mult_288/n5 ), 
        .S(N163) );
  ADDHXL \mult_288/U5  ( .A(\mult_288/n12 ), .B(\mult_288/n5 ), .CO(
        \mult_288/n4 ), .S(N164) );
  ADDFXL \mult_288/U4  ( .A(\mult_288/n7 ), .B(\mult_288/n10 ), .CI(
        \mult_288/n4 ), .CO(\mult_288/n3 ), .S(N165) );
  ADDFXL \mult_288/U3  ( .A(y_b[2]), .B(\mult_288/n9 ), .CI(\mult_288/n3 ), 
        .CO(\mult_288/n2 ), .S(N166) );
  ADDFXL \mult_288/U2  ( .A(\mult_288/n8 ), .B(y_b[3]), .CI(\mult_288/n2 ), 
        .CO(\mult_288/n1 ), .S(N167) );
  DFFRX1 \a_reg[8]  ( .D(n334), .CK(clk), .RN(n367), .Q(a[8]), .QN(n240) );
  DFFRX1 \b_reg[8]  ( .D(n343), .CK(clk), .RN(n367), .Q(b[8]), .QN(n231) );
  DFFRX1 \a_reg[6]  ( .D(n332), .CK(clk), .RN(n366), .Q(a[6]), .QN(n242) );
  DFFRX1 \a_reg[7]  ( .D(n333), .CK(clk), .RN(n367), .Q(a[7]), .QN(n241) );
  DFFRX1 \b_reg[6]  ( .D(n341), .CK(clk), .RN(n367), .Q(b[6]), .QN(n233) );
  DFFRX1 \b_reg[7]  ( .D(n342), .CK(clk), .RN(n367), .Q(b[7]), .QN(n232) );
  DFFRX1 \a_reg[2]  ( .D(n328), .CK(clk), .RN(n366), .Q(a[2]), .QN(n246) );
  DFFRX1 \a_reg[3]  ( .D(n329), .CK(clk), .RN(n366), .Q(a[3]), .QN(n245) );
  DFFRX1 \a_reg[4]  ( .D(n330), .CK(clk), .RN(n366), .Q(a[4]), .QN(n244) );
  DFFRX1 \a_reg[5]  ( .D(n331), .CK(clk), .RN(n366), .Q(a[5]), .QN(n243) );
  DFFRX1 \b_reg[0]  ( .D(n335), .CK(clk), .RN(n367), .Q(b[0]), .QN(n239) );
  DFFRX1 \b_reg[2]  ( .D(n337), .CK(clk), .RN(n367), .Q(b[2]), .QN(n237) );
  DFFRX1 \b_reg[3]  ( .D(n338), .CK(clk), .RN(n367), .Q(b[3]), .QN(n236) );
  DFFRX1 \b_reg[4]  ( .D(n339), .CK(clk), .RN(n367), .Q(b[4]), .QN(n235) );
  DFFRX1 \b_reg[5]  ( .D(n340), .CK(clk), .RN(n367), .Q(b[5]), .QN(n234) );
  DFFRX1 \a_reg[0]  ( .D(n344), .CK(clk), .RN(n367), .Q(a[0]), .QN(n230) );
  DFFRX1 \candidate_reg[0]  ( .D(n315), .CK(clk), .RN(n368), .Q(n672), .QN(
        n249) );
  DFFRX1 \candidate_reg[7]  ( .D(n308), .CK(clk), .RN(n368), .Q(n665), .QN(
        n256) );
  DFFRX1 \candidate_reg[6]  ( .D(n309), .CK(clk), .RN(n368), .Q(n666), .QN(
        n255) );
  DFFRX1 \candidate_reg[5]  ( .D(n310), .CK(clk), .RN(n368), .Q(n667), .QN(
        n254) );
  DFFRX1 \candidate_reg[4]  ( .D(n311), .CK(clk), .RN(n368), .Q(n668), .QN(
        n253) );
  DFFRX1 \candidate_reg[3]  ( .D(n312), .CK(clk), .RN(n368), .Q(n669), .QN(
        n252) );
  DFFRX1 \candidate_reg[2]  ( .D(n313), .CK(clk), .RN(n368), .Q(n670), .QN(
        n251) );
  DFFRX1 \candidate_reg[1]  ( .D(n314), .CK(clk), .RN(n368), .Q(n671), .QN(
        n250) );
  DFFSX1 \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .SN(n664), .Q(
        n662), .QN(n588) );
  DFFRXL \current_state_reg[3]  ( .D(next_state[3]), .CK(clk), .RN(n664), .Q(
        n663), .QN(n379) );
  DFFRXL \y2_reg[0]  ( .D(n283), .CK(clk), .RN(n664), .Q(y2[0]), .QN(n597) );
  DFFRXL \y1_reg[2]  ( .D(n289), .CK(clk), .RN(n664), .Q(y1[2]), .QN(n620) );
  DFFRXL \y1_reg[0]  ( .D(n291), .CK(clk), .RN(n664), .Q(y1[0]), .QN(n595) );
  DFFRXL \x2_reg[2]  ( .D(n285), .CK(clk), .RN(n664), .Q(x2[2]), .QN(n548) );
  DFFRXL \x2_reg[0]  ( .D(n287), .CK(clk), .RN(n664), .Q(x2[0]), .QN(n522) );
  DFFRXL \x1_reg[2]  ( .D(n293), .CK(clk), .RN(n664), .Q(x1[2]), .QN(n544) );
  DFFRXL \y3_reg[2]  ( .D(n273), .CK(clk), .RN(n664), .Q(y3[2]), .QN(n622) );
  DFFRXL \y3_reg[0]  ( .D(n275), .CK(clk), .RN(n664), .Q(y3[0]), .QN(n596) );
  DFFRXL \y2_reg[2]  ( .D(n281), .CK(clk), .RN(n664), .Q(y2[2]), .QN(n624) );
  DFFRXL \x3_reg[2]  ( .D(n277), .CK(clk), .RN(n664), .Q(x3[2]), .QN(n546) );
  DFFRXL \x3_reg[0]  ( .D(n279), .CK(clk), .RN(n664), .Q(x3[0]), .QN(n521) );
  DFFRXL \x1_reg[0]  ( .D(n259), .CK(clk), .RN(n664), .Q(x1[0]), .QN(n520) );
  DFFRXL \r3_reg[2]  ( .D(n261), .CK(clk), .RN(n664), .Q(r3[2]), .QN(n490) );
  DFFRXL \r3_reg[1]  ( .D(n262), .CK(clk), .RN(n664), .Q(r3[1]), .QN(n498) );
  DFFRXL \r3_reg[0]  ( .D(n263), .CK(clk), .RN(n664), .Q(r3[0]), .QN(n489) );
  DFFRXL \r2_reg[2]  ( .D(n265), .CK(clk), .RN(n664), .Q(r2[2]), .QN(n470) );
  DFFRXL \r2_reg[0]  ( .D(n267), .CK(clk), .RN(n664), .Q(r2[0]), .QN(n468) );
  DFFRXL \r1_reg[2]  ( .D(n269), .CK(clk), .RN(n664), .Q(r1[2]), .QN(n445) );
  DFFRXL \r1_reg[0]  ( .D(n271), .CK(clk), .RN(n664), .Q(r1[0]), .QN(n443) );
  DFFRXL \mode_buffer_reg[0]  ( .D(n258), .CK(clk), .RN(n664), .Q(n654), .QN(
        n586) );
  DFFRXL union_C_reg ( .D(n324), .CK(clk), .RN(n664), .Q(union_C), .QN(n477)
         );
  DFFRXL \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n664), .Q(
        n661), .QN(n380) );
  DFFRX1 \x_reg[3]  ( .D(n323), .CK(clk), .RN(n664), .QN(n659) );
  DFFRX2 \x_a_reg[3]  ( .D(n316), .CK(clk), .RN(n664), .Q(x_a[3]), .QN(n655)
         );
  DFFRX2 \y_b_reg[3]  ( .D(n304), .CK(clk), .RN(n664), .Q(y_b[3]), .QN(n650)
         );
  DFFRX2 \y_b_reg[2]  ( .D(n305), .CK(clk), .RN(n664), .Q(y_b[2]), .QN(n651)
         );
  DFFRX2 \x_a_reg[2]  ( .D(n317), .CK(clk), .RN(n664), .Q(x_a[2]), .QN(n656)
         );
  DFFRX2 \x_a_reg[0]  ( .D(n319), .CK(clk), .RN(n664), .Q(N153), .QN(n658) );
  DFFRX2 \y_b_reg[1]  ( .D(n306), .CK(clk), .RN(n664), .Q(y_b[1]), .QN(n652)
         );
  DFFRX2 \x_a_reg[1]  ( .D(n318), .CK(clk), .RN(n664), .Q(x_a[1]), .QN(n657)
         );
  DFFRX1 \x_reg[2]  ( .D(n299), .CK(clk), .RN(n664), .Q(x[2]), .QN(n503) );
  DFFRX1 \r2_reg[3]  ( .D(n264), .CK(clk), .RN(n664), .Q(r2[3]) );
  DFFRX1 \r1_reg[3]  ( .D(n268), .CK(clk), .RN(n664), .Q(r1[3]) );
  DFFRX1 \r3_reg[3]  ( .D(n260), .CK(clk), .RN(n664), .Q(r3[3]) );
  DFFRX1 \y_reg[2]  ( .D(n298), .CK(clk), .RN(n664), .Q(y[2]), .QN(n616) );
  DFFRX1 \y1_reg[1]  ( .D(n290), .CK(clk), .RN(n664), .Q(y1[1]) );
  DFFRX1 \x2_reg[1]  ( .D(n286), .CK(clk), .RN(n664), .Q(x2[1]) );
  DFFRX1 \x1_reg[1]  ( .D(n294), .CK(clk), .RN(n664), .Q(x1[1]) );
  DFFRX1 \y3_reg[1]  ( .D(n274), .CK(clk), .RN(n664), .Q(y3[1]) );
  DFFRX1 \y2_reg[1]  ( .D(n282), .CK(clk), .RN(n664), .Q(y2[1]) );
  DFFRX1 \x3_reg[1]  ( .D(n278), .CK(clk), .RN(n664), .Q(x3[1]) );
  DFFRX1 \mode_buffer_reg[1]  ( .D(n257), .CK(clk), .RN(n664), .Q(n649) );
  DFFRX1 \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(n664), .Q(
        n660), .QN(n383) );
  DFFRX1 \r2_reg[1]  ( .D(n266), .CK(clk), .RN(n664), .Q(r2[1]), .QN(n469) );
  DFFRX1 \r1_reg[1]  ( .D(n270), .CK(clk), .RN(n664), .Q(r1[1]), .QN(n444) );
  DFFRX1 union_A_reg ( .D(n326), .CK(clk), .RN(n664), .Q(union_A) );
  AND3X2 U319 ( .A(n587), .B(n588), .C(n383), .Y(n376) );
  AOI211XL U321 ( .A0(n443), .A1(r1[1]), .B0(r1[3]), .C0(n445), .Y(n438) );
  AOI211XL U322 ( .A0(n468), .A1(r2[1]), .B0(r2[3]), .C0(n470), .Y(n464) );
  NOR3XL U323 ( .A(y[0]), .B(y[2]), .C(y[1]), .Y(n386) );
  NAND3XL U324 ( .A(n389), .B(y[0]), .C(y[1]), .Y(n394) );
  NAND3XL U325 ( .A(x[0]), .B(n507), .C(x[1]), .Y(n502) );
  AND2XL U326 ( .A(x_a[1]), .B(N153), .Y(\mult_287/n13 ) );
  AND2XL U327 ( .A(x_a[1]), .B(N153), .Y(\mult_297/n13 ) );
  AND2XL U328 ( .A(x_a[1]), .B(N153), .Y(\mult_277/n13 ) );
  AND2XL U329 ( .A(y_b[1]), .B(N161), .Y(\mult_288/n13 ) );
  AND2XL U330 ( .A(y_b[1]), .B(N161), .Y(\mult_298/n13 ) );
  AND2XL U331 ( .A(y_b[1]), .B(N161), .Y(\mult_278/n13 ) );
  NAND2BXL U332 ( .AN(x_a[1]), .B(x_a[2]), .Y(\mult_287/n7 ) );
  NAND2BXL U333 ( .AN(x_a[1]), .B(x_a[2]), .Y(\mult_297/n7 ) );
  AND2XL U334 ( .A(x_a[2]), .B(N153), .Y(\mult_287/n12 ) );
  AND2XL U335 ( .A(x_a[2]), .B(N153), .Y(\mult_297/n12 ) );
  NAND2BXL U336 ( .AN(x_a[1]), .B(x_a[2]), .Y(\mult_277/n7 ) );
  AND2XL U337 ( .A(x_a[2]), .B(N153), .Y(\mult_277/n12 ) );
  NAND2BXL U338 ( .AN(y_b[1]), .B(y_b[2]), .Y(\mult_288/n7 ) );
  NAND2BXL U339 ( .AN(y_b[1]), .B(y_b[2]), .Y(\mult_298/n7 ) );
  AND2XL U340 ( .A(y_b[2]), .B(N161), .Y(\mult_288/n12 ) );
  AND2XL U341 ( .A(y_b[2]), .B(N161), .Y(\mult_298/n12 ) );
  NAND2BXL U342 ( .AN(y_b[1]), .B(y_b[2]), .Y(\mult_278/n7 ) );
  AND2XL U343 ( .A(y_b[2]), .B(N161), .Y(\mult_278/n12 ) );
  NAND2XL U344 ( .A(N161), .B(y_b[3]), .Y(\mult_288/n10 ) );
  NAND2XL U345 ( .A(N161), .B(y_b[3]), .Y(\mult_298/n10 ) );
  NAND2XL U346 ( .A(N161), .B(y_b[3]), .Y(\mult_278/n10 ) );
  NAND2XL U347 ( .A(y_b[3]), .B(y_b[1]), .Y(\mult_288/n9 ) );
  NAND2XL U348 ( .A(y_b[3]), .B(y_b[1]), .Y(\mult_298/n9 ) );
  NAND2XL U349 ( .A(y_b[3]), .B(y_b[1]), .Y(\mult_278/n9 ) );
  NAND2XL U350 ( .A(N153), .B(x_a[3]), .Y(\mult_287/n10 ) );
  NAND2XL U351 ( .A(N153), .B(x_a[3]), .Y(\mult_297/n10 ) );
  NAND2XL U352 ( .A(N153), .B(x_a[3]), .Y(\mult_277/n10 ) );
  NAND2XL U353 ( .A(x_a[3]), .B(x_a[1]), .Y(\mult_287/n9 ) );
  NAND2XL U354 ( .A(x_a[3]), .B(x_a[1]), .Y(\mult_297/n9 ) );
  NAND2XL U355 ( .A(x_a[3]), .B(x_a[1]), .Y(\mult_277/n9 ) );
  INVX12 U357 ( .A(rst), .Y(n664) );
  INVX3 U358 ( .A(n573), .Y(n572) );
  BUFX12 U359 ( .A(n671), .Y(candidate[1]) );
  NAND3X2 U360 ( .A(n363), .B(n362), .C(n361), .Y(n514) );
  BUFX12 U361 ( .A(n670), .Y(candidate[2]) );
  BUFX12 U362 ( .A(n669), .Y(candidate[3]) );
  BUFX12 U363 ( .A(n668), .Y(candidate[4]) );
  BUFX12 U364 ( .A(n667), .Y(candidate[5]) );
  BUFX12 U365 ( .A(n666), .Y(candidate[6]) );
  BUFX12 U366 ( .A(n665), .Y(candidate[7]) );
  BUFX12 U367 ( .A(n672), .Y(candidate[0]) );
  CLKBUFX3 U368 ( .A(n376), .Y(n364) );
  CLKBUFX3 U369 ( .A(n376), .Y(n365) );
  CLKBUFX3 U370 ( .A(n664), .Y(n368) );
  CLKBUFX3 U371 ( .A(n664), .Y(n367) );
  CLKBUFX3 U372 ( .A(n664), .Y(n366) );
  INVX3 U373 ( .A(n362), .Y(n398) );
  CLKINVX1 U374 ( .A(\mult_278/n1 ), .Y(N134) );
  CLKINVX1 U375 ( .A(\mult_298/n1 ), .Y(N202) );
  CLKINVX1 U376 ( .A(\mult_288/n1 ), .Y(N168) );
  CLKINVX1 U377 ( .A(\mult_277/n1 ), .Y(N126) );
  CLKINVX1 U378 ( .A(\mult_297/n1 ), .Y(N194) );
  CLKINVX1 U379 ( .A(\mult_287/n1 ), .Y(N160) );
  CLKBUFX3 U380 ( .A(n424), .Y(n362) );
  NAND2X1 U381 ( .A(n369), .B(n588), .Y(n424) );
  INVX3 U382 ( .A(n363), .Y(n377) );
  CLKBUFX3 U383 ( .A(n395), .Y(n359) );
  NAND3X1 U384 ( .A(n363), .B(n362), .C(n371), .Y(n395) );
  CLKBUFX3 U385 ( .A(n378), .Y(n358) );
  CLKINVX1 U386 ( .A(n371), .Y(n378) );
  CLKBUFX3 U387 ( .A(n571), .Y(n360) );
  CLKINVX1 U388 ( .A(n577), .Y(n571) );
  CLKBUFX3 U389 ( .A(n423), .Y(n363) );
  NAND2X1 U390 ( .A(n369), .B(n662), .Y(n423) );
  CLKBUFX3 U391 ( .A(n370), .Y(n361) );
  NAND3X1 U392 ( .A(n587), .B(n383), .C(n662), .Y(n370) );
  NAND2X1 U395 ( .A(y_b[2]), .B(y_b[3]), .Y(\mult_288/n8 ) );
  NAND2X1 U396 ( .A(y_b[2]), .B(y_b[3]), .Y(\mult_298/n8 ) );
  NAND2X1 U397 ( .A(y_b[2]), .B(y_b[3]), .Y(\mult_278/n8 ) );
  NAND2X1 U398 ( .A(x_a[2]), .B(x_a[3]), .Y(\mult_287/n8 ) );
  NAND2X1 U399 ( .A(x_a[2]), .B(x_a[3]), .Y(\mult_297/n8 ) );
  NAND2X1 U400 ( .A(x_a[2]), .B(x_a[3]), .Y(\mult_277/n8 ) );
  NAND3BX1 U401 ( .AN(n369), .B(n361), .C(n371), .Y(next_state[2]) );
  OAI211X1 U402 ( .A0(n372), .A1(n373), .B0(n374), .C0(n375), .Y(next_state[1]) );
  NOR3X1 U403 ( .A(n365), .B(n377), .C(n358), .Y(n375) );
  NAND4X1 U404 ( .A(en), .B(n662), .C(n379), .D(n380), .Y(n374) );
  CLKINVX1 U405 ( .A(n381), .Y(n372) );
  AND2X1 U406 ( .A(next_state[3]), .B(next_state[0]), .Y(n347) );
  NAND3X1 U407 ( .A(n382), .B(n379), .C(n662), .Y(next_state[0]) );
  NAND3BX1 U408 ( .AN(en), .B(n380), .C(n383), .Y(n382) );
  OAI21XL U409 ( .A0(n381), .A1(n373), .B0(n384), .Y(next_state[3]) );
  NAND3X1 U410 ( .A(y[3]), .B(n385), .C(n386), .Y(n381) );
  NAND2X1 U411 ( .A(n387), .B(n388), .Y(n346) );
  XNOR2X1 U412 ( .A(n389), .B(y[0]), .Y(n387) );
  MXI2X1 U413 ( .A(n390), .B(n391), .S0(y[3]), .Y(n345) );
  OA21XL U414 ( .A0(y[2]), .A1(n392), .B0(n393), .Y(n391) );
  NAND2BX1 U415 ( .AN(n394), .B(y[2]), .Y(n390) );
  OAI211X1 U416 ( .A0(n230), .A1(n359), .B0(n396), .C0(n397), .Y(n344) );
  AOI22X1 U417 ( .A0(N153), .A1(n377), .B0(N153), .B1(n398), .Y(n397) );
  NAND2X1 U418 ( .A(N153), .B(n358), .Y(n396) );
  OAI21XL U419 ( .A0(n231), .A1(n359), .B0(n399), .Y(n343) );
  OAI21XL U420 ( .A0(n232), .A1(n359), .B0(n399), .Y(n342) );
  AOI222XL U421 ( .A0(N134), .A1(n398), .B0(N202), .B1(n358), .C0(N168), .C1(
        n377), .Y(n399) );
  OAI211X1 U422 ( .A0(n233), .A1(n359), .B0(n400), .C0(n401), .Y(n341) );
  AOI22X1 U423 ( .A0(N167), .A1(n377), .B0(N133), .B1(n398), .Y(n401) );
  NAND2X1 U424 ( .A(N201), .B(n358), .Y(n400) );
  OAI211X1 U425 ( .A0(n234), .A1(n359), .B0(n402), .C0(n403), .Y(n340) );
  AOI22X1 U426 ( .A0(N166), .A1(n377), .B0(N132), .B1(n398), .Y(n403) );
  NAND2X1 U427 ( .A(N200), .B(n358), .Y(n402) );
  OAI211X1 U428 ( .A0(n235), .A1(n359), .B0(n404), .C0(n405), .Y(n339) );
  AOI22X1 U429 ( .A0(N165), .A1(n377), .B0(N131), .B1(n398), .Y(n405) );
  NAND2X1 U430 ( .A(N199), .B(n358), .Y(n404) );
  OAI211X1 U431 ( .A0(n236), .A1(n359), .B0(n406), .C0(n407), .Y(n338) );
  AOI22X1 U432 ( .A0(N164), .A1(n377), .B0(N130), .B1(n398), .Y(n407) );
  NAND2X1 U433 ( .A(N198), .B(n358), .Y(n406) );
  OAI211X1 U434 ( .A0(n237), .A1(n359), .B0(n408), .C0(n409), .Y(n337) );
  AOI22X1 U435 ( .A0(N163), .A1(n377), .B0(N129), .B1(n398), .Y(n409) );
  NAND2X1 U436 ( .A(N197), .B(n358), .Y(n408) );
  OAI211X1 U437 ( .A0(n239), .A1(n359), .B0(n410), .C0(n411), .Y(n335) );
  AOI22X1 U438 ( .A0(N161), .A1(n377), .B0(N161), .B1(n398), .Y(n411) );
  NAND2X1 U439 ( .A(N161), .B(n358), .Y(n410) );
  OAI21XL U440 ( .A0(n240), .A1(n359), .B0(n412), .Y(n334) );
  OAI21XL U441 ( .A0(n241), .A1(n359), .B0(n412), .Y(n333) );
  AOI222XL U442 ( .A0(N126), .A1(n398), .B0(N194), .B1(n358), .C0(N160), .C1(
        n377), .Y(n412) );
  OAI211X1 U443 ( .A0(n242), .A1(n359), .B0(n413), .C0(n414), .Y(n332) );
  AOI22X1 U444 ( .A0(N159), .A1(n377), .B0(N125), .B1(n398), .Y(n414) );
  NAND2X1 U445 ( .A(N193), .B(n358), .Y(n413) );
  OAI211X1 U446 ( .A0(n243), .A1(n359), .B0(n415), .C0(n416), .Y(n331) );
  AOI22X1 U447 ( .A0(N158), .A1(n377), .B0(N124), .B1(n398), .Y(n416) );
  NAND2X1 U448 ( .A(N192), .B(n358), .Y(n415) );
  OAI211X1 U449 ( .A0(n244), .A1(n359), .B0(n417), .C0(n418), .Y(n330) );
  AOI22X1 U450 ( .A0(N157), .A1(n377), .B0(N123), .B1(n398), .Y(n418) );
  NAND2X1 U451 ( .A(N191), .B(n358), .Y(n417) );
  OAI211X1 U452 ( .A0(n245), .A1(n359), .B0(n419), .C0(n420), .Y(n329) );
  AOI22X1 U453 ( .A0(N156), .A1(n377), .B0(N122), .B1(n398), .Y(n420) );
  NAND2X1 U454 ( .A(N190), .B(n358), .Y(n419) );
  OAI211X1 U455 ( .A0(n246), .A1(n359), .B0(n421), .C0(n422), .Y(n328) );
  AOI22X1 U456 ( .A0(N155), .A1(n377), .B0(N121), .B1(n398), .Y(n422) );
  NAND2X1 U457 ( .A(N189), .B(n358), .Y(n421) );
  CLKMX2X2 U458 ( .A(n425), .B(union_A), .S0(n363), .Y(n326) );
  OAI21XL U459 ( .A0(N150), .A1(n426), .B0(n427), .Y(n425) );
  AOI32X1 U460 ( .A0(n428), .A1(n429), .A2(n430), .B0(n431), .B1(n432), .Y(
        n426) );
  OAI211X1 U461 ( .A0(n433), .A1(n434), .B0(n435), .C0(n436), .Y(n431) );
  OAI2BB1X1 U462 ( .A0N(n433), .A1N(n434), .B0(n437), .Y(n435) );
  NAND2X1 U463 ( .A(n438), .B(n439), .Y(n433) );
  AOI22X1 U464 ( .A0(N149), .A1(n436), .B0(N148), .B1(n434), .Y(n430) );
  NAND2X1 U465 ( .A(r1[2]), .B(n440), .Y(n434) );
  AO21X1 U466 ( .A0(r1[1]), .A1(n441), .B0(n442), .Y(n440) );
  NAND4X1 U467 ( .A(r1[3]), .B(n443), .C(n444), .D(n445), .Y(n436) );
  OAI2BB2XL U468 ( .B0(n446), .B1(n447), .A0N(n448), .A1N(n449), .Y(n429) );
  OAI2BB1X1 U469 ( .A0N(n450), .A1N(n442), .B0(n451), .Y(n449) );
  OAI22XL U470 ( .A0(n441), .A1(n452), .B0(n442), .B1(n450), .Y(n447) );
  NOR3X1 U471 ( .A(r1[0]), .B(r1[3]), .C(n444), .Y(n442) );
  AO21X1 U472 ( .A0(n451), .A1(N146), .B0(N144), .Y(n446) );
  NAND2X1 U473 ( .A(n441), .B(n453), .Y(n451) );
  XNOR2X1 U474 ( .A(n445), .B(r1[1]), .Y(n453) );
  NOR2X1 U475 ( .A(n443), .B(r1[3]), .Y(n441) );
  NAND2BX1 U476 ( .AN(n438), .B(N147), .Y(n428) );
  CLKMX2X2 U477 ( .A(n454), .B(union_B), .S0(n371), .Y(n325) );
  OAI21XL U478 ( .A0(N150), .A1(n455), .B0(n427), .Y(n454) );
  AOI32X1 U479 ( .A0(n456), .A1(n457), .A2(n458), .B0(n459), .B1(n432), .Y(
        n455) );
  OAI211X1 U480 ( .A0(n460), .A1(n461), .B0(n462), .C0(n463), .Y(n459) );
  OAI2BB1X1 U481 ( .A0N(n460), .A1N(n461), .B0(n437), .Y(n462) );
  NAND2X1 U482 ( .A(n464), .B(n439), .Y(n460) );
  AOI22X1 U483 ( .A0(N149), .A1(n463), .B0(N148), .B1(n461), .Y(n458) );
  NAND2X1 U484 ( .A(r2[2]), .B(n465), .Y(n461) );
  AO21X1 U485 ( .A0(r2[1]), .A1(n466), .B0(n467), .Y(n465) );
  NAND4X1 U486 ( .A(r2[3]), .B(n468), .C(n469), .D(n470), .Y(n463) );
  OAI2BB2XL U487 ( .B0(n471), .B1(n472), .A0N(n448), .A1N(n473), .Y(n457) );
  OAI2BB1X1 U488 ( .A0N(n450), .A1N(n467), .B0(n474), .Y(n473) );
  OAI22XL U489 ( .A0(n466), .A1(n452), .B0(n467), .B1(n450), .Y(n472) );
  NOR3X1 U490 ( .A(r2[0]), .B(r2[3]), .C(n469), .Y(n467) );
  AO21X1 U491 ( .A0(n474), .A1(N146), .B0(N144), .Y(n471) );
  NAND2X1 U492 ( .A(n466), .B(n475), .Y(n474) );
  XNOR2X1 U493 ( .A(n470), .B(r2[1]), .Y(n475) );
  NOR2X1 U494 ( .A(n468), .B(r2[3]), .Y(n466) );
  NAND2BX1 U495 ( .AN(n464), .B(N147), .Y(n456) );
  MXI2X1 U496 ( .A(n476), .B(n477), .S0(n384), .Y(n324) );
  OA21XL U497 ( .A0(n478), .A1(N150), .B0(n427), .Y(n476) );
  CLKINVX1 U498 ( .A(N151), .Y(n427) );
  CLKINVX1 U499 ( .A(n479), .Y(n478) );
  OAI32X1 U500 ( .A0(n480), .A1(n481), .A2(n482), .B0(N149), .B1(n483), .Y(
        n479) );
  AOI211X1 U501 ( .A0(n484), .A1(n485), .B0(n486), .C0(n487), .Y(n483) );
  OA21XL U502 ( .A0(n484), .A1(n485), .B0(n437), .Y(n487) );
  NOR2BX1 U503 ( .AN(n488), .B(N147), .Y(n485) );
  NOR2X1 U504 ( .A(n488), .B(n439), .Y(n482) );
  CLKINVX1 U505 ( .A(N147), .Y(n439) );
  AOI211X1 U506 ( .A0(n489), .A1(r3[1]), .B0(r3[3]), .C0(n490), .Y(n488) );
  AOI2BB2X1 U507 ( .B0(n448), .B1(n491), .A0N(n492), .A1N(n493), .Y(n481) );
  OAI22XL U508 ( .A0(n494), .A1(n452), .B0(n495), .B1(n450), .Y(n493) );
  CLKINVX1 U509 ( .A(N143), .Y(n452) );
  AO21X1 U510 ( .A0(n496), .A1(N146), .B0(N144), .Y(n492) );
  OAI2BB1X1 U511 ( .A0N(n450), .A1N(n495), .B0(n496), .Y(n491) );
  NAND2X1 U512 ( .A(n494), .B(n497), .Y(n496) );
  XNOR2X1 U513 ( .A(r3[2]), .B(n498), .Y(n497) );
  CLKINVX1 U514 ( .A(N145), .Y(n450) );
  CLKINVX1 U515 ( .A(N146), .Y(n448) );
  OAI22XL U516 ( .A0(n486), .A1(n432), .B0(n484), .B1(n437), .Y(n480) );
  CLKINVX1 U517 ( .A(N148), .Y(n437) );
  NOR2BX1 U518 ( .AN(n499), .B(n490), .Y(n484) );
  AO21X1 U519 ( .A0(r3[1]), .A1(n494), .B0(n495), .Y(n499) );
  NOR3X1 U520 ( .A(r3[0]), .B(r3[3]), .C(n498), .Y(n495) );
  NOR2X1 U521 ( .A(n489), .B(r3[3]), .Y(n494) );
  CLKINVX1 U522 ( .A(N149), .Y(n432) );
  AND4X1 U523 ( .A(r3[3]), .B(n489), .C(n498), .D(n490), .Y(n486) );
  CLKMX2X2 U524 ( .A(n500), .B(n501), .S0(n659), .Y(n323) );
  NOR2X1 U525 ( .A(n502), .B(n503), .Y(n501) );
  OAI21XL U526 ( .A0(x[2]), .A1(n504), .B0(n505), .Y(n500) );
  NAND3X1 U527 ( .A(n388), .B(n392), .C(n506), .Y(n322) );
  XNOR2X1 U528 ( .A(x[0]), .B(n507), .Y(n506) );
  MXI2X1 U529 ( .A(n508), .B(n509), .S0(x[1]), .Y(n321) );
  NAND2X1 U530 ( .A(x[0]), .B(n507), .Y(n508) );
  MXI2X1 U531 ( .A(n510), .B(n511), .S0(y[1]), .Y(n320) );
  NAND2X1 U532 ( .A(n389), .B(y[0]), .Y(n510) );
  OAI221XL U533 ( .A0(n512), .A1(n513), .B0(n514), .B1(n658), .C0(n515), .Y(
        n319) );
  NOR3X1 U534 ( .A(n516), .B(n517), .C(n518), .Y(n515) );
  AOI222XL U535 ( .A0(n519), .A1(n520), .B0(n377), .B1(n521), .C0(n398), .C1(
        n522), .Y(n512) );
  OAI21XL U536 ( .A0(n514), .A1(n657), .B0(n523), .Y(n318) );
  MXI2X1 U537 ( .A(n524), .B(n525), .S0(x[1]), .Y(n523) );
  NAND3X1 U538 ( .A(n526), .B(n527), .C(n528), .Y(n525) );
  MXI2X1 U539 ( .A(n529), .B(n518), .S0(x2[1]), .Y(n528) );
  MXI2X1 U540 ( .A(n530), .B(n517), .S0(x1[1]), .Y(n527) );
  MXI2X1 U541 ( .A(n531), .B(n516), .S0(x3[1]), .Y(n526) );
  NAND3X1 U542 ( .A(n532), .B(n533), .C(n534), .Y(n524) );
  MXI2X1 U543 ( .A(n518), .B(n529), .S0(x2[1]), .Y(n534) );
  NOR2X1 U544 ( .A(n535), .B(n362), .Y(n529) );
  AND2X1 U545 ( .A(n535), .B(n398), .Y(n518) );
  MXI2X1 U546 ( .A(n517), .B(n530), .S0(x1[1]), .Y(n533) );
  NOR2X1 U547 ( .A(n536), .B(n361), .Y(n530) );
  AND2X1 U548 ( .A(n536), .B(n519), .Y(n517) );
  MXI2X1 U549 ( .A(n516), .B(n531), .S0(x3[1]), .Y(n532) );
  NOR2X1 U550 ( .A(n537), .B(n363), .Y(n531) );
  AND2X1 U551 ( .A(n537), .B(n377), .Y(n516) );
  OAI21XL U552 ( .A0(n514), .A1(n656), .B0(n538), .Y(n317) );
  MXI2X1 U553 ( .A(n539), .B(n540), .S0(n503), .Y(n538) );
  OAI222XL U554 ( .A0(n362), .A1(n541), .B0(n363), .B1(n542), .C0(n361), .C1(
        n543), .Y(n540) );
  XNOR2X1 U555 ( .A(n544), .B(n545), .Y(n543) );
  XNOR2X1 U556 ( .A(n546), .B(n547), .Y(n542) );
  XNOR2X1 U557 ( .A(n548), .B(n549), .Y(n541) );
  OAI222XL U558 ( .A0(n550), .A1(n362), .B0(n551), .B1(n363), .C0(n552), .C1(
        n361), .Y(n539) );
  XNOR2X1 U559 ( .A(x1[2]), .B(n545), .Y(n552) );
  XNOR2X1 U560 ( .A(x3[2]), .B(n547), .Y(n551) );
  XNOR2X1 U561 ( .A(x2[2]), .B(n549), .Y(n550) );
  OAI21XL U562 ( .A0(n514), .A1(n655), .B0(n553), .Y(n316) );
  MXI2X1 U563 ( .A(n554), .B(n555), .S0(n659), .Y(n553) );
  OAI222XL U564 ( .A0(n556), .A1(n362), .B0(n557), .B1(n363), .C0(n558), .C1(
        n361), .Y(n555) );
  XNOR2X1 U565 ( .A(x1[3]), .B(n559), .Y(n558) );
  XNOR2X1 U566 ( .A(x3[3]), .B(n560), .Y(n557) );
  XNOR2X1 U567 ( .A(x2[3]), .B(n561), .Y(n556) );
  OAI222XL U568 ( .A0(n362), .A1(n562), .B0(n363), .B1(n563), .C0(n361), .C1(
        n564), .Y(n554) );
  XOR2X1 U569 ( .A(x1[3]), .B(n559), .Y(n564) );
  OA22X1 U570 ( .A0(x1[2]), .A1(n565), .B0(n566), .B1(n503), .Y(n559) );
  NOR2X1 U571 ( .A(n545), .B(n544), .Y(n566) );
  CLKINVX1 U572 ( .A(n565), .Y(n545) );
  ACHCINX2 U573 ( .CIN(x[1]), .A(x1[1]), .B(n536), .CO(n565) );
  NOR2X1 U574 ( .A(x[0]), .B(n520), .Y(n536) );
  XOR2X1 U575 ( .A(x3[3]), .B(n560), .Y(n563) );
  OA22X1 U576 ( .A0(x3[2]), .A1(n567), .B0(n568), .B1(n503), .Y(n560) );
  NOR2X1 U577 ( .A(n547), .B(n546), .Y(n568) );
  CLKINVX1 U578 ( .A(n567), .Y(n547) );
  ACHCINX2 U579 ( .CIN(x[1]), .A(x3[1]), .B(n537), .CO(n567) );
  NOR2X1 U580 ( .A(x[0]), .B(n521), .Y(n537) );
  XOR2X1 U581 ( .A(x2[3]), .B(n561), .Y(n562) );
  OA22X1 U582 ( .A0(x2[2]), .A1(n569), .B0(n570), .B1(n503), .Y(n561) );
  NOR2X1 U583 ( .A(n549), .B(n548), .Y(n570) );
  CLKINVX1 U584 ( .A(n569), .Y(n549) );
  ACHCINX2 U585 ( .CIN(x[1]), .A(x2[1]), .B(n535), .CO(n569) );
  NOR2X1 U586 ( .A(x[0]), .B(n522), .Y(n535) );
  OAI2BB2XL U587 ( .B0(n249), .B1(n360), .A0N(N382), .A1N(n572), .Y(n315) );
  OAI2BB2XL U588 ( .B0(n250), .B1(n360), .A0N(N383), .A1N(n572), .Y(n314) );
  OAI2BB2XL U589 ( .B0(n251), .B1(n360), .A0N(N384), .A1N(n572), .Y(n313) );
  OAI2BB2XL U590 ( .B0(n252), .B1(n360), .A0N(N385), .A1N(n572), .Y(n312) );
  OAI2BB2XL U591 ( .B0(n253), .B1(n360), .A0N(N386), .A1N(n572), .Y(n311) );
  OAI2BB2XL U592 ( .B0(n254), .B1(n360), .A0N(N387), .A1N(n572), .Y(n310) );
  OAI2BB2XL U593 ( .B0(n255), .B1(n360), .A0N(N388), .A1N(n572), .Y(n309) );
  OAI2BB2XL U594 ( .B0(n256), .B1(n360), .A0N(N389), .A1N(n572), .Y(n308) );
  OAI31XL U595 ( .A0(n574), .A1(n575), .A2(n576), .B0(n360), .Y(n573) );
  AOI221XL U596 ( .A0(n578), .A1(n574), .B0(union_A), .B1(n575), .C0(n579), 
        .Y(n577) );
  CLKINVX1 U597 ( .A(n580), .Y(n579) );
  AOI31X1 U598 ( .A0(n581), .A1(n649), .A2(n582), .B0(n583), .Y(n580) );
  OA21XL U599 ( .A0(union_B), .A1(union_A), .B0(n576), .Y(n582) );
  MXI2X1 U600 ( .A(n584), .B(n585), .S0(n578), .Y(n581) );
  NAND2X1 U601 ( .A(n654), .B(n477), .Y(n585) );
  NOR2X1 U602 ( .A(union_C), .B(n586), .Y(n584) );
  NOR3X1 U603 ( .A(n654), .B(n649), .C(n371), .Y(n575) );
  NAND3X1 U604 ( .A(n587), .B(n588), .C(n660), .Y(n371) );
  NOR3X1 U605 ( .A(n384), .B(n649), .C(n586), .Y(n574) );
  NAND3X1 U606 ( .A(n662), .B(n587), .C(n660), .Y(n384) );
  AND2X1 U607 ( .A(union_B), .B(union_A), .Y(n578) );
  OAI221XL U608 ( .A0(n589), .A1(n590), .B0(n514), .B1(n653), .C0(n591), .Y(
        n307) );
  NOR3X1 U609 ( .A(n592), .B(n593), .C(n594), .Y(n591) );
  AOI222XL U610 ( .A0(n519), .A1(n595), .B0(n377), .B1(n596), .C0(n398), .C1(
        n597), .Y(n589) );
  OAI21XL U611 ( .A0(n514), .A1(n652), .B0(n598), .Y(n306) );
  MXI2X1 U612 ( .A(n599), .B(n600), .S0(y[1]), .Y(n598) );
  NAND3X1 U613 ( .A(n601), .B(n602), .C(n603), .Y(n600) );
  MXI2X1 U614 ( .A(n604), .B(n594), .S0(y2[1]), .Y(n603) );
  MXI2X1 U615 ( .A(n605), .B(n593), .S0(y1[1]), .Y(n602) );
  MXI2X1 U616 ( .A(n606), .B(n592), .S0(y3[1]), .Y(n601) );
  NAND3X1 U617 ( .A(n607), .B(n608), .C(n609), .Y(n599) );
  MXI2X1 U618 ( .A(n594), .B(n604), .S0(y2[1]), .Y(n609) );
  NOR2X1 U619 ( .A(n610), .B(n362), .Y(n604) );
  AND2X1 U620 ( .A(n610), .B(n398), .Y(n594) );
  MXI2X1 U621 ( .A(n593), .B(n605), .S0(y1[1]), .Y(n608) );
  NOR2X1 U622 ( .A(n611), .B(n361), .Y(n605) );
  AND2X1 U623 ( .A(n611), .B(n519), .Y(n593) );
  CLKINVX1 U624 ( .A(n361), .Y(n519) );
  MXI2X1 U625 ( .A(n592), .B(n606), .S0(y3[1]), .Y(n607) );
  NOR2X1 U626 ( .A(n612), .B(n363), .Y(n606) );
  AND2X1 U627 ( .A(n612), .B(n377), .Y(n592) );
  OAI21XL U628 ( .A0(n514), .A1(n651), .B0(n613), .Y(n305) );
  MXI2X1 U629 ( .A(n614), .B(n615), .S0(n616), .Y(n613) );
  OAI222XL U630 ( .A0(n362), .A1(n617), .B0(n363), .B1(n618), .C0(n361), .C1(
        n619), .Y(n615) );
  XNOR2X1 U631 ( .A(n620), .B(n621), .Y(n619) );
  XNOR2X1 U632 ( .A(n622), .B(n623), .Y(n618) );
  XNOR2X1 U633 ( .A(n624), .B(n625), .Y(n617) );
  OAI222XL U634 ( .A0(n626), .A1(n362), .B0(n627), .B1(n363), .C0(n628), .C1(
        n361), .Y(n614) );
  XNOR2X1 U635 ( .A(y1[2]), .B(n621), .Y(n628) );
  XNOR2X1 U636 ( .A(y3[2]), .B(n623), .Y(n627) );
  XNOR2X1 U637 ( .A(y2[2]), .B(n625), .Y(n626) );
  OAI21XL U638 ( .A0(n514), .A1(n650), .B0(n629), .Y(n304) );
  MXI2X1 U639 ( .A(n630), .B(n631), .S0(y[3]), .Y(n629) );
  OAI222XL U640 ( .A0(n362), .A1(n632), .B0(n363), .B1(n633), .C0(n361), .C1(
        n634), .Y(n631) );
  XOR2X1 U641 ( .A(y1[3]), .B(n635), .Y(n634) );
  XOR2X1 U642 ( .A(y3[3]), .B(n636), .Y(n633) );
  XOR2X1 U643 ( .A(y2[3]), .B(n637), .Y(n632) );
  OAI222XL U644 ( .A0(n638), .A1(n362), .B0(n639), .B1(n363), .C0(n640), .C1(
        n361), .Y(n630) );
  XNOR2X1 U645 ( .A(y1[3]), .B(n635), .Y(n640) );
  OA22X1 U646 ( .A0(y1[2]), .A1(n641), .B0(n642), .B1(n616), .Y(n635) );
  NOR2X1 U647 ( .A(n621), .B(n620), .Y(n642) );
  CLKINVX1 U648 ( .A(n641), .Y(n621) );
  ACHCINX2 U649 ( .CIN(y[1]), .A(y1[1]), .B(n611), .CO(n641) );
  NOR2X1 U650 ( .A(y[0]), .B(n595), .Y(n611) );
  XNOR2X1 U651 ( .A(y3[3]), .B(n636), .Y(n639) );
  OA22X1 U652 ( .A0(y3[2]), .A1(n643), .B0(n644), .B1(n616), .Y(n636) );
  NOR2X1 U653 ( .A(n623), .B(n622), .Y(n644) );
  CLKINVX1 U654 ( .A(n643), .Y(n623) );
  ACHCINX2 U655 ( .CIN(y[1]), .A(y3[1]), .B(n612), .CO(n643) );
  NOR2X1 U656 ( .A(y[0]), .B(n596), .Y(n612) );
  XNOR2X1 U657 ( .A(y2[3]), .B(n637), .Y(n638) );
  OA22X1 U658 ( .A0(y2[2]), .A1(n645), .B0(n646), .B1(n616), .Y(n637) );
  NOR2X1 U659 ( .A(n625), .B(n624), .Y(n646) );
  CLKINVX1 U660 ( .A(n645), .Y(n625) );
  ACHCINX2 U661 ( .CIN(y[1]), .A(y2[1]), .B(n610), .CO(n645) );
  NOR2X1 U662 ( .A(y[0]), .B(n597), .Y(n610) );
  NOR3X1 U663 ( .A(n663), .B(n661), .C(n383), .Y(n369) );
  MXI2X1 U664 ( .A(n505), .B(n502), .S0(n503), .Y(n299) );
  OA21XL U665 ( .A0(x[1]), .A1(n504), .B0(n509), .Y(n505) );
  MXI2X1 U666 ( .A(n513), .B(n647), .S0(n504), .Y(n509) );
  NOR2X1 U667 ( .A(n389), .B(n583), .Y(n647) );
  CLKINVX1 U668 ( .A(n388), .Y(n583) );
  CLKINVX1 U669 ( .A(n507), .Y(n504) );
  NOR2X1 U670 ( .A(n373), .B(n389), .Y(n507) );
  MXI2X1 U671 ( .A(n393), .B(n394), .S0(n616), .Y(n298) );
  CLKINVX1 U672 ( .A(n392), .Y(n389) );
  OA21XL U673 ( .A0(y[1]), .A1(n392), .B0(n511), .Y(n393) );
  MXI2X1 U674 ( .A(n590), .B(n388), .S0(n392), .Y(n511) );
  NAND2X1 U675 ( .A(n662), .B(n648), .Y(n388) );
  NAND2X1 U676 ( .A(n576), .B(n385), .Y(n392) );
  CLKINVX1 U677 ( .A(n373), .Y(n576) );
  NAND2X1 U678 ( .A(n648), .B(n588), .Y(n373) );
  NOR3X1 U679 ( .A(n661), .B(n660), .C(n379), .Y(n648) );
  CLKMX2X2 U680 ( .A(x1[1]), .B(central[21]), .S0(n365), .Y(n294) );
  CLKMX2X2 U681 ( .A(x1[2]), .B(central[22]), .S0(n365), .Y(n293) );
  CLKMX2X2 U682 ( .A(x1[3]), .B(central[23]), .S0(n365), .Y(n292) );
  CLKMX2X2 U683 ( .A(y1[0]), .B(central[16]), .S0(n365), .Y(n291) );
  CLKMX2X2 U684 ( .A(y1[1]), .B(central[17]), .S0(n365), .Y(n290) );
  CLKMX2X2 U685 ( .A(y1[2]), .B(central[18]), .S0(n365), .Y(n289) );
  CLKMX2X2 U686 ( .A(y1[3]), .B(central[19]), .S0(n365), .Y(n288) );
  CLKMX2X2 U687 ( .A(x2[0]), .B(central[12]), .S0(n365), .Y(n287) );
  CLKMX2X2 U688 ( .A(x2[1]), .B(central[13]), .S0(n365), .Y(n286) );
  CLKMX2X2 U689 ( .A(x2[2]), .B(central[14]), .S0(n365), .Y(n285) );
  CLKMX2X2 U690 ( .A(x2[3]), .B(central[15]), .S0(n365), .Y(n284) );
  CLKMX2X2 U691 ( .A(y2[0]), .B(central[8]), .S0(n365), .Y(n283) );
  CLKMX2X2 U692 ( .A(y2[1]), .B(central[9]), .S0(n364), .Y(n282) );
  CLKMX2X2 U693 ( .A(y2[2]), .B(central[10]), .S0(n364), .Y(n281) );
  CLKMX2X2 U694 ( .A(y2[3]), .B(central[11]), .S0(n364), .Y(n280) );
  CLKMX2X2 U695 ( .A(x3[0]), .B(central[4]), .S0(n364), .Y(n279) );
  CLKMX2X2 U696 ( .A(x3[1]), .B(central[5]), .S0(n364), .Y(n278) );
  CLKMX2X2 U697 ( .A(x3[2]), .B(central[6]), .S0(n364), .Y(n277) );
  CLKMX2X2 U698 ( .A(x3[3]), .B(central[7]), .S0(n364), .Y(n276) );
  CLKMX2X2 U699 ( .A(y3[0]), .B(central[0]), .S0(n364), .Y(n275) );
  CLKMX2X2 U700 ( .A(y3[1]), .B(central[1]), .S0(n364), .Y(n274) );
  CLKMX2X2 U701 ( .A(y3[2]), .B(central[2]), .S0(n364), .Y(n273) );
  CLKMX2X2 U702 ( .A(y3[3]), .B(central[3]), .S0(n364), .Y(n272) );
  CLKMX2X2 U703 ( .A(r1[0]), .B(radius[8]), .S0(n364), .Y(n271) );
  CLKMX2X2 U704 ( .A(r1[1]), .B(radius[9]), .S0(n364), .Y(n270) );
  CLKMX2X2 U705 ( .A(r1[2]), .B(radius[10]), .S0(n364), .Y(n269) );
  CLKMX2X2 U706 ( .A(r1[3]), .B(radius[11]), .S0(n376), .Y(n268) );
  CLKMX2X2 U707 ( .A(r2[0]), .B(radius[4]), .S0(n364), .Y(n267) );
  CLKMX2X2 U708 ( .A(r2[1]), .B(radius[5]), .S0(n376), .Y(n266) );
  CLKMX2X2 U709 ( .A(r2[2]), .B(radius[6]), .S0(n364), .Y(n265) );
  CLKMX2X2 U710 ( .A(r2[3]), .B(radius[7]), .S0(n376), .Y(n264) );
  CLKMX2X2 U711 ( .A(r3[0]), .B(radius[0]), .S0(n365), .Y(n263) );
  CLKMX2X2 U712 ( .A(r3[1]), .B(radius[1]), .S0(n376), .Y(n262) );
  CLKMX2X2 U713 ( .A(r3[2]), .B(radius[2]), .S0(n376), .Y(n261) );
  CLKMX2X2 U714 ( .A(r3[3]), .B(radius[3]), .S0(n376), .Y(n260) );
  CLKMX2X2 U715 ( .A(x1[0]), .B(central[20]), .S0(n376), .Y(n259) );
  CLKMX2X2 U716 ( .A(n654), .B(mode[0]), .S0(n364), .Y(n258) );
  CLKMX2X2 U717 ( .A(n649), .B(mode[1]), .S0(n376), .Y(n257) );
  NOR2X1 U718 ( .A(n380), .B(n663), .Y(n587) );
  SET_DW01_inc_0_DW01_inc_2 r441 ( .A({candidate[7:1], n672}), .SUM({N389, 
        N388, N387, N386, N385, N384, N383, N382}) );
  SET_DW01_add_0 r431 ( .A({a[8:2], 1'b0, a[0]}), .B({b[8:2], 1'b0, b[0]}), 
        .CI(1'b0), .SUM({N151, N150, N149, N148, N147, N146, N145, N144, N143}) );
  DFFRX1 union_B_reg ( .D(n325), .CK(clk), .RN(n664), .Q(union_B) );
  DFFRX1 \y_reg[3]  ( .D(n345), .CK(clk), .RN(n664), .Q(y[3]) );
  DFFRX1 \y1_reg[3]  ( .D(n288), .CK(clk), .RN(n664), .Q(y1[3]) );
  DFFRX1 \x2_reg[3]  ( .D(n284), .CK(clk), .RN(n664), .Q(x2[3]) );
  DFFRX1 \x1_reg[3]  ( .D(n292), .CK(clk), .RN(n664), .Q(x1[3]) );
  DFFRX1 \y3_reg[3]  ( .D(n272), .CK(clk), .RN(n664), .Q(y3[3]) );
  DFFRX1 \y2_reg[3]  ( .D(n280), .CK(clk), .RN(n664), .Q(y2[3]) );
  DFFRX1 \x3_reg[3]  ( .D(n276), .CK(clk), .RN(n664), .Q(x3[3]) );
  DFFRX1 valid_reg ( .D(n347), .CK(clk), .RN(n664), .Q(n675) );
  DFFSX2 \y_b_reg[0]  ( .D(n307), .CK(clk), .SN(n664), .Q(N161), .QN(n653) );
  DFFRX2 \x_reg[1]  ( .D(n321), .CK(clk), .RN(n664), .Q(x[1]) );
  DFFRX2 \y_reg[1]  ( .D(n320), .CK(clk), .RN(n664), .Q(y[1]) );
  DFFSX2 \x_reg[0]  ( .D(n322), .CK(clk), .SN(n664), .Q(x[0]), .QN(n513) );
  DFFSX2 \y_reg[0]  ( .D(n346), .CK(clk), .SN(n664), .Q(y[0]), .QN(n590) );
  NOR4X1 U320 ( .A(n659), .B(x[0]), .C(x[1]), .D(x[2]), .Y(n385) );
  INVXL U356 ( .A(n675), .Y(n673) );
  INVX12 U719 ( .A(n673), .Y(valid) );
endmodule

