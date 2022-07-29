//========================================================================
// Proc Testbench
//========================================================================

`include "Proc.v"

module top;

  // Create clock and reset

  logic clk = 1'b1;
  always #5 clk = ~clk;

  logic reset;

  // Instantiate design under test

  logic [3:0] pc;
  logic [3:0] result;

  Proc proc
  (
    .clk    (clk),
    .reset  (reset),
    .pc     (pc),
    .result (result)
  );

  // Run test

  integer i;

  initial begin
    $dumpvars;

    #1;

    reset = 1;
    #20;
    reset = 0;

    for ( i = 0; i < 16; i = i+1 ) begin
      $display( "pc = %d, result = %d", pc, result );
      #10;
    end

    $finish;
  end

endmodule

