//========================================================================
// HA Unit Tests
//========================================================================

`include "HA_df.v"
`include "vc-test.v"

module top;
  `VC_TEST_SUITE_BEGIN( "HA_df" )

  //----------------------------------------------------------------------
  // Test HA
  //----------------------------------------------------------------------

  logic t0_a;
  logic t0_b;
  logic t0_cout;
  logic t0_sum;

  HA_df ha
  (
    .a    (t0_a),
    .b    (t0_b),
    .cout (t0_cout),
    .sum  (t0_sum)
  );

  // Helper task

  task t0
  (
    input logic a,
    input logic b,
    input logic cout,
    input logic sum
  );
  begin
    t0_a    = a;
    t0_b    = b;
    #1;
    `VC_TEST_NOTE_INPUTS_2( a, b );
    `VC_TEST_NET( t0_cout, cout );
    `VC_TEST_NET( t0_sum,  sum  );
    #9;
  end
  endtask

  // Test case

  `VC_TEST_CASE_BEGIN( 1, "exhaustive" )
  begin

    #1;

    t0( 0, 0, 0, 0 );
    t0( 0, 1, 0, 1 );
    t0( 1, 0, 0, 1 );
    t0( 1, 1, 1, 0 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_SUITE_END
endmodule

