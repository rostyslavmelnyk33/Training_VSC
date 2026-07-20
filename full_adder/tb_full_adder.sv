module tb;

logic a, b, cin;
logic s, cout;

full_adder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);

    $display("a b cin | s cout");

    // 000
    a = 0; b = 0; cin = 0; #1;
    $display("%b %b  %b | %b  %b", a, b, cin, s, cout);
    if (s == 0 && cout == 0)
        $display("PASS");
    else
        $display("FAIL");

    // 001
    a = 0; b = 0; cin = 1; #1;
    $display("%b %b  %b | %b  %b", a, b, cin, s, cout);
    if (s == 1 && cout == 0)
        $display("PASS");
    else
        $display("FAIL");

    // 010
    a = 0; b = 1; cin = 0; #1;
    $display("%b %b  %b | %b  %b", a, b, cin, s, cout);
    if (s == 1 && cout == 0)
        $display("PASS");
    else
        $display("FAIL");

    // 011
    a = 0; b = 1; cin = 1; #1;
    $display("%b %b  %b | %b  %b", a, b, cin, s, cout);
    if (s == 0 && cout == 1)
        $display("PASS");
    else
        $display("FAIL");

    // 100
    a = 1; b = 0; cin = 0; #1;
    $display("%b %b  %b | %b  %b", a, b, cin, s, cout);
    if (s == 1 && cout == 0)
        $display("PASS");
    else
        $display("FAIL");

    // 101
    a = 1; b = 0; cin = 1; #1;
    $display("%b %b  %b | %b  %b", a, b, cin, s, cout);
    if (s == 0 && cout == 1)
        $display("PASS");
    else
        $display("FAIL");

    // 110
    a = 1; b = 1; cin = 0; #1;
    $display("%b %b  %b | %b  %b", a, b, cin, s, cout);
    if (s == 0 && cout == 1)
        $display("PASS");
    else
        $display("FAIL");

    // 111
    a = 1; b = 1; cin = 1; #1;
    $display("%b %b  %b | %b  %b", a, b, cin, s, cout);
    if (s == 1 && cout == 1)
        $display("PASS");
    else
        $display("FAIL");

    $finish;
end

endmodule