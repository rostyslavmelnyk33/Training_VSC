module tb;
    logic D;
    logic clk;
    logic Q;

    D_latch_improved dut (
        .D(D),
        .clk(clk),
        .Q(Q)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        $monitor("Time: %0t | D: %b | clk: %b | Q: %b", $time, D, clk, Q);
        // Initialize signals
        D = 0;
        clk = 0;

        // Test sequence
      for (int i = 0; i < 10; i++) begin
            #5 D = 1'($random % 2); // Randomly change D
        end

        // Finish simulation
        #10 $finish;
    end

    always #2.5 clk = ~clk; // Clock generation
endmodule
