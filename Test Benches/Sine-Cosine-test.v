module CORDIC_TESTBENCH;
 
 localparam width = 16; //width of x and y

  // Inputs
  reg [width-1:0] Xin, Yin;
  reg [31:0] angle;
  reg clk;
  reg signed [63:0] i;

  wire [width-1:0] COSout, SINout;

  localparam An = 32000/1.647;
   always
    begin
      #5 clk = ~clk;
    end

  initial begin
    angle = 'b00110101010101010101010101010101;
    Xin = An;     // Xout = 32000*cos(angle)
    Yin = 0;      // Yout = 32000*sin(angle)

    clk = 1'b0;
    // Test 1
    #100                                           
    angle = 'b00100000000000000000000000000000;    // 45 deg

    // Test 2
     #150
     angle = 'b00101010101010101010101010101010; // 60 deg

    // Test 3
     #100
     angle = 'b01000000000000000000000000000000; // 90 deg

    // Test 4
     #200
     angle = 'b00110101010101010101010101010101; // 75 deg

  end

  CORDIC TEST_RUN(clk, COSout, SINout, Xin, Yin, angle);

endmodule
//CORDIC Testbench for sine and cosine for Final Project 

//Claire Barnes

module CORDIC_TESTBENCH;

  localparam width = 16; //width of x and y

  // Inputs
  reg [width-1:0] Xin, Yin;
  reg [31:0] angle;
  reg clk;
  reg signed [63:0] i;

  wire [width-1:0] COSout, SINout;

  localparam An = 32000/1.647;
   always
    begin
      #5 clk = ~clk;
    end

  initial begin
	$dumpfile("cordic.vcd");
	$dumpvars();
    //set initial values
    angle = 'b00110101010101010101010101010101;
    Xin = An;     // Xout = 32000*cos(angle)
    Yin = 0;      // Yout = 32000*sin(angle)

    //set clock
    clk = 1'b0;
   

    #50

    // Test 1
    #100                                           
    angle = 'b00100000000000000000000000000000;    // example: 45 deg = 45/360 * 2^32 = 32'b00100000000000000000000000000000 = 45.000 degrees -> atan(2^0)

    // Test 2
     #1500
     angle = 'b00101010101010101010101010101010; // 60 deg

    // Test 3
     #10000
     angle = 'b01000000000000000000000000000000; // 90 deg

    // Test 4
     #10000
     angle = 'b00110101010101010101010101010101; // 75 deg

   #200000
   $write("Simulation has finished");
   $stop;

  end

  CORDIC TEST_RUN(clk, COSout, SINout, Xin, Yin, angle);

  // Monitor the output
  initial
  $monitor($time, , COSout, , SINout, , angle);

endmodule
