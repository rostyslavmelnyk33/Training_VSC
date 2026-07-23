module tb;
logic [3:0] a;
logic [3:0] y;
priority_casez dut(.a(a), .y(y));
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    $monitor("a = %b, y = %b", a, y);
    for (int i = 0; i < 16; i++) begin
        a = i[3:0];
        #5;
    end
    $finish;
end
endmodule