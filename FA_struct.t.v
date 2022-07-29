//========================================================================
// FA Unit Tests
//========================================================================

`include "FA_struct.v"
`include "vc-test.v"

module top;
  `VC_TEST_SUITE_BEGIN( "FA_struct" )

  //----------------------------------------------------------------------
  // Test FA
  //----------------------------------------------------------------------

  logic t0_a;
  logic t0_b;
  logic t0_cin;
  logic t0_cout;
  logic t0_sum;

  FA_struct ha
  (
    .a    (t0_a),
    .b    (t0_b),
    .cin  (t0_cin),
    .cout (t0_cout),
    .sum  (t0_sum)
  );

  // Helper task

  task t0
  (
    input logic a,
    input logic b,
    input logic cin,
    input logic cout,
    input logic sum
  );
  begin
    t0_a    = a;
    t0_b    = b;
    t0_cin  = cin;
    #1;
    `VC_TEST_NOTE_INPUTS_3( a, b, cin );
    `VC_TEST_NET( t0_cout, cout );
    `VC_TEST_NET( t0_sum,  sum  );
    #9;
  end
  endtask

  // Test case

  `VC_TEST_CASE_BEGIN( 1, "exhaustive" )
  begin

    #1;

    t0( 0, 0, 0, 0, 0 );
    t0( 0, 0, 1, 0, 1 );
    t0( 0, 1, 0, 0, 1 );
    t0( 0, 1, 1, 1, 0 );
    t0( 1, 0, 0, 0, 1 );
    t0( 1, 0, 1, 1, 0 );
    t0( 1, 1, 0, 1, 0 );
    t0( 1, 1, 1, 1, 1 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_SUITE_END
endmodule

