module mux2x1_32bit ( 
							output [31:0] result,
							input [31:0] result1,
							input [31:0] result2,
							input sel
							);


wire [31:0] result_1;
wire [31:0] result_2;
wire [31:0] select;
wire [31:0] select_not;
wire sel_not;

//To select right data
extend_32bit extend_32bit1 (select[31:1], sel, sel);
or or1 (select[0], 1'b0, sel);
	
not not1 (sel_not, sel);
extend_32bit extend_32bit2 (select_not[31:1], sel_not, sel_not);
or or2 (select_not[0], 1'b0, sel_not);
	
	
my_and_32bit and1 (result_1, result1, select_not);
my_and_32bit and2 (result_2, result2, select);
my_or_32bit or3 (result, result_1, result_2);


endmodule
