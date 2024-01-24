`timescale 1ns/1ns
module tb;
	reg CLK;
	//wire [31:0] instruction;
	/*wire regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump,byteOperations, move;
	wire[2:0] Aluop, alu_ctr;
	reg [5:0] opcode;
	reg [5:0] function_code;*/
	mips mips1(CLK);
	
	//control_unit deneme(alu_ctr, function_code, regDst, branch, memRead, memWrite, Aluop, ALUsrc, regWrite, jump,byteOperations, move, opcode);
	//alu_control aluControl(alu_ctr, function_code, Aluop);
	initial begin
		CLK = 1'b1; //$display("deneme %b \n", content);
		//$display("CLK basladi\n");
		/*opcode = 6'b000000;
		function_code = 6'b000010; 
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b000010;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b000011;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b000100;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b000101;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b000111;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b001000;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b001001;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b010000;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b010001;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b100011;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b100111;
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);
		
		opcode = 6'b000000;
		function_code = 6'b000100; 
		#150
		$display("AluOp: %b", Aluop);
		$display("AluCtr: %b", alu_ctr);*/
		
		end

	always 
		begin
		#3
		CLK = ~CLK;
		//#3
		//$display("instruction mipste: %b\n", instruction);
		end
	
	/*initial
		begin
			#55 $finish;
   end*/

endmodule
