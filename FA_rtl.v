//========================================================================
// FA_rtl
//========================================================================
// A one-bit full adder implemented with RTL modeling

module FA_rtl
(
  input  logic a,
  input  logic b,
  input  logic cin,
  output logic cout,
  output logic sum
);

  logic [1:0] result;
  assign result = a + b + cin;

  assign cout = result[1];
  assign sum  = result[0];

endmodule

