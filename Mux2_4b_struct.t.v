//========================================================================
// Mux2_4b_struct Unit Tests
//========================================================================

`include "Mux2_4b_struct.v"
`include "vc-test.v"

module top;
  `VC_TEST_SUITE_BEGIN( "Mux2_4b_struct" )

  //----------------------------------------------------------------------
  // Test Mux2_4b_struct
  //----------------------------------------------------------------------

  logic [3:0] t0_in0;
  logic [3:0] t0_in1;
  logic       t0_sel;
  logic [3:0] t0_out;

  Mux2_4b_struct mux2
  (
    .in0 (t0_in0),
    .in1 (t0_in1),
    .sel (t0_sel),
    .out (t0_out)
  );

  // Helper task

  task t0
  (
    input logic [3:0] in0,
    input logic [3:0] in1,
    input logic       sel,
    input logic [3:0] out
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

  `VC_TEST_CASE_BEGIN( 1, "single-bit" )
  begin

    #1;

    t0( 4'b0, 4'b0, 0, 4'b0 );
    t0( 4'b0, 4'b0, 1, 4'b0 );
    t0( 4'b0, 4'b1, 0, 4'b0 );
    t0( 4'b0, 4'b1, 1, 4'b1 );
    t0( 4'b1, 4'b0, 0, 4'b1 );
    t0( 4'b1, 4'b0, 1, 4'b0 );
    t0( 4'b1, 4'b1, 0, 4'b1 );
    t0( 4'b1, 4'b1, 1, 4'b1 );

  end
  `VC_TEST_CASE_END

  // Test case

  `VC_TEST_CASE_BEGIN( 2, "multi-bit" )
  begin

    #1;

    t0( 4'b1010, 4'b0101, 0, 4'b1010 );
    t0( 4'b1010, 4'b0101, 1, 4'b0101 );
    t0( 4'b1110, 4'b0111, 0, 4'b1110 );
    t0( 4'b1110, 4'b0111, 1, 4'b0111 );

  end
  `VC_TEST_CASE_END

  `VC_TEST_SUITE_END
endmodule

