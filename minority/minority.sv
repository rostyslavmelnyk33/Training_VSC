module minority (
    input  logic a, b, c,
    output logic y
);

    // ~ означає інверсію (NOT)
    // & означає логічне І (AND)
    // | означає логічне АБО (OR)
    
    assign y = (~a & ~b) | (~a & ~c) | (~b & ~c);

endmodule