# Assignment: Design 4-bit full adder satisfying following rules:

1. Include 1-bit full adder design. 
2. Input value of X, Y, Cin must be as below:
	- Initial Value of X is "0101" and the value keeps changing between "0101" and "1011" in every 2 ns.
	  - (ex: 0101 -> 1011 -> 0101 -> 1011 -> 0101 -> 1011 -> ...)
	- Initial Value of Y is "1001" and repeat srl operation in every 5 ns.
	- Initial Value of Cin is '0' and invert the value in every 3 ns.
3. Do not use XOR operation while desigining 1-bit full adder.

## Submit the report which includes:
- VHDL source code for 4-bit full adder above (including comment)
- A testbench code for 4-bit full adder above (including comment)
- Captured image of simulated waveform of 4-bit full adder (0~25ns)
- Discussion
