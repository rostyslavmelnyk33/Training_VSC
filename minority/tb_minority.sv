module tb_minority;
    logic a, b, c;
    logic y;

    minority dut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    function logic expected_output(input logic a, b, c);
        expected_output = ((~a & ~b) | (~a & ~c) | (~b & ~c));
    endfunction

    initial begin
        for (int i = 0; i < 8; i++) begin
            {a, b, c} = 3'(i);
            #10;

            if (y !== expected_output(a, b, c)) begin
                $display("FAIL: a=%0b b=%0b c=%0b y=%0b expected=%0b", a, b, c, y, expected_output(a, b, c));
                $finish;
            end

            $display("PASS: a=%0b b=%0b c=%0b y=%0b", a, b, c, y);
        end

        $display("All tests passed.");
        $finish;
    end
endmodule
