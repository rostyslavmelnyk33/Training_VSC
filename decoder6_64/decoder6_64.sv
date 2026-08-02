module decoder6_64 (
    input logic [5:0] a,
    output logic [63:0] y
); 
logic [3:0] dec_high;
logic [3:0] dec_low;
logic [3:0] dec_mid;

    // Instantiate three 2-to-4 decoders
    decoder2_4 dec0 (
        .a(a[1:0]),
        .y(dec_low)
    );

    decoder2_4 dec1 (
        .a(a[3:2]),
        .y(dec_mid)
    );

    decoder2_4 dec2 (
        .a(a[5:4]),
        .y(dec_high)
    );

    // Combine the outputs of the three decoders to form the final 64-bit output
    always_comb begin
        y = 64'b0; // Initialize output to zero
        for (int i = 0; i < 4; i++) begin
            for (int j = 0; j < 4; j++) begin
                for (int k = 0; k < 4; k++) begin
                    if (dec_high[i] & dec_mid[j] & dec_low[k]) begin
                        y[(i*16) + (j*4) + k] = 1'b1;
                    end
                end
            end
        end
    end
endmodule

   


module decoder2_4 (
    input logic [1:0] a,
    output logic [3:0] y
);

    always_comb begin
        case (a)
            2'b00: y = 4'b0001;
            2'b01: y = 4'b0010;
            2'b10: y = 4'b0100;
            2'b11: y = 4'b1000;
            default: y = 4'b0000; // Default case for safety
        endcase
    end
endmodule