//========================================================================
// Adder_4b_struct
//========================================================================
// A four-bit adder implemented structurally

`include "FA_struct.v"

module Adder_4b_struct
(
  input  logic [3:0] a,
  input  logic [3:0] b,
  output logic [3:0] sum
);

  logic fa0_cout;

  FA_struct fa0
  (
    .a    (a[0]),
    .b    (b[0]),
    .cin  (1'b0),
    .cout (fa0_cout),
    .sum  (sum[0])
  );

  logic fa1_cout;

  FA_struct fa1
  (
    .a    (a[1]),
    .b    (b[1]),
    .cin  (fa0_cout),
    .cout (fa1_cout),
    .sum  (sum[1])
  );

  logic fa2_cout;

  FA_struct fa2
  (
    .a    (a[2]),
    .b    (b[2]),
    .cin  (fa1_cout),
    .cout (fa2_cout),
    .sum  (sum[2])
  );

  logic fa3_cout;

  FA_struct fa3
  (
    .a    (a[3]),
    .b    (b[3]),
    .cin  (fa2_cout),
    .cout (fa3_cout),
    .sum  (sum[3])
  );

endmodule

