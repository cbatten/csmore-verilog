//========================================================================
// Proc Unit Tests
//========================================================================

`include "Proc.v"
`include "vc-test.v"

module top;
  `VC_TEST_SUITE_BEGIN( "Proc" )

  //----------------------------------------------------------------------
  // Test Proc
  //----------------------------------------------------------------------

  // Instantiate design under test

  logic       t0_reset;
  logic [3:0] t0_pc;
  logic [3:0] t0_result;

  Proc proc
  (
    .clk    (clk),
    .reset  (t0_reset),
    .pc     (t0_pc),
    .result (t0_result)
  );

  // Helper task

  task t0
  (
    input logic [3:0] pc,
    input logic [3:0] result
  );
  begin
    #1;
    `VC_TEST_NET( t0_pc, pc );
    `VC_TEST_NET( t0_result, result );
    #9;
  end
  endtask

  // Test case

  `VC_TEST_CASE_BEGIN( 1, "basic" )
  begin

    #1;

    t0_reset = 1;
    #20;
    t0_reset = 0;

    t0( 0,  0 );
    t0( 1,  0 );
    t0( 2,  1 );
    t0( 3,  2 );
    t0( 4,  3 );
    t0( 5,  5 );
    t0( 6,  8 );
    t0( 7, 13 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_SUITE_END
endmodule

