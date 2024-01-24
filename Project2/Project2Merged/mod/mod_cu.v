module mod_cu(
    input clk,
    input reset,
    input in_lt,
    output reg write_result,
    output reg write_temp
);

// State Encoding
reg [1:0] state;
localparam S0 = 2'b00,
           S1 = 2'b01,
           S2 = 2'b10;

// State Transition
always @(posedge clk or posedge reset) begin
    if (reset) begin
			state <= S0;
			write_result = 0;
			write_temp = 0;
		  //It makes zero signals and initialize with first state
    end else begin
        case (state) //According to state it changes signals to send datapath and according to signal comes from datapath it changes its state. 
            S0: begin 
					if(in_lt) begin
						state <= S2;
						write_result = 1;
						write_temp = 0;
					end else begin
						state <= S1;
						write_result = 0;
						write_temp = 1;
					end
				end
            S1: begin 
					if(in_lt) begin
						state <= S2;
						write_result = 1;
						write_temp = 0;
					end else begin
						state <= S1;
						write_result = 0;
						write_temp = 1;
					end
				end
            S2: begin 
					state <= S2; 
					write_result = 1;
					write_temp = 0;
				end
            default: state <= S0;
        endcase
    end
end

endmodule
