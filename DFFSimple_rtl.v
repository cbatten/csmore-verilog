//========================================================================
// DFFSimple
//========================================================================
// DFF without enable or reset implemented using RTL modeling

module DFFSimple_rtl
(
  input  logic clk,
  input  logic d,
  output logic q
);

  always @( posedge clk ) begin
    q <= d;
  end

endmodule

