module tb;
    logic [3:0] d0, d1, d2, d3;
    logic [1:0] s;
    logic [3:0] y;
    
mux4 dut (
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .s(s),
    .y(y)
);
    
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        $display("Starting test cases...");
        $display("------------------------------");
        $display(" s   y");
        $display("------------------------------");

        // Test case 1
        d0 = 4'b0001; d1 = 4'b0010; d2 = 4'b0100; d3 = 4'b1000; s = 2'b00;
        #10;
        $display("Test case 1: s=%b y=%b expected=%b", s, y, d0);
        assert(y == d0) $display("PASS");
         else $fatal("FAIL");
    
        // Test case 2
        s = 2'b01;
        #10;
        $display("Test case 2: s=%b y=%b expected=%b", s, y, d1);
        assert(y == d1) $display("PASS");
         else $fatal("FAIL");
    
        // Test case 3
        s = 2'b10;
        #10;
        $display("Test case 3: s=%b y=%b expected=%b", s, y, d2);
        assert(y == d2) $display("PASS");
         else $fatal("FAIL");
    
        // Test case 4
        s = 2'b11;
        #10;
        $display("Test case 4: s=%b y=%b expected=%b", s, y, d3);
        assert(y == d3) $display("PASS");
         else $fatal("FAIL");
    
        $display("All test cases passed!");
        $finish;
    end
    endmodule