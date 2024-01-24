module secondLevel_p_g(output [7:0] p_secondLevel, output [7:0] g_secondLevel, input [31:0] p, input [31:0] g);

	wire [5:0] and_results_for1;
	wire [1:0] or_results_for1;
	
	//First CLA
	and p_1th_and1(and_results_for1[0], p[3], p[2]); //p3.p2
	and p_1th_and2(and_results_for1[1], p[1], p[0]); //p1.p0
	and p_1th_and3(p_secondLevel[0], and_results_for1[1], and_results_for1[0]);

	and g_1t_and1(and_results_for1[2], p[1], g[0]); // p1.g0
	and g_1t_and2(and_results_for1[3], and_results_for1[0], and_results_for1[2]); // p3.p2.p1.g0

	and g_1t_and3(and_results_for1[4], and_results_for1[0], g[1]); //p3.p2.g1
	
	and g_1t_and4(and_results_for1[5], p[3], g[2]); //p3.g2
	
	or g_1t_or1(or_results_for1[0], g[3], and_results_for1[5]); // g3 + p3.g2
	or g_1t_or2(or_results_for1[1], and_results_for1[4], and_results_for1[3]); //p3.p2.g1 + p3.p2.p1.g0
	or g_1t_or3(g_secondLevel[0], or_results_for1[0], or_results_for1[1]);//ikisini topla
	
	//Second CLA
	
	wire [5:0] and_results_for2;
	wire [1:0] or_results_for2;
	
	and p_2th_and1(and_results_for2[0], p[7], p[6]); //p3.p2
	and p_2th_and2(and_results_for2[1], p[5], p[4]); //p1.p0
	and p_2th_and3(p_secondLevel[1], and_results_for2[1], and_results_for2[0]);

	and g_2t_and1(and_results_for2[2], p[5], g[4]); // p1.g0
	and g_2t_and2(and_results_for2[3], and_results_for2[0], and_results_for2[2]); // p3.p2.p1.g0

	and g_2t_and3(and_results_for2[4], and_results_for2[0], g[5]); //p3.p2.g1
	
	and g_2t_and4(and_results_for2[5], p[7], g[6]); //p3.g2
	
	or g_2t_or1(or_results_for2[0], g[7], and_results_for2[5]); // g3 + p3.g2
	or g_2t_or2(or_results_for2[1], and_results_for2[4], and_results_for2[3]); //p3.p2.g1 + p3.p2.p1.g0
	or g_2t_or3(g_secondLevel[1], or_results_for2[0], or_results_for2[1]);//ikisini topla
	
	//Third CLA
	
	wire [5:0] and_results_for3;
	wire [1:0] or_results_for3;
	
	and p_3th_and1(and_results_for3[0], p[11], p[10]); //p3.p2
	and p_3th_and2(and_results_for3[1], p[9], p[8]); //p1.p0
	and p_3th_and3(p_secondLevel[2], and_results_for3[1], and_results_for3[0]);

	and g_3t_and1(and_results_for3[2], p[9], g[8]); // p1.g0
	and g_3t_and2(and_results_for3[3], and_results_for3[0], and_results_for3[2]); // p3.p2.p1.g0

	and g_3t_and3(and_results_for3[4], and_results_for3[0], g[9]); //p3.p2.g1
	
	and g_3t_and4(and_results_for3[5], p[11], g[10]); //p3.g2
	
	or g_3t_or1(or_results_for3[0], g[11], and_results_for3[5]); // g3 + p3.g2
	or g_3t_or2(or_results_for3[1], and_results_for3[4], and_results_for3[3]); //p3.p2.g1 + p3.p2.p1.g0
	or g_3t_or3(g_secondLevel[2], or_results_for3[0], or_results_for3[1]);//ikisini topla
	
	//Fourth CLA
	
	wire [5:0] and_results_for4;
	wire [1:0] or_results_for4;
	
	and p_4th_and1(and_results_for4[0], p[15], p[14]); //p3.p2
	and p_4th_and2(and_results_for4[1], p[13], p[12]); //p1.p0
	and p_4th_and3(p_secondLevel[3], and_results_for4[1], and_results_for4[0]);

	and g_4t_and1(and_results_for4[2], p[13], g[12]); // p1.g0
	and g_4t_and2(and_results_for4[3], and_results_for4[0], and_results_for3[2]); // p3.p2.p1.g0

	and g_4t_and3(and_results_for4[4], and_results_for4[0], g[13]); //p3.p2.g1
	
	and g_4t_and4(and_results_for4[5], p[15], g[14]); //p3.g2
	
	or g_4t_or1(or_results_for4[0], g[15], and_results_for4[5]); // g3 + p3.g2
	or g_4t_or2(or_results_for4[1], and_results_for4[4], and_results_for4[3]); //p3.p2.g1 + p3.p2.p1.g0
	or g_4t_or3(g_secondLevel[3], or_results_for4[0], or_results_for4[1]);//ikisini topla
	
	//fifth CLA
	
	wire [5:0] and_results_for5;
	wire [1:0] or_results_for5;
	
	and p_5th_and1(and_results_for5[0], p[19], p[18]); //p3.p2
	and p_5th_and2(and_results_for5[1], p[17], p[16]); //p1.p0
	and p_5th_and3(p_secondLevel[4], and_results_for5[1], and_results_for5[0]);

	and g_5t_and1(and_results_for5[2], p[17], g[16]); // p1.g0
	and g_5t_and2(and_results_for5[3], and_results_for5[0], and_results_for3[2]); // p3.p2.p1.g0

	and g_5t_and3(and_results_for5[4], and_results_for5[0], g[17]); //p3.p2.g1
	
	and g_5t_and4(and_results_for5[5], p[19], g[18]); //p3.g2
	
	or g_5t_or1(or_results_for5[0], g[19], and_results_for5[5]); // g3 + p3.g2
	or g_5t_or2(or_results_for5[1], and_results_for5[4], and_results_for5[3]); //p3.p2.g1 + p3.p2.p1.g0
	or g_5t_or3(g_secondLevel[4], or_results_for5[0], or_results_for5[1]);//ikisini topla
	
	//sixth CLA
	
	wire [5:0] and_results_for6;
	wire [1:0] or_results_for6;
	
	and p_6th_and1(and_results_for6[0], p[23], p[22]); //p3.p2
	and p_6th_and2(and_results_for6[1], p[21], p[20]); //p1.p0
	and p_6th_and3(p_secondLevel[5], and_results_for6[1], and_results_for6[0]);

	and g_6t_and1(and_results_for6[2], p[21], g[20]); // p1.g0
	and g_6t_and2(and_results_for6[3], and_results_for6[0], and_results_for3[2]); // p3.p2.p1.g0

	and g_6t_and3(and_results_for6[4], and_results_for6[0], g[21]); //p3.p2.g1
	
	and g_6t_and4(and_results_for6[5], p[23], g[22]); //p3.g2
	
	or g_6t_or1(or_results_for6[0], g[23], and_results_for6[5]); // g3 + p3.g2
	or g_6t_or2(or_results_for6[1], and_results_for6[4], and_results_for6[3]); //p3.p2.g1 + p3.p2.p1.g0
	or g_6t_or3(g_secondLevel[5], or_results_for6[0], or_results_for6[1]);//ikisini topla
	
	//seventh CLA
	
	wire [5:0] and_results_for7;
	wire [1:0] or_results_for7;
	
	and p_7th_and1(and_results_for7[0], p[27], p[26]); //p3.p2
	and p_7th_and2(and_results_for7[1], p[25], p[24]); //p1.p0
	and p_7th_and3(p_secondLevel[6], and_results_for7[1], and_results_for7[0]);

	and g_7t_and1(and_results_for7[2], p[25], g[24]); // p1.g0
	and g_7t_and2(and_results_for7[3], and_results_for7[0], and_results_for3[2]); // p3.p2.p1.g0

	and g_7t_and3(and_results_for7[4], and_results_for7[0], g[25]); //p3.p2.g1
	
	and g_7t_and4(and_results_for7[5], p[27], g[26]); //p3.g2
	
	or g_7t_or1(or_results_for7[0], g[27], and_results_for7[5]); // g3 + p3.g2
	or g_7t_or2(or_results_for7[1], and_results_for7[4], and_results_for7[3]); //p3.p2.g1 + p3.p2.p1.g0
	or g_7t_or3(g_secondLevel[6], or_results_for7[0], or_results_for7[1]);//ikisini topla
	
	
	//eighth CLA
	
	wire [5:0] and_results_for8;
	wire [1:0] or_results_for8;
	
	and p_8th_and1(and_results_for8[0], p[31], p[30]); //p3.p2
	and p_8th_and2(and_results_for8[1], p[29], p[28]); //p1.p0
	and p_8th_and3(p_secondLevel[7], and_results_for8[1], and_results_for8[0]);

	and g_8t_and1(and_results_for8[2], p[29], g[28]); // p1.g0
	and g_8t_and2(and_results_for8[3], and_results_for8[0], and_results_for3[2]); // p3.p2.p1.g0

	and g_8t_and3(and_results_for8[4], and_results_for8[0], g[29]); //p3.p2.g1
	
	and g_8t_and4(and_results_for8[5], p[31], g[30]); //p3.g2
	
	or g_8t_or1(or_results_for8[0], g[31], and_results_for8[5]); // g3 + p3.g2
	or g_8t_or2(or_results_for8[1], and_results_for8[4], and_results_for8[3]); //p3.p2.g1 + p3.p2.p1.g0
	or g_8t_or3(g_secondLevel[7], or_results_for8[0], or_results_for8[1]);//ikisini topla
	
	
endmodule
