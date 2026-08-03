module tb;
logic J;
logic K;
logic clk;
logic Q;

JK_trigger dut (
    .J(J),
    .K(K),
    .clk(clk),
    .Q(Q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk; // Clock period of 10 time units
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    $monitor("Time: %0t | J: %b | K: %b | Q: %b", $time, J, K, Q);
    // Test sequence
    J = 0; K = 0; #10;
    J = 1; K = 0; #10; // Set Q to 1
    J = 0; K = 1; #10; // Reset Q
    J = 1; K = 1; #10; // Toggle Q
    J = 0; K = 0; #10; // No change   
    $finish;
end
endmodule