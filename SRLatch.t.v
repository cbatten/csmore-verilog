//========================================================================
// SRLatch Unit Tests
//========================================================================

`include "SRLatch.v"
`include "vc-test.v"

module top;
  `VC_TEST_SUITE_BEGIN( "SRLatch" )

  //----------------------------------------------------------------------
  // Test SRLatch
  //----------------------------------------------------------------------

  logic t0_s;
  logic t0_r;
  logic t0_q;

  SRLatch srlatch
  (
    .s (t0_s),
    .r (t0_r),
    .q (t0_q)
  );

  // Helper task

  task t0
  (
    input logic s,
    input logic r,
    input logic q
  );
  begin
    t0_s = s;
    t0_r = r;
    #1;
    `VC_TEST_NOTE_INPUTS_2( s, r );
    `VC_TEST_NET( t0_q, q );
    #9;
  end
  endtask

  // Test case

  `VC_TEST_CASE_BEGIN( 1, "set_reset" )
  begin

    #1;

    t0( 1, 0, 1 );
    t0( 0, 1, 0 );

  end
  `VC_TEST_CASE_END

  // Test case

  `VC_TEST_CASE_BEGIN( 2, "hold" )
  begin

    #1;

    t0( 1, 0, 1 );
    t0( 0, 0, 1 );

    t0( 0, 1, 0 );
    t0( 0, 0, 0 );

    t0( 1, 0, 1 );
    t0( 0, 0, 1 );

    t0( 0, 1, 0 );
    t0( 0, 0, 0 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_SUITE_END
endmodule

