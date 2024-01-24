module firstLevel_p_g(output [31:0] p, output [31:0] g, output[31:0] bit_not, input [31:0] bit1, input [31:0] bit2, input[2:0] Alu_Op);

	
	//To invert bit2 if operation needs substraction.

	mux_not mux_for_not0(bit_not[0], Alu_Op[2:0], bit2[0]);
	mux_not mux_for_not1(bit_not[1], Alu_Op[2:0], bit2[1]);
	mux_not mux_for_not2(bit_not[2], Alu_Op[2:0], bit2[2]);
	mux_not mux_for_not3(bit_not[3], Alu_Op[2:0], bit2[3]);
	
	mux_not mux_for_not4(bit_not[4], Alu_Op[2:0], bit2[4]);
	mux_not mux_for_not5(bit_not[5], Alu_Op[2:0], bit2[5]);
	mux_not mux_for_not6(bit_not[6], Alu_Op[2:0], bit2[6]);
	mux_not mux_for_not7(bit_not[7], Alu_Op[2:0], bit2[7]);
	
	mux_not mux_for_not8(bit_not[8], Alu_Op[2:0], bit2[8]);
	mux_not mux_for_not9(bit_not[9], Alu_Op[2:0], bit2[9]);
	mux_not mux_for_not10(bit_not[10], Alu_Op[2:0], bit2[10]);
	mux_not mux_for_not11(bit_not[11], Alu_Op[2:0], bit2[11]);
	
	mux_not mux_for_not12(bit_not[12], Alu_Op[2:0], bit2[12]);
	mux_not mux_for_not13(bit_not[13], Alu_Op[2:0], bit2[13]);
	mux_not mux_for_not14(bit_not[14], Alu_Op[2:0], bit2[14]);
	mux_not mux_for_not15(bit_not[15], Alu_Op[2:0], bit2[15]);
	
	mux_not mux_for_not16(bit_not[16], Alu_Op[2:0], bit2[16]);
	mux_not mux_for_not17(bit_not[17], Alu_Op[2:0], bit2[17]);
	mux_not mux_for_not18(bit_not[18], Alu_Op[2:0], bit2[18]);
	mux_not mux_for_not19(bit_not[19], Alu_Op[2:0], bit2[19]);
	
	mux_not mux_for_not20(bit_not[20], Alu_Op[2:0], bit2[20]);
	mux_not mux_for_not21(bit_not[21], Alu_Op[2:0], bit2[21]);
	mux_not mux_for_not22(bit_not[22], Alu_Op[2:0], bit2[22]);
	mux_not mux_for_not23(bit_not[23], Alu_Op[2:0], bit2[23]);
	
	mux_not mux_for_not24(bit_not[24], Alu_Op[2:0], bit2[24]);
	mux_not mux_for_not25(bit_not[25], Alu_Op[2:0], bit2[25]);
	mux_not mux_for_not26(bit_not[26], Alu_Op[2:0], bit2[26]);
	mux_not mux_for_not27(bit_not[27], Alu_Op[2:0], bit2[27]);
	
	mux_not mux_for_not28(bit_not[28], Alu_Op[2:0], bit2[28]);
	mux_not mux_for_not29(bit_not[29], Alu_Op[2:0], bit2[29]);
	mux_not mux_for_not30(bit_not[30], Alu_Op[2:0], bit2[30]);
	mux_not mux_for_not31(bit_not[31], Alu_Op[2:0], bit2[31]);

	

	//propagate and generate values of first CLA
	or or1(p[0], bit1[0], bit_not[0]);
	or or2(p[1], bit1[1], bit_not[1]);
	or or3(p[2], bit1[2], bit_not[2]);
	or or4(p[3], bit1[3], bit_not[3]);

	and and1(g[0], bit1[0], bit_not[0]);
	and and2(g[1], bit1[1], bit_not[1]);
	and and3(g[2], bit1[2], bit_not[2]);
	and and4(g[3], bit1[3], bit_not[3]);

	//propagate and generate values of 2th CLA
	or or5(p[4], bit1[4], bit_not[4]);
	or or6(p[5], bit1[5], bit_not[5]);
	or or7(p[6], bit1[6], bit_not[6]);
	or or8(p[7], bit1[7], bit_not[7]);

	and and5(g[4], bit1[4], bit_not[4]);
	and and6(g[5], bit1[5], bit_not[5]);
	and and7(g[6], bit1[6], bit_not[6]);
	and and8(g[7], bit1[7], bit_not[7]);

	//propagate and generate values of 3th CLA
	or or9(p[8], bit1[8], bit_not[8]);
	or or10(p[9], bit1[9], bit_not[9]);
	or or11(p[10], bit1[10], bit_not[10]);
	or or12(p[11], bit1[11], bit_not[11]);

	and and9(g[8], bit1[8], bit_not[8]);
	and and10(g[9], bit1[9], bit_not[9]);
	and and11(g[10], bit1[10], bit_not[10]);
	and and12(g[11], bit1[11], bit_not[11]);

	//propagate and generate values of 4th CLA
	or or13(p[12], bit1[12], bit_not[12]);
	or or14(p[13], bit1[13], bit_not[13]);
	or or15(p[14], bit1[14], bit_not[14]);
	or or16(p[15], bit1[15], bit_not[15]);

	and and13(g[12], bit1[12], bit_not[12]);
	and and14(g[13], bit1[13], bit_not[13]);
	and and15(g[14], bit1[14], bit_not[14]);
	and and16(g[15], bit1[15], bit_not[15]);

	//propagate and generate values of 5th CLA
	or or17(p[16], bit1[16], bit_not[16]);
	or or18(p[17], bit1[17], bit_not[17]);
	or or19(p[18], bit1[18], bit_not[18]);
	or or20(p[19], bit1[19], bit_not[19]);

	and and17(g[16], bit1[16], bit_not[16]);
	and and18(g[17], bit1[17], bit_not[17]);
	and and19(g[18], bit1[18], bit_not[18]);
	and and20(g[19], bit1[19], bit_not[19]);


	//propagate and generate values of 6th CLA
	or or21(p[20], bit1[20], bit_not[20]);
	or or22(p[21], bit1[21], bit_not[21]);
	or or23(p[22], bit1[22], bit_not[22]);
	or or24(p[23], bit1[23], bit_not[23]);

	and and21(g[20], bit1[20], bit_not[20]);
	and and22(g[21], bit1[21], bit_not[21]);
	and and23(g[22], bit1[22], bit_not[22]);
	and and24(g[23], bit1[23], bit_not[23]);

	//propagate and generate values of 7th CLA
	or or25(p[24], bit1[24], bit_not[24]);
	or or26(p[25], bit1[25], bit_not[25]);
	or or27(p[26], bit1[26], bit_not[26]);
	or or28(p[27], bit1[27], bit_not[27]);

	and and25(g[24], bit1[24], bit_not[24]);
	and and26(g[25], bit1[25], bit_not[25]);
	and and27(g[26], bit1[26], bit_not[26]);
	and and28(g[27], bit1[27], bit_not[27]);

	//propagate and generate values of 8th CLA
	or or29(p[28], bit1[28], bit_not[28]);
	or or30(p[29], bit1[29], bit_not[29]);
	or or31(p[30], bit1[30], bit_not[30]);
	or or32(p[31], bit1[31], bit_not[31]);

	and and29(g[28], bit1[28], bit_not[28]);
	and and30(g[29], bit1[29], bit_not[29]);
	and and31(g[30], bit1[30], bit_not[30]);
	and and32(g[31], bit1[31], bit_not[31]);
	
endmodule
