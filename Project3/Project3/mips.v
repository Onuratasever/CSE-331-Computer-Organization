`timescale 1ns/1ns
module mips(input clock
	//, output wire [31:0] instruction
	);
	reg regwritereg;
	reg regwritemem;
	reg [31:0] PC;
	wire [31:0] instruction, read_data1, read_data2, newPc, write_data, alu_result, actual_read_data1;
	wire [5:0] opCode;
	wire regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump,byteOperations, move, zeroBit;
	wire[2:0] Aluop, alu_ctr;
	wire [4:0]  write_reg;
	
	initial begin
			PC = 32'b00000000000000000000000000000000;
	end
	
	//Connection with instruction block
	instruction_block instr_block(.instruction(instruction), .pc(PC));
	
	//Connection with control unit
	control_unit controlUnit(regDst, branch, memRead, memWrite, Aluop, ALUsrc, regWrite, jump,byteOperations, move, opCode);
	
	//Connection with alu control
	alu_control aluControl(alu_ctr, instruction[5:0], Aluop);
	
	//Connection with register block
	register_block registerBlock(.read_data1(read_data1), .read_data2(read_data2),
	.write_data(alu_result), .read_reg1(instruction[25:21]), .read_reg2(instruction[20:16]), .write_reg(write_reg), .regWrite(regwritereg));

	//Connection with ALU
	Alu alu1 (.alu_result(alu_result), .zero_bit(zeroBit), .alu_src1(actual_read_data1), .alu_src2(read_data2), .alu_ctr(alu_ctr));
	
	//It decides write register according to instruction type
	mux2x1_5bit mux2x1_5bit_1 (.result(write_reg), .result1(instruction[25:21]), .result2(instruction[15:11]), .select(regDst));
	//If it is move instruction it decides the actual data
	mux2x1_32bit mux2x1_31bit_1 (.result(actual_read_data1), .result2(32'b00000000000000000000000000000000), .result1(read_data1), .sel(move));
	
	full_adder_32bit addPc(newPc[31:0], PC[31:0], 32'b00000000000000000000000000000001, 1'b0, 3'b101);
	
	//Find opCode according to most significant 6 bits.
	and and1 (opCode[0], 1'b1, instruction[26]);
	and and2 (opCode[1],  1'b1, instruction[27]);
	and and3 (opCode[2], 1'b1, instruction[28]);
	and and4 (opCode[3],  1'b1,instruction[29]);
	and and5 (opCode[4], 1'b1, instruction[30]);
	and and6 (opCode[5],  1'b1,instruction[31]);

	always @(negedge clock)
	begin
			
		//PC <= PC + 32'b00000000000000000000000000000001;
		//$display("newpc: %b\n", newPc);
		PC <= newPc;
	end
	
	always @(*)
		begin
		
			if(clock)begin
			#1
			regwritereg <= regWrite;
			
		end else begin
			regwritereg <= 0;
			
		end
		
		end


endmodule
