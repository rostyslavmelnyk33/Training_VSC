module tb;

    logic clk;
    logic reset;
    logic a;
    logic y;

    logic expected_y;
    logic expected_state;

    patternMealy dut(
        .clk(clk),
        .reset(reset),
        .a(a),
        .y(y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // Reset
        reset = 1;
        a = 0;

        @(posedge clk);
        #1;

        if (dut.state == dut.S0)
            $display("RESET PASS");
        else
            $fatal(1, "RESET FAIL");

        reset = 0;

        // Random tests
        for (int i = 0; i < 10; i++) begin

            a = logic'($urandom_range(0,1));

            // Expected output BEFORE clock edge
            expected_y = a && (dut.state == dut.S1);

            // Expected next state
            expected_state = a ? dut.S0 : dut.S1;

            // Mealy output changes immediately
            #1;

            if (y == expected_y)
                $display("OUTPUT PASS | a=%b state=%s y=%b",
                         a, dut.state.name(), y);
            else
                $fatal(1,
                       "OUTPUT FAIL | a=%b state=%s expected=%b got=%b",
                       a, dut.state.name(), expected_y, y);

            // Wait for state update
            @(posedge clk);
            #1;

            if (dut.state == expected_state)
                $display("STATE PASS | new state=%s",
                         dut.state.name());
            else
                $fatal(1,
                       "STATE FAIL | expected=%b got=%b",
                       expected_state, dut.state);
        end

        // Final reset check
        reset = 1;

        @(posedge clk);
        #1;

        if (dut.state == dut.S0)
            $display("FINAL RESET PASS");
        else
            $fatal(1, "FINAL RESET FAIL");

        $display("--------------------------------");
        $display("ALL TESTS PASSED");
        $display("--------------------------------");

        $finish;
    end

endmodule