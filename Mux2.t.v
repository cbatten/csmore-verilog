//========================================================================
// Mux2 Unit Tests
//========================================================================

`include "Mux2.v"
`include "vc-test.v"

module top;
  `VC_TEST_SUITE_BEGIN( "Mux2" )

  //----------------------------------------------------------------------
  // Test Mux2
  //----------------------------------------------------------------------

  logic t0_in0;
  logic t0_in1;
  logic t0_sel;
  logic t0_out;

  Mux2 mux2
  (
    .in0 (t0_in0),
    .in1 (t0_in1),
    .sel (t0_sel),
    .out (t0_out)
  );

  // Helper task

  task t0
  (
    input logic in0,
    input logic in1,
    input logic sel,
    input logic out
  );
  begin
    t0_in0 = in0;
    t0_in1 = in1;
    t0_sel = sel;
    #1;
    `VC_TEST_NOTE_INPUTS_3( in0, in1, sel );
    `VC_TEST_NET( t0_out, out );
    #9;
  end
  endtask

  // Test case

  `VC_TEST_CASE_BEGIN( 1, "exhaustive" )
  begin

    #1;

    t0( 0, 0, 0, 0 );
    t0( 0, 0, 1, 0 );
    t0( 0, 1, 0, 0 );
    t0( 0, 1, 1, 1 );
    t0( 1, 0, 0, 1 );
    t0( 1, 0, 1, 0 );
    t0( 1, 1, 0, 1 );
    t0( 1, 1, 1, 1 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_SUITE_END
endmodule

