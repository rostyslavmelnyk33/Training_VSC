// test_func: y = a(~b) + (~b)(~c) + (~a)bc
module test_func (
    input logic a, b, c,
    output logic y);
   /* mux8 mux (
        .d0(1'b1), // m0
        .d1(1'b0), // m1
        .d2(1'b0), // m2
        .d3(1'b1), // m3
        .d4(1'b1), // m4
        .d5(1'b1), // m5
        .d6(1'b0), // m6
        .d7(1'b0), // m7
        .s({a, b, c}),
        .y(y)
    );
    */
    mux4 mux (
        .d0(1'b1), // m0
        .d1(a), // m1
        .d2(1'b0), // m2
        .d3(~a), // m3
        .s({b, c}),
        .y(y)
    );
    
endmodule

module mux8 (
    input logic d0, d1, d2, d3, d4, d5, d6, d7,
    input logic [2:0] s,
    output logic y);
    assign y = s[2] ? 
            (s[1] ? (s[0] ? d7 : d6) : (s[0] ? d5 : d4)) :  
            (s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0));
endmodule

module mux4 (
    input logic d0, d1, d2, d3,
    input logic [1:0] s,
    output logic y);
    assign y = s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0);
endmodule