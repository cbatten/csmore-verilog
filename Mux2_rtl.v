//========================================================================
// Mux2_rtl
//========================================================================
// A two-input one-bit multiplexor implemented using RTL modeling.

module Mux2_rtl
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

