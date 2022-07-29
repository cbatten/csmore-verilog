//========================================================================
// Adder_4b Unit Tests
//========================================================================

`include "Adder_4b_rtl.v"
`include "vc-test.v"

module top;
  `VC_TEST_SUITE_BEGIN( "Adder_4b_rtl" )

  //----------------------------------------------------------------------
  // Test Adder
  //----------------------------------------------------------------------

  logic [3:0] t0_a;
  logic [3:0] t0_b;
  logic [3:0] t0_sum;

  Adder_4b_rtl ha
  (
    .a    (t0_a),
    .b    (t0_b),
    .sum  (t0_sum)
  );

  // Helper task

  task t0
  (
    input logic [3:0] a,
    input logic [3:0] b,
    input logic [3:0] sum
  );
  begin
    t0_a    = a;
    t0_b    = b;
    #1;
    `VC_TEST_NOTE_INPUTS_2( a, b );
    `VC_TEST_NET( t0_sum,  sum  );
    #9;
  end
  endtask

  // Test case

  `VC_TEST_CASE_BEGIN( 1, "simple" )
  begin

    #1;

    t0( 4'd0, 4'd0, 4'd0  );
    t0( 4'd1, 4'd1, 4'd2  );
    t0( 4'd2, 4'd3, 4'd5  );
    t0( 4'd5, 4'd7, 4'd12 );
    t0( 4'd7, 4'd8, 4'd15 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_CASE_BEGIN( 2, "overflow" )
  begin

    #1;

    t0( 4'd8, 4'd8, 4'd0  );
    t0( 4'd8, 4'd9, 4'd1  );

  end
  `VC_TEST_CASE_END

  `VC_TEST_SUITE_END
endmodule

