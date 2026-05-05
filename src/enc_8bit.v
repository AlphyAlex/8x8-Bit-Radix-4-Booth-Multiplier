`timescale 1ns / 1ps
module enc_8bit (
    input  wire [7:0] multiplier,
    output wire [2:0] enc_op0, 
    output wire [2:0] enc_op1, 
    output wire [2:0] enc_op2, 
    output wire [2:0] enc_op3
);

enc_1bit enc0 (
    .y_p(multiplier[1]),
    .y  (multiplier[0]),
    .y_n(1'b0),
    .X_sel   (enc_op0[2]),
    .TwoX_sel(enc_op0[1]),
    .NEG     (enc_op0[0])
);

enc_1bit enc1 (
    .y_p(multiplier[3]),
    .y  (multiplier[2]),
    .y_n(multiplier[1]),
    .X_sel   (enc_op1[2]),
    .TwoX_sel(enc_op1[1]),
    .NEG     (enc_op1[0])
);

enc_1bit enc2 (
    .y_p(multiplier[5]),
    .y  (multiplier[4]),
    .y_n(multiplier[3]),
    .X_sel   (enc_op2[2]),
    .TwoX_sel(enc_op2[1]),
    .NEG     (enc_op2[0])
);

enc_1bit enc3 (
    .y_p(multiplier[7]),
    .y  (multiplier[6]),
    .y_n(multiplier[5]),
    .X_sel   (enc_op3[2]),
    .TwoX_sel(enc_op3[1]),
    .NEG     (enc_op3[0])
);

endmodule

/*
module enc_8bit (
    input  wire [7:0] multiplier,
    output wire [3:0] X_sel,
    output wire [3:0] TwoX_sel,
    output wire [3:0] NEG
);
    wire [8:0] y;
    assign y = {multiplier, 1'b0};
    
enc_1bit enc0 (
    .y_p(multiplier[1]),
    .y(multiplier[0]),
    .y_n(1'b0),
    .X_sel(X_sel[0]),
    .TwoX_sel(TwoX_sel[0]),
    .NEG(NEG[0])
);

enc_1bit enc1 (
    .y_p(multiplier[3]),
    .y(multiplier[2]),
    .y_n(multiplier[1]),
    .X_sel(X_sel[1]),
    .TwoX_sel(TwoX_sel[1]),
    .NEG(NEG[1])
);


enc_1bit enc2 (
    .y_p(multiplier[5]),
    .y(multiplier[4]),
    .y_n(multiplier[3]),
    .X_sel(X_sel[2]),
    .TwoX_sel(TwoX_sel[2]),
    .NEG(NEG[2])
);

enc_1bit enc3 (
    .y_p(multiplier[7]),
    .y(multiplier[6]),
    .y_n(multiplier[5]),
    .X_sel(X_sel[3]),
    .TwoX_sel(TwoX_sel[3]),
    .NEG(NEG[3])
);

endmodule
*/
