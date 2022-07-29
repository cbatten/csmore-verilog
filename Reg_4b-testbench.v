//========================================================================
// Reg_4b Testbench
//========================================================================

`include "Reg_4b.v"

module top;

  // Create clock

  logic clk = 1'b1;
  always #5 clk = ~clk;

  // Instantiate design under test

  logic       reset;
  logic       reg_en;
  logic [3:0] reg_d;
  logic [3:0] reg_q;

  Reg_4b reg_
  (
    .clk   (clk),
    .reset (reset),
    .en    (reg_en),
    .d     (reg_d),
    .q     (reg_q)
  );

  // Run test

  initial begin
    $dumpvars;

    #1;

    reset = 1;
    #20;
    reset = 0;

    reg_en = 1;
    reg_d  = 4'd0;

    #10;

    if ( reg_q != 4'd0 ) $error();

    reg_en = 1;
    reg_d  = 4'd1;

    #10;

    if ( reg_q != 4'd1 ) $error();

    reg_en = 0;
    reg_d  = 4'd2;

    #10;

    if ( reg_q != 4'd1 ) $error();

    reg_en = 1;
    reg_d  = 4'd3;

    #10;

    if ( reg_q != 4'd3 ) $error();

    $finish;
  end

endmodule

