module mod(
    input clk,
    input reset,
    input [31:0] A,
    input [31:0] B,
    output [31:0] mod_result
);

wire write_result, write_temp, out_lt;

// Instantiate Control Unit
mod_cu control_unit(
    .clk(clk),
    .reset(reset),
    .in_lt(out_lt),
    .write_result(write_result),
    .write_temp(write_temp)
);

// Instantiate Data Path Unit
mod_dp data_path_unit(
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .write_result(write_result),
    .write_temp(write_temp),
    .result(mod_result),
    .out_lt(out_lt)
);

endmodule