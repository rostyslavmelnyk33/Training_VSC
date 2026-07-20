module tb;

logic [3:0] a, b;
logic [3:0] y1, y2, y3, y4, y5;

gates dut(
    .a(a),
    .b(b),
    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y4(y4),
    .y5(y5)
);

initial begin
    $dumpfile("gates.vcd");
    $dumpvars(0, tb);

    $display(" a     b   | AND  OR  XOR NAND NOR");
    $display("----------------------------------");

    a = 4'b0000; b = 4'b0000; #1;
    $display("%b %b | %b %b %b %b %b", a,b,y1,y2,y3,y4,y5);

    a = 4'b1010; b = 4'b1100; #1;
    $display("%b %b | %b %b %b %b %b", a,b,y1,y2,y3,y4,y5);

    a = 4'b1111; b = 4'b0101; #1;
    $display("%b %b | %b %b %b %b %b", a,b,y1,y2,y3,y4,y5);

    $finish;
end

endmodule