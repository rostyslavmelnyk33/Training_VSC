module tb;

logic [7:0] d0, d1;
logic s;
logic [7:0] y;

mux2_8 dut(
    .d0(d0),
    .d1(d1),
    .s(s),
    .y(y)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);

    $display("-------------------------------");
    $display("d0        d1        s   y");
    $display("-------------------------------");

    for (int i = 0; i < 16; i++) begin
        d0 = $urandom_range(0,255);
        d1 = $urandom_range(0,255);
        s  = $urandom_range(0,1);

        #10;

        $display("%b %b %b %b", d0, d1, s, y);

        if (s == 0) begin
            assert (y == d0)
                $display("PASS");
            else
                $fatal("FAIL");
        end
        else begin
            assert (y == d1)
                $display("PASS");
            else
                $fatal("FAIL");
        end
    end

    $finish;
end

endmodule