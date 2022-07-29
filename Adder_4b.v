//========================================================================
// Adder_4b
//========================================================================
// A four-bit adder

module Adder_4b
(
  input  logic [3:0] a,
  input  logic [3:0] b,
  output logic [3:0] sum
);

  assign sum = a + b;

endmodule

