`timescale 1ns/1ps
module tb;
    logic a, b, c;
    logic y;
    
    example dut (
        .a(a), .b(b), .c(c), .y(y)
    );
    
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // Test case 1
        a = 0; b = 0; c = 0;
        #10;
        $display("%0t ps : a=%b b=%b c=%b -> y=%b", $time, a, b, c, y);
        if (y !== 1) $error("FAIL");
        else $display("PASS");

        $display("");
    
        // Test case 2
        a = 0; b = 0; c = 1;
        #10;
        $display("%0t ps : a=%b b=%b c=%b -> y=%b", $time, a, b, c, y);
        if (y !== 1) $display("PASS");
        else $error("FAIL");

        $display("");

        // Test case 3
        a = 0; b = 1; c = 0;
        #10;
        $display("%0t ps : a=%b b=%b c=%b -> y=%b", $time, a, b, c, y);
        if (y !== 1) $display("PASS");
        else $error("FAIL");
    
        $display("");

        // Test case 4
        a = 0; b = 1; c = 1;
        #10;
        $display("%0t ps : a=%b b=%b c=%b -> y=%b", $time, a, b, c, y);
        if (y !== 1) $display("PASS");
        else $error("FAIL");

        $display("");

        // Test case 5
        a = 1; b = 0; c = 0;
        #10;
        $display("%0t ps : a=%b b=%b c=%b -> y=%b", $time, a, b, c, y);
        if (y !== 1) $error("FAIL");
        else $display("PASS");

        $display("");
    
        // Test case 6
        a = 1; b = 0; c = 1;
        #10;
        $display("%0t ps : a=%b b=%b c=%b -> y=%b", $time, a, b, c, y);
        if (y !== 1) $error("FAIL");
        else $display("PASS");

        $display("");

        // Test case 7
        a = 1; b = 1; c = 0;
        #10;
        $display("%0t ps : a=%b b=%b c=%b -> y=%b", $time, a, b, c, y);
        if (y !== 1) $display("PASS");
        else $error("FAIL");

        $display("");

        // Test case 8
        a = 1; b = 1; c = 1;
        #10;
        $display("%0t ps : a=%b b=%b c=%b -> y=%b", $time, a, b, c, y);
        if (y !== 1) $display("PASS");
        else $error("FAIL");
        $finish;
    end
endmodule