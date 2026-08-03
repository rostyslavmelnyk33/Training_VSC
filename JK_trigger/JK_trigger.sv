module JK_trigger (
    input logic J,
    input logic K,
    input logic clk,
    output logic Q
);

    always_ff @(posedge clk) begin
        if (J && !K) begin
            Q <= 1;
        end else if (!J && K) begin
            Q <= 0;
        end else if (J && K) begin
            Q <= ~Q;
        end
    end
endmodule
