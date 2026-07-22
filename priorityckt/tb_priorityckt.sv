module tb;
logic [3:0] a;
logic [3:0] y;
priorityckt dut(.a(a), .y(y));
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    $monitor("a=%b, y=%b", a, y);
    for (int i = 0; i < 16; i++) begin
        a = i[3:0]; #10;
    end
    $finish;
end
endmodule