module flopr_async(input logic clk,
input logic reset,
input logic [3:0] d,
output logic [3:0] q);
// асинхронный сброс
always_ff @(posedge clk, posedge reset)
if (reset) q <= 4'b0;
else q <= d;
endmodule


module flopr_sync(input logic clk,
input logic reset,
input logic [3:0] d,
output logic [3:0] q);
// синхронный сброс
always_ff @(posedge clk)
if (reset) q <= 4'b0;
else q <= d;
endmodule