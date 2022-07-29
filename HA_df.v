//========================================================================
// HA_df
//========================================================================
// A one-bit half adder using assign statements.

module HA_df
(
  input  logic a,
  input  logic b,
  output logic cout,
  output logic sum
);

  assign cout = a & b;
  assign sum  = (~a & b) | (a & ~b);

endmodule

