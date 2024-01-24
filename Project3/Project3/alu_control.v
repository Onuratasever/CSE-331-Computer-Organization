module  alu_control(
							output  [2:0] alu_ctr,  // c2 c1 c0
							input [5:0] function_code, // f5 f4 f3 f2 f1 f0
							input [2:0] ALUop          // x2 x1 x0 
						);

	wire x1_not, x0_not, f2_not;
	wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12;


	not not1 (x1_not, ALUop[1]);
	not not2 (x0_not, ALUop[0]);
	not not3 (f2_not, function_code[2]);
	
	xor xor1 (temp1,function_code[1], function_code[0]); //f1 xor f0
	and and1 (temp3, temp1, ALUop[1]); //x1(f1 xor f0)
	or or2 (temp4, temp3, x1_not); // x1' + x1(f1 xor f0)
	and and2 (alu_ctr[0], temp4, ALUop[0]);//x0(x1' + x1(f1 xor f0))

	and and3 (temp5, ALUop[1], ALUop[2]); //x2x1
	and and4 (temp6, ALUop[0], function_code[0]); //x0f0
	and and5(temp7, f2_not, function_code[1]);//f1f2'
	and and6(temp8, temp6, temp7); //x0f0f1f2'
	or or3 (temp9, x0_not, temp8); // x0' + x0f0f1f2'
	and and7 (alu_ctr[1], temp9, temp5); //x2x1(x0' + x0f0f1f2')

	or or4 (temp10, x0_not, x1_not); //x1' + x0'
	or or5 (temp11, f2_not, function_code[1]); //f2' + f1
	or or6 (temp12, temp10, temp11); // x1' + x0' + f2' + f1
	and and8 (alu_ctr[2], ALUop[2], temp12); // x2(x1' + x0' + f2' + f1)

endmodule
