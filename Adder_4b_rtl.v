//========================================================================
// Adder_4b_rtl
//========================================================================
// A four-bit adder implemented using RTL modeling

module Adder_4b_rtl
(
  input  logic [3:0] a,
  input  logic [3:0] b,
  output logic [3:0] sum
);

  assign sum = a + b;

endmodule

