module tb;
logic clk;
logic reset;
logic [3:0] d;
logic [3:0] q_async;
logic [3:0] q_sync;
flopr_async uut_async(.clk(clk), .reset(reset), .d(d), .q(q_async));
flopr_sync uut_sync(.clk(clk), .reset(reset), .d(d), .q(q_sync));
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    $monitor("Time: %0t | Reset: %b | D: %b | Q_async: %b | Q_sync: %b", 
                 $time, reset, d, q_async, q_sync); 
    clk = 0;
    reset = 1;
    d = 4'b1010;
    #2 reset = 0;
    #14 d = 4'b1100;
    #11 reset = 1;
    #8 reset = 0;
    #18 d = 4'b1111;
    #13 $finish;
end
always #5 clk = ~clk;
endmodule
