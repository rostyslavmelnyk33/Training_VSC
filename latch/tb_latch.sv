module tb;
    logic clk;
    logic [3:0] d;
    logic [3:0] q;
    
    latch dut(.clk(clk), .d(d), .q(q));
    
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        $monitor("At time %t, clk = %b, d = %b, q = %b", $time, clk, d, q);
        clk = 0;
        d = 4'b0000;
        #5 d = 4'b1010;
        #5 d = 4'b1100;
        #5 d = 4'b1111;
        #5 $finish;
    end
    
    always #1 clk = ~clk;