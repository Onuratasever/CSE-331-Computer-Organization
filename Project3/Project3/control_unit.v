module control_unit(
	 output regDst,
	 output branch,
	 output memRead,
	 output memWrite, 
	 output [2:0] ALUop,
	 output ALUsrc,
	 output regWrite,
	 output jump,
	 output byteOperations,
	 output move,
	 
	 input [5:0] opcode
);

	wire opCode_Not0, opCode_Not1, opCode_Not2, opCode_Not3, opCode_Not4, opCode_Not5;
	wire t5, t6, t7, t8;
	wire alu2_1, alu2_2, alu2_3 , alu2_4;
	wire alu1_1, alu1_2, alu1_3;
	wire alu0_1, alu0_2, alu0_3 , alu0_4;
	
	not not0 (opCode_Not0, opcode[0]);
	not not1 (opCode_Not1, opcode[1]);
	not not2 (opCode_Not2, opcode[2]);
	not not3 (opCode_Not3, opcode[3]);
	not not4 (opCode_Not4, opcode[4]);
	not not5 (opCode_Not5, opcode[5]);
		
	and and1(regDst, opCode_Not0, opCode_Not1, opCode_Not2, opCode_Not3, opCode_Not4, opCode_Not5);  //regDst = p0'p1'p2'p3'p4'p5'p6'
	
	// branch = p5p4'p0
	and andBranch (branch, opcode[0], opcode[1], opcode[5], opCode_Not3, opCode_Not4);
	
	// memRead = p5'p4'p3
	and andMemRead (memRead, opcode[3], opCode_Not1, opCode_Not2, opCode_Not4, opCode_Not5);
	
	//memWrite = p5'p4
	and andMemWrite(memWrite, opcode[5], opCode_Not4, opCode_Not3, opCode_Not2, opCode_Not1);
	
	// move = p5p4'p0'
	and andMove(move, opcode[5], opCode_Not4, opCode_Not3, opCode_Not2, opCode_Not1, opCode_Not0);
	
	// regWrite = p5'p4' + p5p4p0 + p5p4'p0'
	and and4(t5, opCode_Not5, opCode_Not4); // p5'p4'
	and mand7 (t6, opcode[5], opcode[4], opcode[0]); // p5p4p0
	and mand8 (t7, opcode[5], opCode_Not4, opCode_Not0); // p5p4'p0'
	
	or or2 (t8, t5, t6);
	or or3 (regWrite, t8, t7);
	
	and andfor2_1(alu2_1, opCode_Not4, opCode_Not3, opcode[1], opcode[0]); //P4'P3'P1P0
	and andfor2_2(alu2_2, opCode_Not5, opCode_Not4, opCode_Not3, opCode_Not2, opCode_Not0); //P5'P4'P3'P2'P0'
	and andfor2_3(alu2_3, opCode_Not5, opCode_Not4, opcode[3], opCode_Not2, opCode_Not1); // P5' P4'P3P2'P1'
	and andfor2_4(alu2_4, opCode_Not5, opCode_Not3, opcode[4], opCode_Not2, opCode_Not1); //P5'P4P3'P2'P1'
	and andfor2_5(alu2_5, opCode_Not4, opCode_Not3, opcode[5], opCode_Not2, opCode_Not1); //P5P4'P3'P2'P1'
	or alu2Or (ALUop[2], alu2_1, alu2_2, alu2_3, alu2_4, alu2_5);
	
	
	and andfor1_1(alu1_1, opCode_Not4, opCode_Not3, opcode[0], opCode_Not2, opcode[1]); //P4'P3'P2'P1P0
	and andfor1_2(alu1_2, opcode[5], opCode_Not4, opCode_Not3, opcode[1], opcode[0]); //P5P4'P3'P1P0
	and andfor1_3(alu1_3, opCode_Not5, opCode_Not4, opCode_Not3, opCode_Not2, opCode_Not1, opCode_Not0);
	and andfor1_4(alu1_4, opCode_Not5, opcode[4], opcode[3], opcode[2], opcode[1], opcode[0]);
	or alu1Or (ALUop[1], alu1_1, alu1_2, alu1_3, alu1_4);

	
	and andfor0_1(alu0_1, opCode_Not5, opCode_Not4, opCode_Not3, opCode_Not2, opCode_Not0); //P5'P4'P3'p2'p0'
	and andfor0_2(alu0_2, opCode_Not5, opCode_Not4, opcode[3], opCode_Not2, opCode_Not1); //P5'p4'p3p2'p1'
	and andfor0_3(alu0_3, opCode_Not5, opCode_Not3, opcode[4], opCode_Not2, opCode_Not1);//P5'p4 p3' p2' p1'
	and andfor0_4(alu0_4, opCode_Not5, opCode_Not4, opCode_Not3, opcode[2], opCode_Not1, opcode[0]); // p5' p4' p3' p2 p1' p0
	and andfor0_5(alu0_5, opCode_Not4, opCode_Not3, opcode[5], opCode_Not2, opCode_Not1); //P5P4'P3'P2'P1'
	or alu0Or (ALUop[0], alu0_1, alu0_2, alu0_3, alu0_4, alu0_5);	

endmodule
