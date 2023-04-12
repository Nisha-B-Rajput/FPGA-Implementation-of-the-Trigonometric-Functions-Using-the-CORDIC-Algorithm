`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2023 20:06:42
// Design Name: 
// Module Name: rectopolar
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


module rect_to_polar (
  input signed [31:0] x,
  input signed [31:0] y,
  input rst,
  output reg [31:0] r,
  output reg [31:0] theta
);

  parameter ANGLE_PRECISION = 16;
  parameter ANGLE_BITS = 2 * ANGLE_PRECISION;
  reg signed [31:0] x_i;//= x;
  reg signed [31:0] y_i;// = y;
  reg signed [31:0] z_i = 0;
  reg signed [31:0] theta_i = 0;
  reg signed [31:0] angle = 0;
  

 
  /*wire [ANGLE_BITS-1:0] arctan_table [0:(ANGLE_BITS-1)] = 
  '{32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,
  32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,
  32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,
  32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0}; // Initialize table to 0

  // Generate arctan table
  generate
    for (genvar i = 0; i < ANGLE_BITS; i = i+1) begin
      assign arctan_table[i] = ($signed($signed($signed(1) << {ANGLE_PRECISION + 1 + i})) / $signed({1 << i}));
    end
  endgenerate
  */
    wire signed [31:0] arctan_table [0:30];
                          
  assign arctan_table[00] = 'b00100000000000000000000000000000; // 45.000 degrees -> atan(2^0)
  assign arctan_table[01] = 'b00010010111001000000010100011101; // 26.565 degrees -> atan(2^-1)
  assign arctan_table[02] = 'b00001001111110110011100001011011; // 14.036 degrees -> atan(2^-2)
  assign arctan_table[03] = 'b00000101000100010001000111010100; // atan(2^-3)
  assign arctan_table[04] = 'b00000010100010110000110101000011;
  assign arctan_table[05] = 'b00000001010001011101011111100001;
  assign arctan_table[06] = 'b00000000101000101111011000011110;
  assign arctan_table[07] = 'b00000000010100010111110001010101;
  assign arctan_table[08] = 'b00000000001010001011111001010011;
  assign arctan_table[09] = 'b00000000000101000101111100101110;
  assign arctan_table[10] = 'b00000000000010100010111110011000;
  assign arctan_table[11] = 'b00000000000001010001011111001100;
  assign arctan_table[12] = 'b00000000000000101000101111100110;
  assign arctan_table[13] = 'b00000000000000010100010111110011;
  assign arctan_table[14] = 'b00000000000000001010001011111001;
  assign arctan_table[15] = 'b00000000000000000101000101111100;
  assign arctan_table[16] = 'b00000000000000000010100010111110;
  assign arctan_table[17] = 'b00000000000000000001010001011111;
  assign arctan_table[18] = 'b00000000000000000000101000101111;
  assign arctan_table[19] = 'b00000000000000000000010100010111;
  assign arctan_table[20] = 'b00000000000000000000001010001011;
  assign arctan_table[21] = 'b00000000000000000000000101000101;
  assign arctan_table[22] = 'b00000000000000000000000010100010;
  assign arctan_table[23] = 'b00000000000000000000000001010001;
  assign arctan_table[24] = 'b00000000000000000000000000101000;
  assign arctan_table[25] = 'b00000000000000000000000000010100;
  assign arctan_table[26] = 'b00000000000000000000000000001010;
  assign arctan_table[27] = 'b00000000000000000000000000000101;
  assign arctan_table[28] = 'b00000000000000000000000000000010;
  assign arctan_table[29] = 'b00000000000000000000000000000001;
  assign arctan_table[30] = 'b00000000000000000000000000000000;

  always @(*) begin
    if(rst) begin
    x_i = x;
   y_i = y;
    end
    if (x_i >= 0 && y_i >= 0) begin
      z_i = y_i;
      theta_i = 0;
    end else if (x_i < 0 && y_i >= 0) begin
      z_i = -x_i;
      theta_i = arctan_table[0];
    end else if (x_i < 0 && y_i < 0) begin
      z_i = -y_i;
      theta_i = -arctan_table[0];
    end else if (x_i >= 0 && y_i < 0) begin
      z_i = x_i;
      theta_i = -arctan_table[0];
    end

	for (integer i = 0; i < ANGLE_PRECISION; i = i+1)
     begin
      if (z_i >= 0) 
       begin
        z_i = z_i - (y_i >> i);
        x_i = x_i + (y_i >> i);
        theta_i = theta_i + arctan_table[i];
      end
    
       else
        begin
        z_i = z_i + (y_i >> i);
        x_i = x_i - (y_i >> i);
        theta_i = theta_i - arctan_table[i];
      end
    end
   
   r =$sqrt(x * x + y * y);
    theta = theta_i;
  end
  endmodule
