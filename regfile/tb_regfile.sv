module tb;
  logic clk;
  logic we3;
  logic [4:0] a1, a2, a3;
  logic [31:0] wd3;
  logic [31:0] rd1, rd2;

  regfile uut (
      .clk(clk),
      .we3(we3),
      .a1(a1),
      .a2(a2),
      .a3(a3),
      .wd3(wd3),
      .rd1(rd1),
      .rd2(rd2)
  );  

  initial clk = 0;
  always #5 clk = ~clk;   

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    
    we3 = 0;
    a1 = 0;
    a2 = 0;
    a3 = 0;
    wd3 = 0;
    
    @(posedge clk);
    
    $display("=== Starting testbench ===");
    $display("=== Writing to register file ===");
    
    we3 = 1;
    for (int i = 0; i < 32; i++) begin
      a3 = i[4:0];
      wd3 = i[31:0] * 10 + 5;
      @(posedge clk);
      $display("Time: %0t | Written %d to register %d", $time, wd3, a3);
    end
    
    we3 = 0;
    @(posedge clk);

    $display("=== Reading from register file ===");
    for (int i = 0; i < 32; i++) begin
      a1 = i[4:0];
      a2 = i[4:0];
      #1;
      $display("Time: %0t | Read from reg %d: rd1 = %d, rd2 = %d (Expected: %0d)", 
               $time, i, rd1, rd2, (i == 0) ? 0 : (i[31:0] * 10 + 5));    
    end 

    $display("=== Test completed ===");
    $finish;
  end
endmodule