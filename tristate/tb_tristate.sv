module tb;
logic [3:0] a;
logic en;
tri [3:0] y;
tristate dut(
    .a(a), 
    .en(en), 
    .y(y)
    );
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        $display("a\ten\ty");
        
        a = 4'b0000;
        en = 1'b1;
        #10;
        $display("%b\t%b\t%b", a, en, y);
        if (y === a) begin
            $display("PASS");
        end else begin
            $display("FAIL");
        end
        en = 1'b0;
        #10;
        $display("%b\t%b\t%b", a, en, y);
        if (y === 4'bz) begin
            $display("PASS");
        end else begin
            $display("FAIL");
        end


        a = 4'b1010;
        en = 1'b1;
        #10;
        $display("%b\t%b\t%b", a, en, y);
        if (y === a) begin
            $display("PASS");
        end else begin
            $display("FAIL");
        end
        en = 1'b0;
        #10;
        $display("%b\t%b\t%b", a, en, y);
        if (y === 4'bz) begin
            $display("PASS");
        end else begin
            $display("FAIL");
        end

        a = 4'b1111;
        en = 1'b1;
        #10;
        $display("%b\t%b\t%b", a, en, y);
        if (y === a) begin
            $display("PASS");
        end else begin
            $display("FAIL");
        end
        en = 1'b0;
        #10;
        $display("%b\t%b\t%b", a, en, y);
        if (y === 4'bz) begin
            $display("PASS");
        end else begin
            $display("FAIL");
        end


        $finish;
    end
    endmodule