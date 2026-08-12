module tb;
    logic clk;
    logic reset;
    logic load;
    logic sin;
    logic [7:0] d;
    logic [7:0] q;
    logic sout;

    shiftreg #(.N(8)) uut (
        .clk(clk), 
        .reset(reset), 
        .load(load), 
        .sin(sin), 
        .d(d), 
        .q(q),
        .sout(sout)
    );

    always #5 clk = ~clk;

    initial begin 
        clk = 0;
        reset = 0;
        load = 0;
        sin = 0;
        d = 0;

        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        $monitor("Time: %4t | reset: %b | load: %b | sin: %b | d: %8b | q: %8b | sout: %b", 
         $time, reset, load, sin, d, q, sout);

        #12 reset = 1; 
        #10 reset = 0;

        // 10101010
        @(posedge clk);
        load = 1;
        d = 8'b10101010;
        
        @(posedge clk);
        load = 0;

        sin = 1'b1;
        for (int i = 0; i < 8; i++) begin
            @(posedge clk);
        end

        #20 $finish;
    end

endmodule