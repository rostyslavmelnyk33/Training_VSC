module tb;

logic [7:0] a;
logic y;

and8 dut (
    .a(a),
    .y(y)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);

    $display("a         y");

    a = 8'b00000000;
    #1;
    $display("%b    %b", a, y);
    if (y == (&a)) begin
        $display("PASS");
    end else begin
        $display("FAIL");
    end

    a = 8'b11111110;
    #1;
    $display("%b    %b", a, y);
    if (y == (&a)) begin
        $display("PASS");
    end else begin
        $display("FAIL");
    end

    a = 8'b10111111;
    #1;
    $display("%b    %b", a, y);
    if (y == (&a)) begin
        $display("PASS");
    end else begin
        $display("FAIL");
    end

    a = 8'b11101111;
    #1;
    $display("%b    %b", a, y);
    if (y == (&a)) begin
        $display("PASS");
    end else begin
        $display("FAIL");
    end

    a = 8'b11111111;
    #1;
    $display("%b    %b", a, y);
    if (y == (&a)) begin
        $display("PASS");
    end else begin
        $display("FAIL");
    end

    $finish;
end

endmodule