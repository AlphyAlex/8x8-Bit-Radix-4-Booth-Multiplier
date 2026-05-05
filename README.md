8x8-Bit-Radix-4-Booth-Multiplier

A high-performance, RTL-based digital implementation of a 8-bit Radix-4 Booth Multiplier. This project focuses on efficient partial product generation and reduction, utilizing Booth's algorithm to reduce the number of partial products and improve multiplication speed.

Key Features:

1. Booth Encoder: Radix-4 logic for optimized 2-bit multiplier processing. Radix4 encoding on the multiplier bits to reduce the number of partial products.

2. Partial Product Generation (PPG): High-speed logic for multi-bit arithmetic shifts and Two's Complement negation.

3. Hierarchical Design: Modular architecture featuring a dedicated encoder, generator, and an adder.

4. Verification: Fully simulated with a comprehensive testbench covering signed/unsigned edge cases, positive/negative multiplication, and zero-value operations.

Language: Verilog 2001

Tool: Xilinx Vivado

Future Scope:

* Adding the partial products using a Wallace Tree to improve both the critical path and number of adders and a Carry Look Ahead Adder to reduce the computation time.
