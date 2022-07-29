//========================================================================
// DLatch Unit Tests
//========================================================================

`include "DLatch.v"
`include "vc-test.v"

module top;
  `VC_TEST_SUITE_BEGIN( "DLatch" )

  //----------------------------------------------------------------------
  // Test DLatch
  //----------------------------------------------------------------------

  logic t0_clk;
  logic t0_d;
  logic t0_q;

  DLatch dlatch
  (
    .clk (t0_clk),
    .d   (t0_d),
    .q   (t0_q)
  );

  // Helper task

  task t0
  (
    input logic clk,
    input logic d,
    input logic q
  );
  begin
    t0_clk = clk;
    t0_d   = d;
    #1;
    `VC_TEST_NOTE_INPUTS_2( clk, d );
    `VC_TEST_NET( t0_q, q );
    #9;
  end
  endtask

  // Test case

  `VC_TEST_CASE_BEGIN( 1, "basic" )
  begin

    #1;

    t0( 0, 0, 'x );
    t0( 1, 0, 0 );
    t0( 0, 0, 0 );

    t0( 0, 1, 0 );
    t0( 1, 1, 1 );
    t0( 0, 0, 1 );

    t0( 0, 0, 1 );
    t0( 1, 0, 0 );
    t0( 0, 0, 0 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_CASE_BEGIN( 2, "opaque" )
  begin

    #1;

    t0( 0, 0, 0 );
    t0( 1, 0, 0 );
    t0( 0, 0, 0 );

    t0( 0, 1, 0 );
    t0( 0, 1, 0 );
    t0( 0, 0, 0 );
    t0( 0, 1, 0 );
    t0( 0, 1, 0 );
    t0( 0, 0, 0 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_CASE_BEGIN( 3, "transparent" )
  begin

    #1;

    t0( 0, 0, 0 );
    t0( 1, 0, 0 );
    t0( 0, 0, 0 );

    t0( 1, 1, 1 );
    t0( 1, 1, 1 );
    t0( 1, 0, 0 );
    t0( 1, 1, 1 );
    t0( 1, 1, 1 );
    t0( 1, 0, 0 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_SUITE_END
endmodule

