module mux_3x1(output result, input [2:0] Alu_Op, input [7:0] res);

	// This module finds result according to Alu_Op
	
	wire [15:0] merge_ands;
	wire [7:0] resultOfAnds;
	wire [5:0] resultOfOrs;
	wire [2:0] Alu_Op_Not;
	
	not not1(Alu_Op_Not[0], Alu_Op[0]);
	not not2(Alu_Op_Not[1], Alu_Op[1]);
	not not3(Alu_Op_Not[2], Alu_Op[2]);
	
	and and_of_and1(merge_ands[0],res[0], Alu_Op_Not[2]);
	and and_of_and2(merge_ands[1],Alu_Op_Not[1], Alu_Op_Not[0]);
	and and_of_and3(resultOfAnds[0],merge_ands[0], merge_ands[1]);
	
	and and_of_or1(merge_ands[2],res[1], Alu_Op_Not[2]);
	and and_of_or2(merge_ands[3],Alu_Op_Not[1], Alu_Op[0]);
	and and_of_or3(resultOfAnds[1],merge_ands[2], merge_ands[3]);
	
	and and_of_xor1(merge_ands[4],res[2], Alu_Op_Not[2]);
	and and_of_xor2(merge_ands[5],Alu_Op[1], Alu_Op_Not[0]);
	and and_of_xor3(resultOfAnds[2],merge_ands[4], merge_ands[5]);
	
	and and_of_nor1(merge_ands[6],res[3], Alu_Op_Not[2]);
	and and_of_nor2(merge_ands[7],Alu_Op[1], Alu_Op[0]);
	and and_of_nor3(resultOfAnds[3],merge_ands[6], merge_ands[7]);
	
	and and_of_lessThan1(merge_ands[8],res[4], Alu_Op[2]);
	and and_of_lessThan2(merge_ands[9],Alu_Op_Not[1], Alu_Op_Not[0]);
	and and_of_lessThan3(resultOfAnds[4],merge_ands[8], merge_ands[9]);
	
	and and_of_add1(merge_ands[10],res[5], Alu_Op[2]);
	and and_of_add2(merge_ands[11],Alu_Op_Not[1], Alu_Op[0]);
	and and_of_add3(resultOfAnds[5],merge_ands[10], merge_ands[11]);
	
	
	//NORMALDE RES[6] YAZIYODU ONU DA ADD YAPMAK İÇİN 5 YAPTIM
	and and_of_sub1(merge_ands[12],res[5], Alu_Op[2]);
	and and_of_sub2(merge_ands[13],Alu_Op[1], Alu_Op_Not[0]);
	and and_of_sub3(resultOfAnds[6],merge_ands[12], merge_ands[13]);
	
	and and_of_mod1(merge_ands[14],res[7], Alu_Op[2]);
	and and_of_mod2(merge_ands[15],Alu_Op[1], Alu_Op[0]);
	and and_of_mod3(resultOfAnds[7],merge_ands[15], merge_ands[14]);

	or or1_twoands(resultOfOrs[0], resultOfAnds[0], resultOfAnds[1]);
	or or2_twoands(resultOfOrs[1], resultOfAnds[2], resultOfAnds[3]);
	or or3_twoands(resultOfOrs[2], resultOfAnds[4], resultOfAnds[5]);
	or or4_twoands(resultOfOrs[3], resultOfAnds[6], resultOfAnds[7]);
	
	or or1_twoOrs(resultOfOrs[4], resultOfOrs[0], resultOfOrs[1]);
	or or2_twoOrs(resultOfOrs[5], resultOfOrs[2], resultOfOrs[3]);
	
	or lastOr(result, resultOfOrs[4], resultOfOrs[5]);
	
endmodule
