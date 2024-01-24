module full_adder_4bit_lastBlock(output [3:0] res, output set, input [3:0] bit1, input [3:0] bit2, input c_in, input [2:0] Alu_Op, input[3:0] p, input[3:0] g, input less);

	//wire [3:0] p;
	//wire [3:0] g;
	wire [3:0] carries;
	//wire [3:0] bit_not;
	//wire c_out;
	//wire less, set; // buraya 0 assign et
	
	// yarın çıkarma için 1 ekle sadece 4 bit üstünden yap ilkine 1 ver daha sonra 32 bite genellersin. mod ve less thani yap
	//mux_not mux_for_not0(bit_not[0], Alu_Op[2:0], bit2[0]);
	//mux_not mux_for_not1(bit_not[1], Alu_Op[2:0], bit2[1]);
	//mux_not mux_for_not2(bit_not[2], Alu_Op[2:0], bit2[2]);
	//mux_not mux_for_not3(bit_not[3], Alu_Op[2:0], bit2[3]);
	
	//xor xor1(c_out, bit_not[0], bit2[0]); // çıkarma olarak 1 göndermek için
	
	
	//or or1(p[0], bit1[0], bit_not[0]);
	//or or2(p[1], bit1[1], bit_not[1]);
	//or or3(p[2], bit1[2], bit_not[2]);
	//or or4(p[3], bit1[3], bit_not[3]);
	
	//and and1(g[0], bit1[0], bit_not[0]);
	//and and2(g[1], bit1[1], bit_not[1]);
	//and and3(g[2], bit1[2], bit_not[2]);
	//and and4(g[3], bit1[3], bit_not[3]);
	
	carry_Lookahead_Level1 cl1(carries[3:0], p[3:0], g[3:0], c_in);
	
	full_Adder_1bit fulladderB(res[1], bit1[1], bit2[1], carries[0], less, Alu_Op[2:0]);
	
	full_Adder_1bit fulladderC(res[2], bit1[2], bit2[2], carries[1], less, Alu_Op[2:0]);
	
	full_adder_lastBit fulladder4(res[3], set, bit1[3], bit2[3], carries[2], carries[3], less, Alu_Op[2:0]);
	
	
	//full_Adder_1bit fulladder1(res[0], bit1[0], bit_not[0], c_out, set, Alu_Op[2:0]); // birinci aluyu en sona alıp set değerini less olarak atcam

	//full_Adder_1bit fulladderD(res[3], bit1[3], bit2[3], carries[2], 1'b0, Alu_Op[2:0]);
	
	full_Adder_1bit fulladderA(res[0], bit1[0], bit2[0], c_in, less, Alu_Op[2:0]);
	
	//or or5(cout, carries[3], 0); gerek yok galiba
endmodule
