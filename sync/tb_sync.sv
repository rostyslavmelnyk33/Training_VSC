module tb;
    logic clk;
    logic d;
    logic q;
    
    sync dut (
        .clk(clk),
        .d(d),
        .q(q)
    );
    
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        $monitor("At time %t: d=%b, q=%b", $time, d, q);
        clk = 0;
        d = 0;
        #5 d = 1;
        #10 d = 0;
        #15 d = 1;
        #20 d = 0;
        #25 d = 1;
        #30 d = 0;
        #35 d = 1;
        #40 d = 0;
        #45 d = 1;
        #50 $finish;
    end
    
    always #5 clk = ~clk; 
    endmodule