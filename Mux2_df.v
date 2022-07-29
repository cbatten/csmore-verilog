//========================================================================
// Mux2_df
//========================================================================
// A two-input one-bit multiplexor implemented using assign statements.

module Mux2_df
(
  input  logic in0,
  input  logic in1,
  input  logic sel,
  output logic out
);

  // AND gates

  logic n0, n1, n2, n3;
  assign n0 = ~in0 &  in1 &  sel;
  assign n1 =  in0 & ~in1 & ~sel;
  assign n2 =  in0 &  in1 & ~sel;
  assign n3 =  in0 &  in1 &  sel;

  // OR gate

  assign out = n0 | n1 | n2 | n3;

endmodule

