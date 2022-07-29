//========================================================================
// DFF
//========================================================================
// DFF with enable or reset implemented using RTL modeling

module DFF
(
  input  logic clk,
  input  logic reset,
  input  logic en,
  input  logic d,
  output logic q
);

  always @( posedge clk ) begin
    if ( reset )
      q <= 1'b0;
    else if ( en )
      q <= d;
  end

endmodule

