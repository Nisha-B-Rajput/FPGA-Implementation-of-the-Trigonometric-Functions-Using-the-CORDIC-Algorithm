# FPGA-Implementation-of-the-Trigonometric-Functions-Using-the-CORDIC-Algorithm

Abstract—The paper presents the design principle and FPGA implementation of various trigonometric functions such as Sine, Cosine, Exponential, Inverse Exponential, Arc Tangent, Logarithm, and Polar to Rectangular conversion using the standard coordinate rotation digital computer (CORDIC) algorithm. Traditions implementation of these functions on a FPGA consumes a lot of area and the results of these functions are floating point which is difficult to design. Hence CORDIC algorithm with IEEE 32-bit floating-point representation is used in this paper for implementation. CORDIC is an iterative algorithm which can perform the complex functions using the shift and add approach. The serial and pipelined CORDIC architectures configured on a Cyclone IV E Device are compared in terms of Area, Delay, and Power dissipation. Serial CORDIC architecture design has low area whereas; pipeline CORDIC architecture has low latency. It finds the application in graphic processors, digital synchronizer, Real time image processing, and scientific calculators and so on.

Keywords— CORDIC, Trigonometric function, Exponential, ArcTangent, Logarithm, and Polar to Rectangular conversion.

## INTRODUCTION 

In 1959, Jack E. Volder introduced the Co-ordinate Rotation Digital Computer algorithm abbreviated as CORDIC. The CORDIC uses the basic shift and add operations with the help of lookup table for computing the complex trigonometric and arithmetic functions. CORDIC operates in either vector mode or rotation mode was used calculating the sine, cosine, magnitude, phase, hyperbolic functions, exponential, logarithmic, polar to rectangular conversion etc.

ROTATION MODE: In the rotation mode, the old coordinate points are shifted to the new coordinate position based on the angle of rotation.

VECTOR MODE: In the vectoring mode, the magnitude and the angular argument of the original vector are computed based on the coordinate components of the input vector.


## APPLICATIONS OF CORDIC ALGORITHM

The algorithm finds its applications in various fields such as 
1. Numerical Processors
2. Radar Signal Processing
3. Scientific Calculators
4. Modulation Schemes 
5. Wireless Communications
6. Software Defined Radio
7. Image and Video Processing Algorithms

## EARLIER TECHNIQUES

For implementing the trigonometric functions, polynomial approximation and lookup table methods were employed earlier. The lookup table method stores the values for every angle and the output latency is very low nearly one clock cycle. The major disadvantage of this method is the requirement of huge memory. The method has a trade-off between the accuracy and memory requirement. The polynomial approximation method has high accuracy, but it requires huge hardware. The CORDIC method overcomes the memory requirement problem at the expense of the output latency. The accuracy of the method can be improved by improving the output latency.

## CONCEPT OF CORDIC ALGORITHM

Consider the following rotations of vectors:

![image](https://user-images.githubusercontent.com/110079800/231575629-47e88745-376c-454f-8ac3-efa18083193e.png)
![image](https://user-images.githubusercontent.com/110079800/231576171-b66d6ffc-cad1-4013-a799-abc1132a1794.png)

The diagram belows shows a rotation and pseudo-rotation of a vector of length Ri about an angle of ai about the origin:
![image](https://user-images.githubusercontent.com/110079800/231577712-c1322fe9-7e07-449d-a04f-51349520faeb.png)

A rotation about the origin produces the following co-ordinates:
![image](https://user-images.githubusercontent.com/110079800/231577860-60dee1db-d324-4cb1-9f54-8d4d853fdd54.png)

![image](https://user-images.githubusercontent.com/110079800/231577941-ea8cb073-c76f-4186-8580-71d943e02b3f.png)

![image](https://user-images.githubusercontent.com/110079800/231578329-51a2f007-be6b-4447-a573-7d8998a6393c.png)

If the angles are always the same set, then K is fixed, and can be accounted for later. We choose these angles according to two criteria:
•	We must also choose the angles so that any angle can be constructed from the sum of all them, with appropriate signs.
•	We make all   a power of 2, so that the multiplication can be performed by a simple logical shift of a binary number.

![image](https://user-images.githubusercontent.com/110079800/231578453-568435c6-b241-4935-a401-f1c4ed0991c4.png)

![image](https://user-images.githubusercontent.com/110079800/231578513-28fb137b-32c3-4f0a-9a0a-2ba7e108bd6c.png)

![image](https://user-images.githubusercontent.com/110079800/231578566-9763d18f-92a0-4b21-a9df-f99f1adf0bb7.png)

![image](https://user-images.githubusercontent.com/110079800/231578643-82ae778d-e286-475f-b276-ebf7af39c671.png)

USING CORDICS 

![image](https://user-images.githubusercontent.com/110079800/231578834-6cf0c010-649f-43e0-a5af-ba83d2d0c6f4.png)

![image](https://user-images.githubusercontent.com/110079800/231578898-d53ae935-5927-4ca4-8fa3-68d7b1d352ea.png)

USING CORDIC IN ROTATION MODE
![image](https://user-images.githubusercontent.com/110079800/231579062-929e0036-5123-4128-ad1f-6d85ae84d893.png)

USING CORDIC IN VECTORING MODE

![image](https://user-images.githubusercontent.com/110079800/231579233-c28916f1-ddd3-4f69-b9fb-6be631e55ae4.png)

In the sequential CORDIC architecture, the Read Only Memory (ROM) stores the values of reference angles. The multiplexer specified on the top is provided with new input and previous output. During initial phase the Multiplexer selects the new value and in the successive cycles, the multiplexer selects the previous output. The register followed by shifter is used to store and shift the value to the right by one position, implies division by 2. The accumulator provided on the bottom is used for either addition or subtraction based on the control signal provided by the sign of the Z value. Serial CORDIC architecture performs one rotation and one addition operation per clock cycle. The output is obtained after n clock cycles (n signifies the number of iterations). The sequential CORDIC architecture requires minimum hardware and maximum number of clock cycles to calculate the output. The computation delay and word length are directly related the accuracy of the output

![image](https://user-images.githubusercontent.com/110079800/231580065-044e4d9b-edc9-4944-9b71-0de4843d898e.png)

## PARALLEL CORDIC ARCHITECTURE

The parallel CORDIC architecture is obtained by duplicating the sequential CORDIC architecture n number of times. The value of n is decided by the number of iterations. As the number of iterations increases, the accuracy increases at the cost of the increased area. The parallel CORDIC architecture consumes more hardware at the expense of the low processing time.

![image](https://user-images.githubusercontent.com/110079800/231580259-d5c9763d-3edc-4a13-a1ea-14eaf7ce92b9.png)

## THE UNIVERSAL CORDIC

![image](https://user-images.githubusercontent.com/110079800/231580702-c75331f3-d6a4-42f9-b280-e862455f0d8b.png)

## SUMMARY OF UNIVERSAL CORDIC IMPLEMENTATION

![image](https://user-images.githubusercontent.com/110079800/231580796-76fbf2a9-a9a1-4ff4-971f-92dfbc990342.png)

## DIRECTLY COMPUTABLE FUNCTIONS

![image](https://user-images.githubusercontent.com/110079800/231580951-537273ee-8aed-421a-85af-a20d4a1d63d8.png)

## INDIRECTLY COMPUTABLE FUNCTIONS
In addition to the above functions, a number of other functions can be produced by combining the results of previous computations:

![image](https://user-images.githubusercontent.com/110079800/231581213-31124b7f-3427-4959-936c-1095f91e639d.png)

## FPGA IMPLEMENTATION OF TRIGONOMETRIC FUNCTIONS

## IMPLEMENTATION OF Sine and Cosine FUNCTIONS

The sine and cosine functions are obtained using the rotational mode CORDIC. The input angle is fed into the angle accumulator. The X and Y values are initialized with 1 and 0 respectively. The CORDIC algorithm presents the scaled version of sine and cosine in the X and Y after the desired latency. If the value of X is initialized with 1/K, then the result will be the unscaled sine and cosine outputs. The CORDIC algorithm uses the multiplication as a part of the rotation operation. Hence the design will be multiplier less implementation. The design works for all positive and negative angles.

## References:

1. https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8728315
2. https://en.wikibooks.org/wiki/Digital_Circuits/CORDIC

  






 

