//========================================================================
// SRLatch
//========================================================================
// A classic SR latch with cross-coupled NOR gates

module SRLatch
(
  input  logic s,
  input  logic r,
  output logic q
);

  logic n0;
  logic n1;

  nor nor0( n1, s,  n0 );
  nor nor1( n0, n1, r  );

  assign q = n0;

endmodule

