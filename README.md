# 4bit-adder
 
## Objective:
The objective of this project is to use structural/modular design in VHDL to create a real-world application by implementing an adder unit on an FPGA chip and displaying the addition result.

## Boolean Expressions:
The boolean expression for sum: S = A xor (B xor Cin)
The Boolean expression for carry out: Cout = ((A xor B) and Cin) or (A and B)


## Testing Table:
Binary Inputs	| Expected output in Binary	| Expected output in Hex	| Actual output in Hex

00002 + 00002	                       0000	                      00	                    00

01112 + 10102	                      10001	                      11	                    11

10002 + 10002	                      10000	                      10	                    10

11112 + 11112	                      11110	                      1E	                    1E
