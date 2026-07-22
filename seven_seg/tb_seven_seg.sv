module tb;
logic [3:0] data;
logic [6:0] segments;
sevenseg dut(.data(data), .segments(segments));

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    $monitor("data=%0d, segments=%b", data, segments);
    for (int i = 0; i < 16; i++) begin
        data = i[3:0];
        #10;
    end
    $finish;
end
endmodule