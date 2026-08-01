module tb;
    logic a, b, c;
    logic y;

    test_func dut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        $display("y = a(~b) + (~b)(~c) + (~a)bc");
        $display("a b c | y");
        $display("---------");
        for (int i = 0; i < 8; i++) begin
            {a, b, c} = 3'(i);
            #1; // Wait for the output to settle
            $display("%b %b %b | %b", a, b, c, y);
        end
        $finish;
    end
    endmodule