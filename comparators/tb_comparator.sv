module tb;
logic [7:0] a, b;
logic eq, neq, lt, lte, gt, gte;
comparator #(.WIDTH(8)) dut (
    .a(a),
    .b(b),
    .eq(eq),
    .neq(neq),
    .lt(lt),
    .lte(lte),
    .gt(gt),
    .gte(gte)
);

initial begin
    // Test case 1: a = 5, b = 5
    a = 8'd5; b = 8'd5;
    #10;
    $display("Test case 1: a = %0d, b = %0d", a, b);
    $display("eq = %0b, neq = %0b, lt = %0b, lte = %0b, gt = %0b, gte = %0b", eq, neq, lt, lte, gt, gte);

    // Test case 2: a = 3, b = 7
    a = 8'd3; b = 8'd7;
    #10;
    $display("Test case 2: a = %0d, b = %0d", a, b);
    $display("eq = %0b, neq = %0b, lt = %0b, lte = %0b, gt = %0b, gte = %0b", eq, neq, lt, lte, gt, gte);

    // Test case 3: a = 10, b = 2
    a = 8'd10; b = 8'd2;
    #10;
    $display("Test case 3: a = %0d, b = %0d", a, b);
    $display("eq = %0b, neq = %0b, lt = %0b, lte = %0b, gt = %0b, gte = %0b", eq, neq, lt, lte, gt, gte);

    // Test case 4: a = 15, b = 15
    a = 8'd15; b = 8'd15;
    #10;
    $display("Test case 4: a = %0d, b = %0d", a, b);
    $display("eq = %0b, neq = %0b, lt = %0b, lte = %0b, gt = %0b, gte = %0b", eq, neq, lt, lte, gt, gte);

    // Test case 5: a = 20, b = 25
    a = 8'd20; b = 8'd25;
    #10;
    $display("Test case 5: a = %0d, b = %0d", a, b);
    $display("eq = %0b, neq = %0b, lt = %0b, lte = %0b, gt = %0b, gte = %0b", eq, neq, lt, lte, gt, gte);
    $finish;
end
endmodule