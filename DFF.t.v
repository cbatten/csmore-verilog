//========================================================================
// DFF Unit Tests
//========================================================================

`include "DFF.v"
`include "vc-test.v"

module top;
  `VC_TEST_SUITE_BEGIN( "DFF" )

  //----------------------------------------------------------------------
  // Test DFF
  //----------------------------------------------------------------------

  logic t0_clk;
  logic t0_reset;
  logic t0_en;
  logic t0_d;
  logic t0_q;

  DFF dff
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
    input logic clk,
    input logic reset,
    input logic en,
    input logic d,
    input logic q
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

    t0( 0, 0, 0, 0, 'x );
    t0( 0, 1, 0, 0, 'x );
    t0( 1, 1, 0, 0, 0  );
    t0( 1, 1, 0, 0, 0  );
    t0( 1, 0, 0, 0, 0  );
    t0( 0, 0, 0, 0, 0  );

  end
  `VC_TEST_CASE_END

  `VC_TEST_CASE_BEGIN( 2, "basic" )
  begin

    #1;

    // reset

    t0( 0, 0, 0, 0, 0 );
    t0( 0, 1, 0, 0, 0 );
    t0( 1, 1, 0, 0, 0 );
    t0( 1, 1, 0, 0, 0 );
    t0( 1, 0, 0, 0, 0 );
    t0( 0, 0, 0, 0, 0 );

    // store one

    t0( 0, 0, 0, 0, 0 );
    t0( 0, 0, 1, 1, 0 );
    t0( 1, 0, 1, 1, 1 );
    t0( 1, 0, 1, 1, 1 );
    t0( 1, 0, 0, 0, 1 );
    t0( 0, 0, 0, 0, 1 );

    // store zero

    t0( 0, 0, 0, 0, 1 );
    t0( 0, 0, 1, 0, 1 );
    t0( 1, 0, 1, 0, 0 );
    t0( 1, 0, 1, 0, 0 );
    t0( 1, 0, 0, 0, 0 );
    t0( 0, 0, 0, 0, 0 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_CASE_BEGIN( 3, "en" )
  begin

    #1;

    // reset

    t0( 0, 0, 0, 0, 0 );
    t0( 0, 1, 0, 0, 0 );
    t0( 1, 1, 0, 0, 0 );
    t0( 1, 1, 0, 0, 0 );
    t0( 1, 0, 0, 0, 0 );
    t0( 0, 0, 0, 0, 0 );

    // store one (en = 0)

    t0( 0, 0, 0, 0, 0 );
    t0( 0, 0, 0, 1, 0 );
    t0( 1, 0, 0, 1, 0 );
    t0( 1, 0, 0, 1, 0 );
    t0( 1, 0, 0, 0, 0 );
    t0( 0, 0, 0, 0, 0 );

    // store zero (en = 0)

    t0( 0, 0, 0, 0, 0 );
    t0( 0, 0, 0, 0, 0 );
    t0( 1, 0, 0, 0, 0 );
    t0( 1, 0, 0, 0, 0 );
    t0( 1, 0, 0, 0, 0 );
    t0( 0, 0, 0, 0, 0 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_SUITE_END
endmodule

