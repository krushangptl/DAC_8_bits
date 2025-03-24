`timescale 1ns / 1ps

module dac8bit (
    input  logic [7:0] D,     // 8-bit digital input
    input  real        Vref,  // Reference voltage
    output real        Vout   // Analog output (real number)
);

  real Vout_reg;  // internal real variable

  // continuous assignment to the real output
  assign Vout = Vout_reg;

  always @(*) begin
    Vout_reg = Vref * (real'(D)) / 255.0;  // Linear mapping
  end

endmodule
