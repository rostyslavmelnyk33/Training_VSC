module tb;
    logic clk;
    logic reset;
    logic [7:0] q;

    counter #(.N(8)) uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );
    always #5 clk = ~clk; 

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        clk = 0;
        reset = 0;
        
        $monitor("Time: %0t | Reset: %b | Count: %0d", $time, reset, q);

        #12 reset = 1;
        #10 reset = 0;

        #100 $finish;
    end
endmodule