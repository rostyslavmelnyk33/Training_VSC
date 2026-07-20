module full_adder (input logic a, b, cin,
       output logic s, cout);
       
    logic p, q;
  assign p = a ^ b;
  assign q = a & b;
  assign s = p ^ cin;
  assign cout = q | (p & cin);

endmodule