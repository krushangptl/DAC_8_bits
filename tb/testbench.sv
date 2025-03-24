module testbench;
  reg [7:0] D;
  real Vout;
  real Vref = 5.0;  // experimental reference voltage

  integer i;
  integer fh;

  dac8bit uut (
      .D(D),
      .Vref(Vref),
      .Vout(Vout)
  );

  initial begin
    fh = $fopen("dac8bit.csv", "w");
    if (fh == 0) begin
      $display("Error opening dac8bit.csv");
      $finish;
    end
    $fdisplay(fh, "code,vout");
    for (i = 0; i < 256; i = i + 1) begin
      D = i;
      #1 $fdisplay(fh, "%0d,%.12f", D, Vout);
    end
    $fclose(fh);
    $display("Simulation complete. CSV written to dac8bit.csv");
    $finish;
  end
endmodule
