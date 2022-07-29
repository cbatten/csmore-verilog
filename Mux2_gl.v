//========================================================================
// Mux2_gl
//========================================================================
// A two-input one-bit multiplexor implemented using gate-level modeling.

module Mux2_gl
(
  input  logic in0,
  input  logic in1,
  input  logic sel,
  output logic out
);

  // Create complemented versions of input ports

  logic in0_b, in1_b, sel_b;
  not not0( in0_b, in0 );
  not not1( in1_b, in1 );
  not not2( sel_b, sel );

  // AND gates

  logic n0, n1, n2, n3;
  and and0( n0, in0_b, in1,   sel   );
  and and1( n1, in0,   in1_b, sel_b );
  and and2( n2, in0,   in1,   sel_b );
  and and3( n3, in0,   in1,   sel   );

  // OR gate

  or or0( out, n0, n1, n2, n3 );

endmodule

