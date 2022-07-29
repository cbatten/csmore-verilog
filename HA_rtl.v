//========================================================================
// HA_rtl
//========================================================================
// A one-bit half adder using RTL modeling

module HA_rtl
(
  input  logic a,
  input  logic b,
  output logic cout,
  output logic sum
);

  logic [1:0] result;
  assign result = a + b;

  assign cout = result[1];
  assign sum  = result[0];

endmodule

