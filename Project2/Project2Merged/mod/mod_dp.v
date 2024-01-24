module mod_dp(
    input clk,
    input reset,
    input [31:0] A,
    input [31:0] B,
    input write_result,
    input write_temp,
    output reg [31:0] result,
    output reg out_lt
);

reg [31:0] Temp;


// It performs operations according to signals coming from control unit.
always @(negedge clk or posedge reset) begin
    if (reset) begin
			Temp <= A;
			result <= 32'b0;
			out_lt = (A < B) ? 1'b1 : 1'b0;
    end else begin
        if (write_temp) begin
            
				out_lt = (Temp - B < B) ? 1'b1 : 1'b0;
				
				Temp <= Temp - B;
        end
        if (write_result) begin
            result <= Temp;
        end
		  
	
    end
end


endmodule
