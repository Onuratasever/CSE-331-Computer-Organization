module instruction_block (output reg [31:0] instruction, input [31:0] pc); 
	reg [31:0] registers [31:0];
	
	 initial begin
		
		$readmemb("instructions.mem", registers); // Read the memory file into registers
		//display("instruction %b =\n", registers[0]);
		//content = registers[0];
		
		
	 end

		always @ (pc) begin
        $display ("PC ve %b\n\n", pc);
			instruction = registers[pc];
		$display ("Instruction geldi ve %b\n\n", instruction);
    end
	 
endmodule
