module tb;
    // Змінні для беззнакового модуля
    logic [3:0] a_un, b_un;
    logic [7:0] y_unsigned;
    
    // Змінні для знакового модуля (додано модифікатор signed)
    logic signed [3:0] a_sn, b_sn;
    logic signed [7:0] y_signed;
    
    // Instantiate unsigned multiplier
    multiplier_unsigned u_unsigned_multiplier (
        .a(a_un),
        .b(b_un),
        .y(y_unsigned)
    );
    
    // Instantiate signed multiplier
    multiplier_signed u_signed_multiplier (
        .a(a_sn),
        .b(b_sn),
        .y(y_signed)
    );
    
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        
        // Test cases for unsigned multiplier
        a_un = 4'd3; b_un = 4'd2; #10;
        $display("Unsigned: %d * %d = %d", a_un, b_un, y_unsigned);
    
        a_un = 4'd15; b_un = 4'd1; #10;
        $display("Unsigned: %d * %d = %d", a_un, b_un, y_unsigned);
    
        // Test cases for signed multiplier
        a_sn = -4'sd3; b_sn = 4'sd2; #10;
        $display("Signed: %d * %d = %d", a_sn, b_sn, y_signed);
    
        a_sn = -4'sd8; b_sn = -4'sd2; #10;
        $display("Signed: %d * %d = %d", a_sn, b_sn, y_signed);
    
        $finish;
    end
endmodule