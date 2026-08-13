module tb;
  logic [1:0] adr;
  logic [2:0] dout;

  rom uut (
      .adr (adr),
      .dout(dout)
  );

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
    $monitor("Time: %0t, adr: %b, dout: %b", $time, adr, dout);
    // Test all possible addresses
    for (int i = 0; i < 4; i++) begin
      adr = i[1:0];
      #1;  // Wait for a time unit to allow dout to update
      $display("adr: %b, dout: %b", adr, dout);
    end
    $finish;
  end
endmodule
