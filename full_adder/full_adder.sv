module full_adder (input logic a, b, cin,
       output logic s, cout);
       
    logic p, q;
  assign p = a ^ b;
  assign q = a & b;
  assign s = p ^ cin;
  assign cout = q | (p & cin);

endmodule

/*
module fulladder(input logic a, b, cin,
output logic s, cout);
logic p, g;
always_comb
begin
p = a ^ b; // блокирующее
g = a & b; // блокирующее
s = p ^ cin; // блокирующее
cout = g |(p & cin); // блокирующее
end
endmodule
*/