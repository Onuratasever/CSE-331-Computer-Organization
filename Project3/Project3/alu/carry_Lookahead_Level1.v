module carry_Lookahead_Level1(output [3:0] res, input [3:0] p, input [3:0] g,input c_in1);
	
	wire PC0, PC1, PC2, PC3;
	
	// Calculates carries by using propagate and generate signals
	and andPC0(PC0, p[0], c_in1);
	or res_c1(res[0], g[0], PC0);
	
	and andPC1(PC1, p[1], res[0]);
	or res_c2(res[1], g[1], PC1);
	
	and andPC2(PC2, p[2], res[1]);
	or res_c3(res[2], g[2], PC2);
	
	and andPC3(PC3, p[3], res[2]);
	or res_c4(res[3], g[3], PC3);
	
endmodule
