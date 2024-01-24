module Alu( output[31:0] alu_result,
				output zero_bit, 
				input [31:0] alu_src1, 
				input [31:0] alu_src2, 
				input [2:0] alu_ctr
				);

	
	//Alu calculates all the operations and by using mux it writes to main result only one of them according to Alu_Op
	full_adder_32bit fa1(alu_result[31:0], alu_src1[31:0], alu_src2[31:0], 1'b0,  alu_ctr[2:0]);
	and and1(zero_bit, 1, 0);
	
endmodule
