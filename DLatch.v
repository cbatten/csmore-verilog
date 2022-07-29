//========================================================================
// DLatch
//========================================================================
// A DLatch implemented using a SR latch

`include "SRLatch.v"

module DLatch
(
  input  logic clk,
  input  logic d,
  output logic q
);

  logic d_b;
  not not0( d_b, d );

  logic n0;
  and and0( n0, d,   clk );

  logic n1;
  and and1( n1, d_b, clk );

  SRLatch srlatch
  (
    .s (n0),
    .r (n1),
    .q (q)
  );

endmodule

