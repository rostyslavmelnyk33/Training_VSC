module gates(
    input  logic [3:0] a, b,
    output logic [3:0] y1, y2, y3,
    output logic [3:0] y4, y5
);

    // П'ять двовходових логічних елементів
    assign y1 = a & b;      // AND
    assign y2 = a | b;      // OR
    assign y3 = a ^ b;      // XOR
    assign y4 = ~(a & b);   // NAND
    assign y5 = ~(a | b);   // NOR

endmodule