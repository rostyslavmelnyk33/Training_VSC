module tb;
  parameter N = 6;
  parameter M = 32;

  logic clk;
  logic we;
  logic [N-1:0] adr;
  logic [M-1:0] din;
  logic [M-1:0] dout;

  ram #(
      .N(N),
      .M(M)
  ) uut (
      .clk (clk),
      .we  (we),
      .adr (adr),
      .din (din),
      .dout(dout)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Clock generation
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    // Test sequence
    we  = 1;
    adr = 0;
    din = 32'hDEADBEEF;
    #10;
    we  = 1;
    adr = 1;
    din = 32'hCAFEBABE;
    #10;
    we  = 0;
    adr = 0;
    #10;  // Read from address 0
    we  = 0;
    adr = 1;
    #10;  // Read from address 1
    $finish;
  end
endmodule
