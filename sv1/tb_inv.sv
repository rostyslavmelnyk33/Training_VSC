module tb;

logic [3:0] a;
logic [3:0] y;

// Підключення модуля, який тестуємо
inv dut (
    .a(a),
    .y(y)
);

initial begin

    // Створити VCD-файл
    $dumpfile("wave.vcd");
    // Записувати всі сигнали testbench
    $dumpvars(0, tb);
    $display("a     y");

    a = 4'b0000; #1;

    $display("%b  %b", a, y);

    a = 4'b1010; #1;

    $display("%b  %b", a, y);

    a = 4'b1111; #1;

    $display("%b  %b", a, y);

    $finish;

end

endmodule