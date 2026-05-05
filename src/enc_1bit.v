`timescale 1ns / 1ps

module enc_1bit (
    input  wire y_p,  // y_{2i+1} 
    input  wire y,       // y_{2i}   
    input  wire y_n, // y_{2i-1}  
    output wire X_sel,
    output wire TwoX_sel,
    output wire NEG

);

assign X_sel = y ^ y_n;
assign NEG = y_p;    
assign TwoX_sel = (~y_p & y & y_n) | (y_p & ~y & ~y_n);

endmodule

/*
module enc_1bit (
    input  wire y_p,
    input  wire y,
    input  wire y_n,
    output reg  [2:0] enc_op
);
    always @(*) begin
        case ({y_p, y, y_n})
            3'b000, 3'b111: enc_op = 3'b000;
            3'b001, 3'b010: enc_op = 3'b001;
            3'b011:         enc_op = 3'b011;
            3'b100:         enc_op = 3'b100;
            3'b101, 3'b110: enc_op = 3'b101;
            default:        enc_op = 3'b000;
        endcase
    end
endmodule
*/
