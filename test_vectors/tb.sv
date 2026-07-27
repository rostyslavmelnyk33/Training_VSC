module testbench3();
logic clk, reset;
logic a, b, c, y, yexpected;
logic [31:0] vectornum, errors;
logic [3:0] testvectors[10000:0];
// задание (определение) тестируемого
// устройства
sillyfunction dut(a, b, c, y);
// генерировать такты
always
begin
clk = 1; #5; clk = 0; #5;
end
// при старте теста загрузить векторы
// и дать импульс сброса
initial
begin

$dumpfile("wave.vcd");
$dumpvars(0, testbench3);
$readmemb("example.tv", testvectors);
$display("Testbench started");
$display("Vector0 = %b", testvectors[0]);
$display("Vector1 = %b", testvectors[1]);
vectornum = 0; errors = 0;
reset = 1; #27; reset = 0;
end
// подать тестовые векторы по переднему
// фронту такта
always @(posedge clk)
begin
$display("posedge clk, vector=%0d", vectornum);
#1; {a, b, c, yexpected} =
testvectors[vectornum];
end
// проверить результаты по заднему
// фронту такта
always @(negedge clk)
$display("negedge clk, vector=%0d", vectornum);
if (~reset) begin // пропустить проверку
// при сбросе
// проверить результаты
if (y !== yexpected) begin
$display("Error: inputs = %b", {a,
b, c});
$display(" outputs = %b (%b expected)", y, yexpected);
errors = errors + 1;
end
vectornum = vectornum + 1;
if (testvectors[vectornum] === 4'bx)
begin
$display("%0d tests completed with %0d errors", vectornum, errors);
$finish;
end
end
endmodule