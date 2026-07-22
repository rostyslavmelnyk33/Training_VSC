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
        #2 d = 4'b0001;
        #2 d = 4'b0010;
        #2 d = 4'b0011;
        #2 d = 4'b0100;
        #2 d = 4'b0101;
        #2 d = 4'b0110;
        #2 d = 4'b0111;
        #2 d = 4'b1000;
        #2 d = 4'b1001;
        #2 d = 4'b1010;
        #2 d = 4'b1011;
        #2 d = 4'b1100;
        #2 d = 4'b1101;
        #2 d = 4'b1110;
        #2 d = 4'b1111;
        #2 $finish;
    end
    always #5 clk = ~clk;
endmodule