# FPGA-Implementation-of-the-Trigonometric-Functions-Using-the-CORDIC-Algorithm

Abstract—The paper presents the design principle and FPGA implementation of various trigonometric functions such as Sine, Cosine, Exponential, Inverse Exponential, Arc Tangent, Logarithm, and Polar to Rectangular conversion using the standard coordinate rotation digital computer (CORDIC) algorithm. Traditions implementation of these functions on a FPGA consumes a lot of area and the results of these functions are floating point which is difficult to design. Hence CORDIC algorithm with IEEE 32-bit floating-point representation is used in this paper for implementation. CORDIC is an iterative algorithm which can perform the complex functions using the shift and add approach. The serial and pipelined CORDIC architectures configured on a Cyclone IV E Device are compared in terms of Area, Delay, and Power dissipation. Serial CORDIC architecture design has low area whereas; pipeline CORDIC architecture has low latency. It finds the application in graphic processors, digital synchronizer, Real time image processing, and scientific calculators and so on.

Keywords— CORDIC, Trigonometric function, Exponential, ArcTangent, Logarithm, and Polar to Rectangular conversion.

INTRODUCTION 

In 1959, Jack E. Volder introduced the Co-ordinate Rotation Digital Computer algorithm abbreviated as CORDIC. The CORDIC uses the basic shift and add operations with the help of lookup table for computing the complex trigonometric and arithmetic functions. CORDIC operates in either vector mode or rotation mode was used calculating the sine, cosine, magnitude, phase, hyperbolic functions, exponential, logarithmic, polar to rectangular conversion etc.

ROTATION MODE: In the rotation mode, the old coordinate points are shifted to the new coordinate position based on the angle of rotation.

VECTOR MODE: In the vectoring mode, the magnitude and the angular argument of the original vector are computed based on the coordinate components of the input vector.


APPLICATIONS OF CORDIC ALGORITHM

The algorithm finds its applications in various fields such as 
1. Numerical Processors
2. Radar Signal Processing
3. Scientific Calculators
4. Modulation Schemes 
5. Wireless Communications
6. Software Defined Radio
7. Image and Video Processing Algorithms

EARLIER TECHNIQUES

For implementing the trigonometric functions, polynomial approximation and lookup table methods were employed earlier. The lookup table method stores the values for every angle and the output latency is very low nearly one clock cycle. The major disadvantage of this method is the requirement of huge memory. The method has a trade-off between the accuracy and memory requirement. The polynomial approximation method has high accuracy, but it requires huge hardware. The CORDIC method overcomes the memory requirement problem at the expense of the output latency. The accuracy of the method can be improved by improving the output latency.

CONCEPT OF CORDIC ALGORITHM

Consider the following rotations of vectors:

![image](https://user-images.githubusercontent.com/110079800/231575629-47e88745-376c-454f-8ac3-efa18083193e.png)
![image](https://user-images.githubusercontent.com/110079800/231576171-b66d6ffc-cad1-4013-a799-abc1132a1794.png)




 

