//========================================================================
// HA_gl
//========================================================================
// A one-bit half adder using gate-level modeling.

module HA_gl
(
  input  logic a,
  input  logic b,
  output logic cout,
  output logic sum
);

  // Create complemented versions of input ports

  logic a_b, b_b;
  not not0( a_b, a );
  not not1( b_b, b );

  // cout output

  and and0( cout, a, b );

  // sum output

  logic n0, n1;
  and and0( n0,  a_b, b   );
  and and1( n1,  a,   b_b );
  or  or0 ( sum, n0,  n1  );

endmodule

