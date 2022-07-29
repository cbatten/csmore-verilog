//========================================================================
// Mux2_4b Testbench
//========================================================================

`include "Mux2_4b.v"

module top;

  // Instantiate design under test

  logic [3:0] mux2_in0;
  logic [3:0] mux2_in1;
  logic       mux2_sel;
  logic [3:0] mux2_out;

  Mux2_4b mux2
  (
    .in0 (mux2_in0),
    .in1 (mux2_in1),
    .sel (mux2_sel),
    .out (mux2_out)
  );

  // Run test

  initial begin
    $dumpvars;

    #1;

    mux2_in0 = 4'b0000;
    mux2_in1 = 4'b0000;
    mux2_sel = 0;

    #10;

    if ( mux2_out != 4'b0000 ) $error();

    mux2_in0 = 4'b1010;;
    mux2_in1 = 4'b0101;;
    mux2_sel = 1;

    #10;

    if ( mux2_out != 4'b0101 ) $error();

    mux2_in0 = 4'b1110;;
    mux2_in1 = 4'b0111;;
    mux2_sel = 0;

    #10;

    if ( mux2_out != 4'b1110 ) $error();

    mux2_in0 = 4'b1110;;
    mux2_in1 = 4'b0111;;
    mux2_sel = 1;

    #10;

    if ( mux2_out != 4'b0111 ) $error();

    $finish;
  end

endmodule

