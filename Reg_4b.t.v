//========================================================================
// Reg_4b Unit Tests
//========================================================================

`include "Reg_4b.v"
`include "vc-test.v"

module top;
  `VC_TEST_SUITE_BEGIN( "Reg_4b" )

  //----------------------------------------------------------------------
  // Test Reg_4bSimple_rtl
  //----------------------------------------------------------------------

  logic       t0_clk;
  logic       t0_reset;
  logic       t0_en;
  logic [3:0] t0_d;
  logic [3:0] t0_q;

  Reg_4b dff
  (
    .clk   (t0_clk),
    .reset (t0_reset),
    .en    (t0_en),
    .d     (t0_d),
    .q     (t0_q)
  );

  // Helper task

  task t0
  (
    input logic       clk,
    input logic       reset,
    input logic       en,
    input logic [3:0] d,
    input logic [3:0] q
  );
  begin
    t0_clk   = clk;
    t0_reset = reset;
    t0_en    = en;
    t0_d     = d;
    #1;
    `VC_TEST_NOTE_INPUTS_4( clk, reset, en, d );
    `VC_TEST_NET( t0_q, q );
    #9;
  end
  endtask

  // Test case

  `VC_TEST_CASE_BEGIN( 1, "reset" )
  begin

    #1;

    // reset

    t0( 0, 0, 0, 4'd0, 4'dx );
    t0( 0, 1, 0, 4'd0, 4'dx );
    t0( 1, 1, 0, 4'd0, 4'd0 );
    t0( 1, 1, 0, 4'd0, 4'd0 );
    t0( 1, 0, 0, 4'd0, 4'd0 );
    t0( 0, 0, 0, 4'd0, 4'd0 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_CASE_BEGIN( 2, "basic" )
  begin

    #1;

    // reset

    t0( 0, 0, 0, 4'd0, 4'd0 );
    t0( 0, 1, 0, 4'd0, 4'd0 );
    t0( 1, 1, 0, 4'd0, 4'd0 );
    t0( 1, 1, 0, 4'd0, 4'd0 );
    t0( 1, 0, 0, 4'd0, 4'd0 );
    t0( 0, 0, 0, 4'd0, 4'd0 );

    // store one

    t0( 0, 0, 0, 4'd0, 4'd0 );
    t0( 0, 0, 1, 4'd1, 4'd0 );
    t0( 1, 0, 1, 4'd1, 4'd1 );
    t0( 1, 0, 1, 4'd1, 4'd1 );
    t0( 1, 0, 0, 4'd0, 4'd1 );
    t0( 0, 0, 0, 4'd0, 4'd1 );

    // store zero

    t0( 0, 0, 0, 4'd0, 4'd1 );
    t0( 0, 0, 1, 4'd0, 4'd1 );
    t0( 1, 0, 1, 4'd0, 4'd0 );
    t0( 1, 0, 1, 4'd0, 4'd0 );
    t0( 1, 0, 0, 4'd0, 4'd0 );
    t0( 0, 0, 0, 4'd0, 4'd0 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_CASE_BEGIN( 3, "en" )
  begin

    #1;

    // reset

    t0( 0, 0, 0, 4'd0, 4'd0 );
    t0( 0, 1, 0, 4'd0, 4'd0 );
    t0( 1, 1, 0, 4'd0, 4'd0 );
    t0( 1, 1, 0, 4'd0, 4'd0 );
    t0( 1, 0, 0, 4'd0, 4'd0 );
    t0( 0, 0, 0, 4'd0, 4'd0 );

    // store one (en = 0)

    t0( 0, 0, 0, 4'd0, 4'd0 );
    t0( 0, 0, 0, 4'd1, 4'd0 );
    t0( 1, 0, 0, 4'd1, 4'd0 );
    t0( 1, 0, 0, 4'd1, 4'd0 );
    t0( 1, 0, 0, 4'd0, 4'd0 );
    t0( 0, 0, 0, 4'd0, 4'd0 );

    // store zero (en = 0)

    t0( 0, 0, 0, 4'd0, 4'd0 );
    t0( 0, 0, 0, 4'd0, 4'd0 );
    t0( 1, 0, 0, 4'd0, 4'd0 );
    t0( 1, 0, 0, 4'd0, 4'd0 );
    t0( 1, 0, 0, 4'd0, 4'd0 );
    t0( 0, 0, 0, 4'd0, 4'd0 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_SUITE_END
endmodule

