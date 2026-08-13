// 3-port register file
// Combinational read from two ports (A1/RD1, A2/RD2)
// Synchronous write to the third port on the rising clock edge (A3/WD3/WE3)
// Register 0 is hardwired to 0
module regfile (
    input  logic        clk,
    input  logic        we3,
    input  logic [4:0]  a1,  // Read address 1
    input  logic [4:0]  a2,  // Read address 2
    input  logic [4:0]  a3,  // Write address
    input  logic [31:0] wd3, // Write data
    output logic [31:0] rd1, // Read data 1
    output logic [31:0] rd2  // Read data 2
);
  logic [31:0] rf [31:0];

  // Synchronous write to the third port
  always_ff @(posedge clk) begin
    if (we3) rf[a3] <= wd3;
  end

  // Combinational read with register 0 hardwired to 0
  assign rd1 = (a1 != 0) ? rf[a1] : 32'b0;
  assign rd2 = (a2 != 0) ? rf[a2] : 32'b0;

endmodule