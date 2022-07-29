//========================================================================
// FA_struct
//========================================================================
// A one-bit full adder implemented structurally

`include "HA_gl.v"

module FA_struct
(
  input  logic a,
  input  logic b,
  input  logic cin,
  output logic cout,
  output logic sum
);

  logic ha0_cout;
  logic ha0_sum;

  HA_gl ha0
  (
    .a    (a),
    .b    (b),
    .cout (ha0_cout),
    .sum  (ha0_sum)
  );

  logic ha1_cout;
  logic ha1_sum;

  HA_gl ha1
  (
    .a    (ha0_sum),
    .b    (cin),
    .cout (ha1_cout),
    .sum  (ha1_sum)
  );

  assign sum = ha1_sum;

  or or0( cout, ha0_cout, ha1_cout );

endmodule

