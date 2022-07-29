//========================================================================
// Mux2_4b_rtl
//========================================================================
// A two-input four-bit multiplexor implemented using RTL modeling.

module Mux2_4b_rtl
(
  input  logic [3:0] in0,
  input  logic [3:0] in1,
  input  logic       sel,
  output logic [3:0] out
);

  always @(*) begin
    if ( sel == 0 )
      out = in0;
    else
      out = in1;
  end

endmodule

