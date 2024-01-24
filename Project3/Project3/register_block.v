`timescale 1ns/1ns
module register_block(
    output [31:0] read_data1,
    output [31:0] read_data2,
    input  [31:0] write_data, 
    input  [4:0] read_reg1,
    input  [4:0] read_reg2,
    input  [4:0] write_reg, 
    input  regWrite
);

	reg [31:0] registers [1023:0]; // Define a 32x32 register file

	initial begin
		$readmemb("registers.mem", registers);
	end

	assign read_data1 = registers[read_reg1];
	assign read_data2 = registers[read_reg2];

	always @(posedge regWrite) begin
		//$display("%b-%b ----writedata: %b --- adress1: %b adress2: %b yazılacak adres: %b\n", read_data1, read_data2, write_data,read_reg1,read_reg2,write_reg );
		registers[write_reg] = write_data;
		$writememb("registers.mem", registers);
	end

endmodule
