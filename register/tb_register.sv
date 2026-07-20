module tb;
logic clk;
logic [3:0] d;
logic [3:0] q;
initial clk = 0;
always #5 clk = ~clk;
flop dut (
    .clk(clk),
    .d(d),
    .q(q)
);
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    d = 4'b0000;
    $display("Time: %0t, d: %b, q: %b", $time, d, q);
    $display(" ");
    #10 d = 4'b1010;
    $display("Time: %0t, d: %b, q: %b", $time, d, q);
    $display(" ");
    #10 d = 4'b1111;
    $display("Time: %0t, d: %b, q: %b", $time, d, q);
    $display(" ");
    #10 d = 4'b0001;
    $display("Time: %0t, d: %b, q: %b", $time, d, q);
    $display(" ");
    #10 $finish;
end
endmodule

