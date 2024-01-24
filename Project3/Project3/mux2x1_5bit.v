module mux2x1_5bit (output [4:0] result, input [4:0] result1, input [4:0] result2, input select);
	
	
wire [4:0] result_1;
wire [4:0] result_2;
wire select_not;

not not1 (select_not, select);

and and1(result_1[0],result1[0],select_not);	
and and2(result_1[1],result1[1],select_not);	
and and3(result_1[2],result1[2],select_not);	
and and4(result_1[3],result1[3],select_not);	
and and5(result_1[4],result1[4],select_not);	


and and6(result_2[0],result2[0],select);	
and and7(result_2[1],result2[1],select);	
and and8(result_2[2],result2[2],select);	          
and and9(result_2[3],result2[3],select);	
and and10(result_2[4],result2[4],select);	

or or1(result[0],result_1[0],result_2[0]);	
or or2(result[1],result_1[1],result_2[1]);	
or or3(result[2],result_1[2],result_2[2]);	          
or or4(result[3],result_1[3],result_2[3]);	
or or5(result[4],result_1[4],result_2[4]);	


endmodule
