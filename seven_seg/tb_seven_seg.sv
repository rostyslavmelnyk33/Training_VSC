module tb;
    logic [3:0] data;
    logic [6:0] segments;
    logic [6:0] expected_segments;
    
    logic [10:0] testvectors [0:15];
    int errors = 0;

    sevenseg dut(
        .data(data), 
        .segments(segments)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        $readmemb("sevenseg_vectors.txt", testvectors);
        
        $display("----------------------------------------");
        $display("Starting Seven-Segment Self-Checking Testbench...");
        $display("----------------------------------------");
        
        for (int i = 0; i < 16; i++) begin
            {data, expected_segments} = testvectors[i];
            
            #10;

            if (segments !== expected_segments) begin
                $display("FAIL: data=%h | Expected=%b, Got=%b", data, expected_segments, segments);
                errors++;
            end else begin
                $display("PASS: data=%h | segments=%b", data, segments); 
            end
        end
        
        $display("----------------------------------------");
        if (errors == 0)
            $display("SUCCESS! All 16 tests passed perfectly.");
        else
            $display("FINISHED with %0d errors.", errors);
            
        $finish;
    end
endmodule