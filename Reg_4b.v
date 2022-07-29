//========================================================================
// Reg_4b
//========================================================================
// Four-bit positive edge-triggered register

module Reg_4b
(
  input  logic       clk,
  input  logic       reset,
  input  logic       en,
  input  logic [3:0] d,
  output logic [3:0] q
);

  always @( posedge clk ) begin
    if ( reset )
      q <= 4'b0;
    else if ( en )
      q <= d;
  end

endmodule

