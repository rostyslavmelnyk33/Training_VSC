module tb;
logic [7:0] d0, d1, d2, d3, d4, d5, d6, d7;
logic [2:0] s;
logic [7:0] y;
mux8 dut (
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d4(d4),
    .d5(d5),
    .d6(d6),
    .d7(d7),
    .s(s),
    .y(y)
    );
initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        
        $monitor("s=%b | y=%h", s, y);

        d0 = 8'hA0; 
        d1 = 8'hB1; 
        d2 = 8'hC2; 
        d3 = 8'hD3;
        d4 = 8'hE4; 
        d5 = 8'hF5; 
        d6 = 8'h16; 
        d7 = 8'h27;

        for (int i = 0; i < 8; i++) begin
            s = 3'(i);
            #10;
        end
        
        $finish;
    end
endmodule
