//========================================================================
// ProcCtrl
//========================================================================

module ProcCtrl
(
  input  logic       clk,
  input  logic       reset,

  output logic       regA_en,
  output logic       regA_sel,
  output logic       regB_en,
  output logic       regB_sel,
  output logic [3:0] imm,

  output logic [3:0] pc
);

  // Program Counter

  logic [3:0] pc_reg;

  always @( posedge clk ) begin
    if ( reset )
      pc_reg <= 4'b0;
    else
      pc_reg <= pc_reg + 1;
  end

  assign pc = pc_reg;

  // Instruction Memory

  logic [7:0] cs;

  always @(*) begin
    case ( pc_reg )
      4'd0  : cs = 8'h80;
      4'd1  : cs = 8'h21;
      4'd2  : cs = 8'hC0;
      4'd3  : cs = 8'h30;
      4'd4  : cs = 8'hC0;
      4'd5  : cs = 8'h30;
      4'd6  : cs = 8'hC0;
      4'd7  : cs = 8'h00;
      4'd8  : cs = 8'h00;
      4'd9  : cs = 8'h00;
      4'd10 : cs = 8'h00;
      4'd11 : cs = 8'h00;
      4'd12 : cs = 8'h00;
      4'd13 : cs = 8'h00;
      4'd14 : cs = 8'h00;
      4'd15 : cs = 8'h00;
    endcase
  end

  assign regA_en  = cs[7];
  assign regA_sel = cs[6];
  assign regB_en  = cs[5];
  assign regB_sel = cs[4];
  assign imm      = cs[3:0];

endmodule







