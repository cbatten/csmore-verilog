//========================================================================
// Mux2_4b_struct
//========================================================================
// A two-input four-bit multiplexor implemented structurally.

`include "Mux2.v"

module Mux2_4b_struct
(
  input  logic [3:0] in0,
  input  logic [3:0] in1,
  input  logic       sel,
  output logic [3:0] out
);

  Mux2 mux2_0
  (
    .in0 (in0[0]),
    .in1 (in1[0]),
    .sel (sel),
    .out (out[0])
  );

  Mux2 mux2_1
  (
    .in0 (in0[1]),
    .in1 (in1[1]),
    .sel (sel),
    .out (out[1])
  );

  Mux2 mux2_2
  (
    .in0 (in0[2]),
    .in1 (in1[2]),
    .sel (sel),
    .out (out[2])
  );

  Mux2 mux2_3
  (
    .in0 (in0[3]),
    .in1 (in1[3]),
    .sel (sel),
    .out (out[3])
  );

endmodule

