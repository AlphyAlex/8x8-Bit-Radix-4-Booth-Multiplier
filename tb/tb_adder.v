`timescale 1ns / 1ps

module tb_adder();

    // Inputs (declared as reg to drive them)
    reg signed [8:0]  pp0;
    reg signed [10:0] pp1;
    reg signed [12:0] pp2;
    reg signed [14:0] pp3;

    // Output (declared as wire)
    wire signed [15:0] sum;

    // Instantiate the Unit Under Test (UUT)
    adder uut (
        .pp0(pp0), 
        .pp1(pp1), 
        .pp2(pp2), 
        .pp3(pp3), 
        .sum(sum)
    );

    initial begin
        // Initialize inputs
        pp0 = 0; pp1 = 0; pp2 = 0; pp3 = 0;

        #10;
        // Test Case 1: All positive
        pp0 = 9'd10;   pp1 = 11'd20;  pp2 = 13'd30;  pp3 = 15'd40;
        // Expected: 10 + 20 + 30 + 40 = 100
        
        #10;
        // Test Case 2: Mixed positive and negative
        pp0 = -9'd5;   pp1 = 11'd100; pp2 = -13'd50; pp3 = 15'd10;
        // Expected: -5 + 100 - 50 + 10 = 55
        
        #10;
        // Test Case 3: All negative
        pp0 = -9'd10;  pp1 = -11'd10; pp2 = -13'd10; pp3 = -15'd10;
        // Expected: -40
        
        #10;
        $finish;
    end

    // Monitor for simulation visibility
    initial begin
        $monitor("Time=%0t | pp0=%d pp1=%d pp2=%d pp3=%d | Sum=%d", 
                 $time, pp0, pp1, pp2, pp3, sum);
    end

endmodule