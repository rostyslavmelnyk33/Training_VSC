module tb;
logic clk;
logic reset;
logic en;
logic [3:0] d;
logic [3:0] q;
flopenr dut(.clk(clk), .reset(reset), .en(en), .d(d), .q(q));
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    clk = 0;
    reset = 1;
    en = 0;
    $monitor("Time: %0t | Reset: %b | En: %b | D: %b | Q: %b", $time, reset, en, d, q);
    #5 reset = 0; // Deassert reset after 5 time units
    #5 en = 1; d = 4'b1010; // Enable and set d to 1010
    #10 d = 4'b1100; // Change d to 1100
    #10 en = 0; // Disable
    #10 d = 4'b1111; // Change d to 1111 while disabled
    #10 en = 1; // Enable again
    #10 d = 4'b0001; // Change d to 0001
    #10 reset = 1; // Assert reset again
    #5 reset = 0; // Deassert reset
    #10 en = 1; d = 4'b0010; // Enable and set d to 0010
    #10 $finish; // End simulation
end
always #5 clk = ~clk; // Clock generation
endmodule
