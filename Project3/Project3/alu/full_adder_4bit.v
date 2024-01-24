module full_adder_4bit(output [3:0] res, input [3:0] bit1, input [3:0] bit2, input c_in, input [2:0] Alu_Op, input[3:0] p, input[3:0] g, input less);

	wire [3:0] carries;
	
	carry_Lookahead_Level1 cl1(carries[3:0], p[3:0], g[3:0], c_in); //Finds carries
	
	// 1 bit full adder calls
	
	full_Adder_1bit fulladderB(res[1], bit1[1], bit2[1], carries[0], 1'b0, Alu_Op[2:0]);
	
	full_Adder_1bit fulladderC(res[2], bit1[2], bit2[2], carries[1], 1'b0, Alu_Op[2:0]);

	full_Adder_1bit fulladderD(res[3], bit1[3], bit2[3], carries[2], 1'b0, Alu_Op[2:0]);
	
	full_Adder_1bit fulladderA(res[0], bit1[0], bit2[0], c_in, less, Alu_Op[2:0]);
	
endmodule
