`timescale 1ns / 1ps
module cordic_rect_to_polar_tb;

  // Declare signals
  reg signed [15:0] x, y;
  reg rst;
  wire [15:0] r, theta;

  // Instantiate DUT
  rect_to_polar dut (
    .x(x),
    .y(y),
    .rst(rst),
    .r(r),
    .theta(theta)
  );

  // Apply test inputs
  initial begin
    x = 16384;
    y = 16384;
    #10;
    x = 23170;
    y = 0;
    #10;
    x = 32767;
    y = 0;
    #10;
    x = 23170;
    y = -23170;
    #10;
    x = 0;
    y = -32767;
    #10;
    x = -16384;
    y = -16384;
    #10;
    x = -23170;
    y = 0;
    #10;
    x = -32767;
    y = 0;
    #10;
    x = -23170;
    y = 23170;
    #10;
    x = 0;
    y = 32767;
    #10;
    $finish;
  end

  // Display results
  always @* begin
    $display("x = %d, y = %d, r = %d, theta = %d", x, y, r, theta);
  end

endmodule


