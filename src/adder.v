`timescale 1ns / 1ps
/*
module adder(
    input  wire signed [8:0]  pp0,
    input  wire signed [10:0] pp1,
    input  wire signed [12:0] pp2,
    input  wire signed [14:0] pp3,
    output wire signed [15:0] sum
);
    wire signed [15:0] pp0_ext = {{7{pp0[8]}},   $signed(pp0)};
    wire signed [15:0] pp1_ext = {{5{pp1[10]}},  $signed(pp1)};
    wire signed [15:0] pp2_ext = {{3{pp2[12]}},  $signed(pp2)};
    wire signed [15:0] pp3_ext = {   pp3[14],    $signed(pp3)};

    assign sum = pp0_ext + pp1_ext + pp2_ext + pp3_ext;

endmodule
*/
`timescale 1ns / 1ps
module adder(
    input  wire signed [15:0] pp0,
    input  wire signed [15:0] pp1,
    input  wire signed [15:0] pp2,
    input  wire signed [15:0] pp3,
    output wire signed [15:0] sum
);
    assign sum = pp0 + pp1 + pp2 + pp3;
endmodule