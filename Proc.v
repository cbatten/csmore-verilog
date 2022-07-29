//========================================================================
// Proc
//========================================================================

`include "ProcDpath.v"
`include "ProcCtrl.v"

module Proc
(
  input  logic       clk,
  input  logic       reset,

  output logic [3:0] pc,
  output logic [3:0] result
);

  logic       regA_en;
  logic       regA_sel;
  logic       regB_en;
  logic       regB_sel;
  logic [3:0] imm;

  ProcDpath dpath
  (
    .clk      (clk),
    .reset    (reset),
    .regA_en  (regA_en),
    .regA_sel (regA_sel),
    .regB_en  (regB_en),
    .regB_sel (regB_sel),
    .imm      (imm),
    .result   (result)
  );

  ProcCtrl ctrl
  (
    .clk      (clk),
    .reset    (reset),
    .regA_en  (regA_en),
    .regA_sel (regA_sel),
    .regB_en  (regB_en),
    .regB_sel (regB_sel),
    .imm      (imm),
    .pc       (pc)
  );

endmodule

