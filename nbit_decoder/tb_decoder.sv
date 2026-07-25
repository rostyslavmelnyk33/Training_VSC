module tb_decoder;
    localparam int N = 3;

    logic [N-1:0] a;
    logic [(2**N)-1:0] y;
    logic [(2**N)-1:0] expected;

    decoder #(.N(N)) dut (
        .a(a),
        .y(y)
    );

    initial begin
        // Ініціалізація запису хвиль
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_decoder);

        $display("=== Starting testbench for parameterized decoder (N=%0d) ===", N);

        for (int i = 0; i < (2**N); i++) begin
            a = i[N-1:0];
            #10;

            // Обчислюємо очікуваний результат (один біт встановлено в 1)
            expected = '0;
            expected[i] = 1'b1;

            // Самоперевірка
            if (y === expected) begin
                $display("Test %0d PASS | a=%b -> y=%b", i, a, y);
            end else begin
                $fatal(1, "Test %0d FAIL | a=%b | expected=%b, got=%b", i, a, expected, y);
            end
        end

        $display("--------------------------------------------------");
        $display("ALL TESTS COMPLETED");
        $display("--------------------------------------------------");

        $finish;
    end
endmodule