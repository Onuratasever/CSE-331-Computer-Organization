module carry_Lookahead_Level2(output [7:0] res, input [7:0] p, input [7:0] g,input c_in);
	
	wire PC0, PC1, PC2, PC3, PC4, PC5, PC6, PC7;
	
	and andPC0(PC0, p[0], c_in);
	or res_c1(res[0], g[0], PC0);
	
	and andPC1(PC1, p[1], res[0]);
	or res_c2(res[1], g[1], PC1);
	
	and andPC2(PC2, p[2], res[1]);
	or res_c3(res[2], g[2], PC2);
	
	and andPC3(PC3, p[3], res[2]);
	or res_c4(res[3], g[3], PC3);
	
	and andPC4(PC4, p[4], res[3]);
	or res_c5(res[4], g[4], PC4);
	
	and andPC5(PC5, p[5], res[4]);
	or res_c6(res[5], g[5], PC5);
	
	and andPC6(PC6, p[6], res[5]);
	or res_c7(res[6], g[6], PC6);
	
	and andPC7(PC7, p[7], res[6]);
	or res_c8(res[7], g[7], PC7);
	
endmodule
