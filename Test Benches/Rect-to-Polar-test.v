`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 22:39:27
// Design Name: 
// Module Name: main_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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


