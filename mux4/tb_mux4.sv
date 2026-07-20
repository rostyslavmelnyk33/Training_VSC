module tb;
    logic [3:0] d0, d1, d2, d3;
    logic [1:0] s;
    logic [3:0] y;

    mux4 dut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .s(s),
        .y(y)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);


        d0 = 4'b0001;
        d1 = 4'b0010;
        d2 = 4'b0100;
        d3 = 4'b1000;

        $display("s    y");

        s = 2'b00;
        #1;
        $display("%b   %b", s, y);
            if (y == d0) begin
                $display("PASS");
            end else begin
                $display("FAIL expected=%b got=%b", d0, y);
                $display(""); end

        s = 2'b01;
        #1;
        $display("%b   %b", s, y);
            if (y == d1) begin
                $display("PASS");
            end else begin
                $display("FAIL expected=%b got=%b", d1, y);
                $display(""); end

        s = 2'b10;
        #1;
        $display("%b   %b", s, y);
            if (y == d2) begin
                $display("PASS");
            end else begin
                $display("FAIL expected=%b got=%b", d2, y);
                $display(""); end

        s = 2'b11;
        #1;
        $display("%b   %b", s, y);
            if (y == d3) begin
                $display("PASS");
            end else begin
                $display("FAIL expected=%b got=%b", d3, y);
                $display(""); end
        $finish;
    end
endmodule
