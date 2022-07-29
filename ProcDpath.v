//========================================================================
// ProcDpath
//========================================================================

`include "Mux2_4b.v"
`include "Adder_4b.v"
`include "Reg_4b.v"

module ProcDpath
(
  input  logic       clk,
  input  logic       reset,

  input  logic       regA_en,
  input  logic       regA_sel,
  input  logic       regB_en,
  input  logic       regB_sel,
  input  logic [3:0] imm,

  output logic [3:0] result
);

  logic [3:0] adder_out;
  logic [3:0] muxA_out;

  Mux2_4b muxA
  (
    .in0   (imm),
    .in1   (adder_out),
    .sel   (regA_sel),
    .out   (muxA_out)
  );

  logic [3:0] muxB_out;

  Mux2_4b muxB
  (
    .in0   (imm),
    .in1   (adder_out),
    .sel   (regB_sel),
    .out   (muxB_out)
  );

  logic [3:0] regA_out;

  Reg_4b regA
  (
    .clk   (clk),
    .reset (reset),
    .en    (regA_en),
    .d     (muxA_out),
    .q     (regA_out)
  );

  logic [3:0] regB_out;

  Reg_4b regB
  (
    .clk   (clk),
    .reset (reset),
    .en    (regB_en),
    .d     (muxB_out),
    .q     (regB_out)
  );

  Adder_4b adder
  (
    .a     (regA_out),
    .b     (regB_out),
    .sum   (adder_out)
  );

  assign result = adder_out;

endmodule

