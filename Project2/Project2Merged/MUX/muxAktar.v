module muxAktar(input [31:0] other_res, input [31:0] mod_res, input [2:0] Alu_Op, output [31:0]res);
	
	// According to Alu_op it chooses result which is coming from mod and from other operations
	wire isMod, isMod_temp, isMod_Not;
	and anda(isMod_temp, Alu_Op[0], Alu_Op[1]);
	and andb(isMod, isMod_temp, Alu_Op[2]);
	
	not not1(isMod_Not, isMod);
	
	wire [31:0] isModArray;
	wire [31:0] isModNotArray;
	
	and and0(isModArray[0], mod_res[0], isMod);
	and and1(isModArray[1], mod_res[1], isMod);
	and and2(isModArray[2], mod_res[2], isMod);
	and and3(isModArray[3], mod_res[3], isMod);
	and and4(isModArray[4], mod_res[4], isMod);
	and and5(isModArray[5], mod_res[5], isMod);
	and and6(isModArray[6], mod_res[6], isMod);
	and and7(isModArray[7], mod_res[7], isMod);
	and and8(isModArray[8], mod_res[8], isMod);
	and and9(isModArray[9], mod_res[9], isMod);
	and and10(isModArray[10], mod_res[10], isMod);
	and and11(isModArray[11], mod_res[11], isMod);
	and and12(isModArray[12], mod_res[12], isMod);
	and and13(isModArray[13], mod_res[13], isMod);
	and and14(isModArray[14], mod_res[14], isMod);
	and and15(isModArray[15], mod_res[15], isMod);
	and and16(isModArray[16], mod_res[16], isMod);
	and and17(isModArray[17], mod_res[17], isMod);
	and and18(isModArray[18], mod_res[18], isMod);
	and and19(isModArray[19], mod_res[19], isMod);
	and and20(isModArray[20], mod_res[20], isMod);
	and and21(isModArray[21], mod_res[21], isMod);
	and and22(isModArray[22], mod_res[22], isMod);
	and and23(isModArray[23], mod_res[23], isMod);
	and and24(isModArray[24], mod_res[24], isMod);
	and and25(isModArray[25], mod_res[25], isMod);
	and and26(isModArray[26], mod_res[26], isMod);
	and and27(isModArray[27], mod_res[27], isMod);
	and and28(isModArray[28], mod_res[28], isMod);
	and and29(isModArray[29], mod_res[29], isMod);
	and and30(isModArray[30], mod_res[30], isMod);
	and and31(isModArray[31], mod_res[31], isMod);
	
	
	and anda0(isModNotArray[0], other_res[0], isMod_Not);
	and anda1(isModNotArray[1], other_res[1], isMod_Not);
	and anda2(isModNotArray[2], other_res[2], isMod_Not);
	and anda3(isModNotArray[3], other_res[3], isMod_Not);
	and anda4(isModNotArray[4], other_res[4], isMod_Not);
	and anda5(isModNotArray[5], other_res[5], isMod_Not);
	and anda6(isModNotArray[6], other_res[6], isMod_Not);
	and anda7(isModNotArray[7], other_res[7], isMod_Not);
	and anda8(isModNotArray[8], other_res[8], isMod_Not);
	and anda9(isModNotArray[9], other_res[9], isMod_Not);
	and anda10(isModNotArray[10], other_res[10], isMod_Not);
	and anda11(isModNotArray[11], other_res[11], isMod_Not);
	and anda12(isModNotArray[12], other_res[12], isMod_Not);
	and anda13(isModNotArray[13], other_res[13], isMod_Not);
	and anda14(isModNotArray[14], other_res[14], isMod_Not);
	and anda15(isModNotArray[15], other_res[15], isMod_Not);
	and anda16(isModNotArray[16], other_res[16], isMod_Not);
	and anda17(isModNotArray[17], other_res[17], isMod_Not);
	and anda18(isModNotArray[18], other_res[18], isMod_Not);
	and anda19(isModNotArray[19], other_res[19], isMod_Not);
	and anda20(isModNotArray[20], other_res[20], isMod_Not);
	and anda21(isModNotArray[21], other_res[21], isMod_Not);
	and anda22(isModNotArray[22], other_res[22], isMod_Not);
	and anda23(isModNotArray[23], other_res[23], isMod_Not);
	and anda24(isModNotArray[24], other_res[24], isMod_Not);
	and anda25(isModNotArray[25], other_res[25], isMod_Not);
	and anda26(isModNotArray[26], other_res[26], isMod_Not);
	and anda27(isModNotArray[27], other_res[27], isMod_Not);
	and anda28(isModNotArray[28], other_res[28], isMod_Not);
	and anda29(isModNotArray[29], other_res[29], isMod_Not);
	and anda30(isModNotArray[30], other_res[30], isMod_Not);
	and anda31(isModNotArray[31], other_res[31], isMod_Not);
	
	or or0(res[0], isModArray[0], isModNotArray[0]);
	or or1(res[1], isModArray[1], isModNotArray[1]);
	or or2(res[2], isModArray[2], isModNotArray[2]);
	or or3(res[3], isModArray[3], isModNotArray[3]);
	or or4(res[4], isModArray[4], isModNotArray[4]);
	or or5(res[5], isModArray[5], isModNotArray[5]);
	or or6(res[6], isModArray[6], isModNotArray[6]);
	or or7(res[7], isModArray[7], isModNotArray[7]);
	or or8(res[8], isModArray[8], isModNotArray[8]);
	or or9(res[9], isModArray[9], isModNotArray[9]);
	or or10(res[10], isModArray[10], isModNotArray[10]);
	or or11(res[11], isModArray[11], isModNotArray[11]);
	or or12(res[12], isModArray[12], isModNotArray[12]);
	or or13(res[13], isModArray[13], isModNotArray[13]);
	or or14(res[14], isModArray[14], isModNotArray[14]);
	or or15(res[15], isModArray[15], isModNotArray[15]);
	or or16(res[16], isModArray[16], isModNotArray[16]);
	or or17(res[17], isModArray[17], isModNotArray[17]);
	or or18(res[18], isModArray[18], isModNotArray[18]);
	or or19(res[19], isModArray[19], isModNotArray[19]);
	or or20(res[20], isModArray[20], isModNotArray[20]);
	or or21(res[21], isModArray[21], isModNotArray[21]);
	or or22(res[22], isModArray[22], isModNotArray[22]);
	or or23(res[23], isModArray[23], isModNotArray[23]);
	or or24(res[24], isModArray[24], isModNotArray[24]);
	or or25(res[25], isModArray[25], isModNotArray[25]);
	or or26(res[26], isModArray[26], isModNotArray[26]);
	or or27(res[27], isModArray[27], isModNotArray[27]);
	or or28(res[28], isModArray[28], isModNotArray[28]);
	or or29(res[29], isModArray[29], isModNotArray[29]);
	or or30(res[30], isModArray[30], isModNotArray[30]);
	or or31(res[31], isModArray[31], isModNotArray[31]);
	
endmodule
