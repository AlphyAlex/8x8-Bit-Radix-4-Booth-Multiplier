`timescale 1ns / 1ps
module ppg_8bit(
    input  signed [7:0] multiplicand,
    input  [2:0] enc_op0, 
    input  [2:0] enc_op1, 
    input  [2:0] enc_op2, 
    input  [2:0] enc_op3,
    output wire signed [15:0] pp0,
    output wire signed  [15:0]  pp1,
    output wire signed [15:0]  pp2,
    output wire signed [15:0]  pp3
    /*
    output wire signed [8:0] pp0,
    output wire signed  [10:0]  pp1,
    output wire signed [12:0]  pp2,
    output wire signed [14:0]  pp3
    */
);
    wire signed [8:0] p0, p1, p2, p3;  // internal only
    
    ppg_1line uut1 (.multiplicand(multiplicand), .enc_op(enc_op0), .pp(p0));
    ppg_1line uut2 (.multiplicand(multiplicand), .enc_op(enc_op1), .pp(p1));
    ppg_1line uut3 (.multiplicand(multiplicand), .enc_op(enc_op2), .pp(p2));
    ppg_1line uut4 (.multiplicand(multiplicand), .enc_op(enc_op3), .pp(p3));
    
    
    assign pp0 = $signed(p0);
    /*
    assign pp1 = $signed( {p1, 2'b00});
    assign pp2 = $signed( {p2, 4'b0000});
    assign pp3 = $signed( {p3,6'b000000});
    */
    assign pp1 = $signed(p1) <<< 2;
    assign pp2 = $signed(p2) <<< 4;
    assign pp3 = $signed(p3) <<< 6;
endmodule