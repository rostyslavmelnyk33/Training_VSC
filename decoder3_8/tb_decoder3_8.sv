module tb;
    logic [2:0] a;
    logic [7:0] y;
    
    decoder3_8 dut (
        .a(a),
        .y(y)
    );
    
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        // Test all possible input combinations
        for (int i = 0; i < 8; i++) begin
        a = i[2:0];
        #10; // Wait for some time to observe the output
        $display("Input: %b, Output: %b", a, y);
        end
        $finish;
    end
endmodule