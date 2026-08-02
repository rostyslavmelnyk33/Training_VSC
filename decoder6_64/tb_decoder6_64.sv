module tb;
logic [5:0] a;
logic [63:0] y;

decoder6_64 dut (
    .a(a),
    .y(y)
);

initial begin
    // Test all possible input combinations for a 6-bit input
    for (int i = 0; i < 64; i++) begin
        a = i[5:0]; // Assign the current value of i to the input a
        #1; // Wait for a time unit to allow the output to settle
        $display("Input: %b, Output: %b", a, y);

    end
    $finish;
end
endmodule