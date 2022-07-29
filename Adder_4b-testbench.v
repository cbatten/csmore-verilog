//========================================================================
// Adder_4b Testbench
//========================================================================

`include "Adder_4b.v"

module top;

  // Instantiate design under test

  logic [3:0] adder_a;
  logic [3:0] adder_b;
  logic [3:0] adder_sum;

  Adder_4b adder
  (
    .a   (adder_a),
    .b   (adder_b),
    .sum (adder_sum)
  );

  // Run test

  initial begin
    $dumpvars;

    #1;

    adder_a = 4'd0;
    adder_b = 4'd0;

    #10;

    if ( adder_sum != 4'd0 ) $error();

    adder_a = 4'd1;
    adder_b = 4'd1;

    #10;

    if ( adder_sum != 4'd2 ) $error();

    adder_a = 4'd2;
    adder_b = 4'd3;

    #10;

    if ( adder_sum != 4'd5 ) $error();

    adder_a = 4'd5;
    adder_b = 4'd7;

    #10;

    if ( adder_sum != 4'd12 ) $error();

    adder_a = 4'd7;
    adder_b = 4'd8;

    #10;

    if ( adder_sum != 4'd15 ) $error();

    adder_a = 4'd8;
    adder_b = 4'd8;

    #10;

    if ( adder_sum != 4'd0 ) $error();

    adder_a = 4'd8;
    adder_b = 4'd9;

    #10;

    if ( adder_sum != 4'd1 ) $error();

    $finish;
  end

endmodule

