module tb;
logic S, R;
logic Q, Q_bar;

SR_latch dut (
    .S(S),
    .R(R),
    .Q(Q),
    .Q_bar(Q_bar)
);

initial begin
    // Test case 1: Set state
    S = 1'b1;
    R = 1'b0;
    #10; // Wait for 10 time units
    assert(Q == 1'b1 && Q_bar == 1'b0) else $fatal("Test case 1 failed");

    // Test case 2: Reset state
    S = 1'b0;
    R = 1'b1;
    #10; // Wait for 10 time units
    assert(Q == 1'b0 && Q_bar == 1'b1) else $fatal("Test case 2 failed");

    // Test case 3: Hold state
    S = 1'b0;
    R = 1'b0;
    #10; // Wait for 10 time units
    // Очікуємо, що стан зберігся після попереднього кроку (Reset)
    assert(Q == 1'b0 && Q_bar == 1'b1) else $fatal("Test case 3 failed");

    // Test case 4: Invalid state
    S = 1'b1;
    R = 1'b1;
    #10; // Wait for 10 time units
    assert(Q === 1'bx && Q_bar === 1'bx) else $fatal("Test case 4 failed");

    $display("All test cases passed!");
    $finish;
end
endmodule