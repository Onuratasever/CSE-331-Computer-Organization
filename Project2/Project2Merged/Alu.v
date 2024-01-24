module Alu(output [31:0] res, output cout, input [31:0] bit1, input [31:0] bit2, input c_in, input [2:0] Alu_Op, input CLK, input reset);

	wire [31:0] res1, res2;
	
	//Alu calculates all the operations and by using mux it writes to main result only one of them according to Alu_Op
	full_adder_32bit fa1(res1[31:0], cout, bit1[31:0], bit2[31:0], 1'b0,  Alu_Op[2:0]);
	
	mod mod1(CLK, reset, bit1[31:0], bit2[31:0],  res2[31:0]);
	
	muxAktar mux(res1[31:0], res2[31:0], Alu_Op[2:0], res[31:0]);
	
endmodule
