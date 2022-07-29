//========================================================================
// Mux2 Testbench
//========================================================================

`include "Mux2.v"

module top;

  // Instantiate design under test

  logic mux2_in0;
  logic mux2_in1;
  logic mux2_sel;
  logic mux2_out;

  Mux2 mux2
  (
    .in0 (mux2_in0),
    .in1 (mux2_in1),
    .sel (mux2_sel),
    .out (mux2_out)
  );

  // Run test

  initial begin
    $dumpvars;

    #1;

    mux2_in0 = 0;
    mux2_in1 = 0;
    mux2_sel = 0;

    #10;

    if ( mux2_out != 0 ) $error();

    mux2_in0 = 0;
    mux2_in1 = 0;
    mux2_sel = 1;

    #10;

    if ( mux2_out != 0 ) $error();

    mux2_in0 = 0;
    mux2_in1 = 1;
    mux2_sel = 0;

    #10;

    if ( mux2_out != 0 ) $error();

    mux2_in0 = 0;
    mux2_in1 = 1;
    mux2_sel = 1;

    #10;

    if ( mux2_out != 1 ) $error();

    mux2_in0 = 1;
    mux2_in1 = 0;
    mux2_sel = 0;

    #10;

    if ( mux2_out != 1 ) $error();

    mux2_in0 = 1;
    mux2_in1 = 0;
    mux2_sel = 1;

    #10;

    if ( mux2_out != 0 ) $error();

    mux2_in0 = 1;
    mux2_in1 = 1;
    mux2_sel = 0;

    #10;

    if ( mux2_out != 1 ) $error();

    mux2_in0 = 1;
    mux2_in1 = 1;
    mux2_sel = 1;

    $finish;
  end

endmodule

