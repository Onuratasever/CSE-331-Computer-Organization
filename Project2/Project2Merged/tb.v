`timescale 1ns/1ns
module tb;

reg [31:0] a;
reg [31:0] b;
reg [2:0] Alu_Op;
reg CLK;
reg reset;
wire [31:0] result;
wire cout;

Alu alu1(result[31:0], cout, a[31:0], b[31:0], 1'b0,  Alu_Op[2:0], CLK, reset);


initial	
	begin
	//---------------------------TEST 1-----------------------------------
	
	CLK = 1'b1;
	reset = 1'b1;
	
	a = 32'd17;
	b = 32'd11;
	Alu_Op = 3'd7;
	
	#5
	reset = 1'b0;
	
	#150
	$display("%d mod %d ---> %d", a, b, result);
	
	//---------------------------TEST W-----------------------------------					//and --> operations[0]
																													//or --> operations[1]
																													//xor --> operations[2]
																													//nor --> operations[3]
																													//lt --> operations[4]
																													//add --> operations[5]
																													//sub --> operations[6]
																													//mod --> operations[7]
	
	reset = 1'b1;
	a = 32'd121;
	b = 32'd55;
	#5
	reset = 1'b0;
	
	#150
	$display("%d mod %d ---> %d", a, b, result);
	
	
	a = 32'd121;
	b = 32'd55;
	Alu_Op = 3'd1;
	
	
	#150
	$display("%b or %b ---> %b", a, b, result);
	
	//---------------------------TEST 3-----------------------------------
	
	a = 32'd31;
	b = 32'd32;
	Alu_Op = 3'd2;
	
	
	#150
	$display("%b xor %b ---> %b", a, b, result);
	
	//---------------------------TEST 4-----------------------------------
	
	
	a = 32'd7;
	b = 32'd4;
	Alu_Op = 3'd3;
	
	#150
	$display("%b nor %b ---> %b", a, b, result);
	
	
	//---------------------------TEST 5-----------------------------------
	
	
	a = 32'd7;
	b = 32'd4;
	Alu_Op = 3'd4;
	
	#150
	$display("%b less than %b ---> %b", a, b, result);
	
	//---------------------------TEST 6-----------------------------------
	
	
	a = 32'd4;
	b = 32'd7;
	Alu_Op = 3'd4;
	
	#150
	$display("%b less than %b ---> %b", a, b, result);
	
	//---------------------------TEST 7-----------------------------------
	
	
	a = 32'd13;
	b = 32'd18;
	Alu_Op = 3'd5;
	
	#150
	$display("%d add %d ---> %d", a, b, result);
	
	//---------------------------TEST 8-----------------------------------
	
	
	a = 32'd18;
	b = 32'd13;
	Alu_Op = 3'd6;
	
	#150
	$display("%d sub %d ---> %d", a, b, result);
	
	//---------------------------TEST 9-----------------------------------
	
	
	a = 32'd13;
	b = 32'd18;
	Alu_Op = 3'd6;
	
	#150
	$display("%d sub %d ---> %b", a, b, result);
	
	//---------------------------TEST 10-----------------------------------
	
	
	a = 32'd17;
	b = 32'd11;
	Alu_Op = 3'd0;
	
	#150
	$display("%b and %b ---> %b", a, b, result);
	
	//---------------------------TEST 11-----------------------------------
	
	
	a = 32'd45;
	b = 32'd36;
	Alu_Op = 3'd6;
	
	#150
	$display("%b sub %b ---> %b", a, b, result);
	$display("%d sub %d ---> %d", a, b, result);
	
	//---------------------------TEST 12-----------------------------------
	
	
	a = 32'd45;
	b = 32'd36;
	Alu_Op = 3'd5;
	
	#150
	$display("%b add %b ---> %b", a, b, result);
	$display("%d add %d ---> %d", a, b, result);
	
	end
	
	always 
	begin
	#5
	CLK = ~CLK;
	end

endmodule