module mux_not(output bit2_xor, input [2:0] Alu_Op, input bit2);
	
	// This module finds reverse bits if it is necessary.
	// If Alu_Op[2] is 1 and operations is not add, it finds not of bit.
	
	wire bit2_not, or1, or2, or2_not, and1, and2;
	not not4(bit2_not, bit2);
	
	wire [5:0] and_res;
	wire [2:0] Alu_Op_Not;
	
	not not1(Alu_Op_Not[0], Alu_Op[0]);
	not not2(Alu_Op_Not[1], Alu_Op[1]);
	not not3(Alu_Op_Not[2], Alu_Op[2]);
	
	and andforlessThan1(and_res[0], Alu_Op[2], Alu_Op_Not[1]);
	and andforlessThan2(and_res[1], and_res[0], Alu_Op_Not[0]);

	and andforsub1(and_res[2], Alu_Op[2], Alu_Op[1]);
	and andforsub2(and_res[3], and_res[2], Alu_Op_Not[0]);
	
	and andformod1(and_res[4], Alu_Op[2], Alu_Op[1]);
	and andformod2(and_res[5], and_res[4], Alu_Op[0]);
	
	or orforands1(or1, and_res[1], and_res[3]);
	or orforands2(or2, or1, and_res[5]);
	
	not not5(or2_not, or2);
	
	and andFordecide1(and1, or2, bit2_not);
	and andFordecide2(and2, or2_not, bit2);
	
	or result(bit2_xor, and1, and2);
	
endmodule
