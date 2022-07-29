//========================================================================
// DFFSimple
//========================================================================
// DFF without enable or reset using structural modeling

`include "DLatch.v"

module DFFSimple_struct
(
  input  logic clk,
  input  logic d,
  output logic q
);

  logic clk_b;
  not not0( clk_b, clk );

  logic n0;

  DLatch dlatch0
  (
    .clk (clk_b),
    .d   (d),
    .q   (n0)
  );

  DLatch dlatch1
  (
    .clk (clk),
    .d   (n0),
    .q   (q)
  );

endmodule

