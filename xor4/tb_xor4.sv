module tb();
    logic [3:0] a;
    logic y;
    logic expected_y;
    
    logic [4:0] testvectors [0:15]; 
    int errors = 0;

    xor4 dut (
        .a(a), 
        .y(y)
    );

    initial begin
        $readmemb("xor4_vectors.txt", testvectors); // error in file to check testbench (FAIL: a = 0100 | Expected = 0, Got = 1)

        $display("----------------------------------------");
        $display("Starting Testbench with Vectors...");
        $display("----------------------------------------");
        
        for (int i = 0; i < 16; i++) begin
            {a, expected_y} = testvectors[i];
            
            #10;
            
            if (y !== expected_y) begin
                $display("FAIL: a = %b | Expected = %b, Got = %b", a, expected_y, y);
                errors++;
            end else begin
                $display("PASS: a = %b | y = %b", a, y);
            end
        end
        
        $display("----------------------------------------");
        if (errors == 0)
            $display("SUCCESS! All 16 test vectors passed perfectly.");
        else
            $display("FINISHED with %0d errors.", errors);
            
        $finish;
    end
endmodule