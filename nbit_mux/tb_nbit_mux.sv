module tb;
    logic [7:0] d0_8, d1_8, d2_8, d3_8;
    logic [7:0] y8;

    logic [11:0] d0_12, d1_12, d2_12, d3_12;
    logic [11:0] y12;

    logic [1:0] s;

    mux4_8 dut8(
        .d0(d0_8), 
        .d1(d1_8), 
        .d2(d2_8), 
        .d3(d3_8), 
        .s(s), 
        .y(y8)
    );

    mux4_12 dut12(
        .d0(d0_12), 
        .d1(d1_12), 
        .d2(d2_12), 
        .d3(d3_12), 
        .s(s), 
        .y(y12)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        // ==========================================
        // TEST 1
        // ==========================================
        $display("=== Starting testbench for mux4_8 ===");
        for (int i = 0; i < 16; i++) begin
            d0_8 = 8'($urandom_range(0, 255));
            d1_8 = 8'($urandom_range(0, 255));
            d2_8 = 8'($urandom_range(0, 255));
            d3_8 = 8'($urandom_range(0, 255));
            s = i[1:0];
            #10;

            case (s)
                2'b00: assert(y8 == d0_8) else $error("Test failed for s=00");
                2'b01: assert(y8 == d1_8) else $error("Test failed for s=01");
                2'b10: assert(y8 == d2_8) else $error("Test failed for s=10");
                2'b11: assert(y8 == d3_8) else $error("Test failed for s=11");
            endcase
            
            $display("Test %0d | s=%b | d0=%h, d1=%h, d2=%h, d3=%h -> y=%h", i, s, d0_8, d1_8, d2_8, d3_8, y8);
        end
        $display("");

        // ==========================================
        // TEST 2
        // ==========================================
        $display("=== Starting testbench for mux4_12 ===");
        for (int i = 0; i < 16; i++) begin
            d0_12 = 12'($urandom_range(0, 4095));
            d1_12 = 12'($urandom_range(0, 4095));
            d2_12 = 12'($urandom_range(0, 4095));
            d3_12 = 12'($urandom_range(0, 4095));
            s = i[1:0];
            #10;

            case (s)
                2'b00: assert(y12 == d0_12) else $error("Test failed for s=00");
                2'b01: assert(y12 == d1_12) else $error("Test failed for s=01");
                2'b10: assert(y12 == d2_12) else $error("Test failed for s=10");
                2'b11: assert(y12 == d3_12) else $error("Test failed for s=11");
            endcase
            
            $display("Test %0d | s=%b | d0=%h, d1=%h, d2=%h, d3=%h -> y=%h", i, s, d0_12, d1_12, d2_12, d3_12, y12);
        end
        
        $display("--------------------------------------------------");
        $display("ALL TESTS COMPLETED");
        $display("--------------------------------------------------");
        $finish;
    end
endmodule