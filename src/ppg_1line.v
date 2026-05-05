`timescale 1ns / 1ps
/*
module ppg_1line(
    input  signed [7:0] multiplicand,  
    input  [2:0] enc_op,
    output reg signed [8:0] pp
);
    always @(*) begin
        case(enc_op)
            3'b000: pp = 9'sd0;
            3'b001: pp = $signed(multiplicand);          //  +1 * X
            3'b010: pp = $signed(multiplicand);          //  +1 * X
            3'b011: pp = $signed(multiplicand) <<< 1;   //  +2 * X (arithmetic left shift equ to mult by 2)
            3'b100: pp = -($signed(multiplicand) <<< 1);//  -2 * X
            3'b101: pp = -$signed(multiplicand);         //  -1 * X
            3'b110: pp = -$signed(multiplicand);         //  -1 * X
            3'b111: pp = 9'sd0;
            default: pp = 9'sd0;
        endcase
    end
endmodule
*/
`timescale 1ns / 1ps

module ppg_1line(
    input  signed [7:0] multiplicand,  
    input  [2:0] enc_op,   // Now expecting {X_sel, TwoX_sel, NEG}
    output reg signed [8:0] pp
);

    // Extract the control signals for clarity
    wire X_sel    = enc_op[2];
    wire TwoX_sel = enc_op[1];
    wire NEG      = enc_op[0];

    always @(*) begin
        // 1. Select the magnitude
        if (X_sel) begin
            pp = $signed(multiplicand);               // 1 * X
        end else if (TwoX_sel) begin
            pp = $signed(multiplicand) <<< 1;         // 2 * X
        end else begin
            pp = 9'sd0;                               // 0 * X
        end

        // 2. Apply the sign (Two's Complement negation)
        if (NEG) begin
            pp = -pp;
        end
    end

endmodule