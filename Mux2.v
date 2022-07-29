//========================================================================
// Mux2
//========================================================================
// A two-input one-bit multiplexor

module Mux2
(
  input  logic in0,
  input  logic in1,
  input  logic sel,
  output logic out
);

  always @(*) begin
    if ( sel == 0 )
      out = in0;
    else
      out = in1;
  end

endmodule

