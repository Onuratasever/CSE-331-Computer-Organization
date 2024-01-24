module full_adder_lastBit(output result, set, input bit1, bit2, c_in, c_out, less, input [2:0] Alu_Op);

	wire [7:0] operations;
	wire and1_not;
	wire and3_res;
	wire and3_not;
	wire or2_res;
	wire v;
	
	and and1(operations[0], bit1, bit2); // will be used for and
	or or1(operations[1], bit1, bit2);	// will be used for or
	not not3(operations[3], operations[1]); // will be used for nor 
	not not1(and1_not, operations[0]);
	and and2(operations[2], operations[1], and1_not);	//will be used for xor
	and and3(and3_res, operations[2], c_in);
	not not2(and3_not, and3_res);
	or or2(or2_res, operations[2], c_in);
	and and4(operations[5], and3_not, or2_res); //will be used for sum, sub 
	
	or op4(operations[4], 1'b0, less); // will be used for less than
	or op7(operations[7], 1'b0, 1'b0); // will be used for mod

	xor overflow(v, c_in, c_out); // detects overflow
	
	//and --> operations[0] DONE
	//or --> operations[1]	DONE
	//xor --> operations[2]	DONE
	//nor --> operations[3]	DONE
	//lt --> operations[4]
	//add --> operations[5]	DONE
	//sub --> operations[6]	DONE
	//mod --> operations[7]
	xor set_set(set, operations[5], v); //set value atar overflowsuz
	
	mux_3x1 mux(result, Alu_Op[2:0], operations[7:0]); // selects result according to code
	
endmodule
