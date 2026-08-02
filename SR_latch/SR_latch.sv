module SR_latch (
    input  logic S,
    input  logic R,
    output logic Q,
    output logic Q_bar
);

    always_latch begin
        if (S && !R) begin
            Q = 1'b1;
            Q_bar = 1'b0;
        end else if (!S && R) begin
            Q = 1'b0;
            Q_bar = 1'b1;
        end else if (!S && !R) begin
            // Hold state: нічого не робимо, значення зберігається
        end else begin
            // Invalid state: заборонена комбінація
            Q = 1'bx; 
            Q_bar = 1'bx; 
        end
    end

endmodule