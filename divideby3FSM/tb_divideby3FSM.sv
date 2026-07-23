module tb;
    logic clk;
    logic reset;
    logic y;

    divideby3FSM dut (
        .clk(clk),
        .reset(reset),
        .y(y)
    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        reset = 1;

        // Після першого фронту має бути S0
        @(posedge clk);
        if (dut.state !== dut.S0)
            $fatal("FAIL: Expected S0 after reset");

        reset = 0;

        // S0 -> S1
        @(posedge clk);
        if (dut.state !== dut.S1)
            $fatal("FAIL: Expected S1");

        // S1 -> S2
        @(posedge clk);
        if (dut.state !== dut.S2)
            $fatal("FAIL: Expected S2");

        // S2 -> S0
        @(posedge clk);
        if (dut.state !== dut.S0)
            $fatal("FAIL: Expected S0");

        // Ще один цикл
        @(posedge clk);
        if (dut.state !== dut.S1)
            $fatal("FAIL: Expected S1");

        $display("================================");
        $display("All state transitions PASS");
        $display("================================");

        #10;
        $finish;
    end

   always @(posedge clk) begin
    $display("posedge clk: t=%0t state=%b y=%b",
             $time, dut.state, y);
end
endmodule