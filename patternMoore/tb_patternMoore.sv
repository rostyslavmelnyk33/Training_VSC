module tb;
logic clk;
logic reset;
logic a;
logic y;
typedef enum logic [1:0] {S0, S1, S2} statetype;
statetype expected_state;

patternMoore dut(
    .clk(clk), 
    .reset(reset), 
    .a(a), 
    .y(y)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    
    reset = 1; 
        @(posedge clk); #1;
        if (dut.state == dut.S0) $display("RESET PASS");
        else $display("RESET FAIL");

        expected_state = S0;

    for (int i=0; i<10; i++) begin
        reset = 0; #1;
        a = logic'($urandom_range(0,1));

        case(expected_state)
            S0: if (a) expected_state = S0; else expected_state = S1;
            S1: if (a) expected_state = S2; else expected_state = S1;
            S2: if (a) expected_state = S0; else expected_state = S1;
            default: expected_state = S0;
        endcase

            @(posedge clk); #1;

       if (dut.state == expected_state)
            $display("PASS: expected=%s got=%s", expected_state.name(), dut.state.name());
       else
            $fatal(1, "FAIL: expected=%s got=%s", expected_state.name(), dut.state.name());

       if ((dut.state == dut.S2 && y == 1) || (dut.state != dut.S2 && y == 0)) 
                $display("PASS OUTPUT: y is correct for state %0s", dut.state.name());
            else 
                $display("FAIL OUTPUT: y is incorrect for state %0s", dut.state.name());
        end

    reset = 1; @(posedge clk); #1;
    if (dut.state==dut.S0)
        $display("FINAL RESET PASS");
    else
        $fatal(1, "FINAL RESET FAIL");
    #1;
    $finish;
end
endmodule
