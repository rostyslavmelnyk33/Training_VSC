module D_latch_improved (
    input  logic D,
    input  logic clk,
    output logic Q
);
    logic clk_bar, n1, n2;
    
    assign #1 clk_bar = ~clk; 
    
    assign #1 n1 = D & clk;
    assign #1 n2 = Q & clk_bar;
    
    assign #1 Q  = n1 | n2;

endmodule