`timescale 1ns / 1ps

module tb_enc_8bit();
    reg [7:0] multiplier;
    /*wire [3:0] X_sel;
    wire [3:0] TwoX_sel;
    wire [3:0] NEG; */
    wire [2:0] enc_op0;
    wire [2:0] enc_op1;
    wire [2:0] enc_op2;
    wire [2:0] enc_op3
    ;
    enc_8bit uut (
        .multiplier(multiplier),
        .enc_op0(enc_op0),
        .enc_op1(enc_op1),
        .enc_op2(enc_op2),
        .enc_op3(enc_op3)
    );
/*
    wire [2:0] enc_op0 = {X_sel[0], TwoX_sel[0], NEG[0]};
    wire [2:0] enc_op1 = {X_sel[1], TwoX_sel[1], NEG[1]};
    wire [2:0] enc_op2 = {X_sel[2], TwoX_sel[2], NEG[2]};
    wire [2:0] enc_op3 = {X_sel[3], TwoX_sel[3], NEG[3]};
    */
    

    initial begin
        multiplier = 8'b10101010;
        #200;

        multiplier = 8'b10001000; 
        #200;
           
        multiplier = 8'b10110011; 
        #200;
        
        multiplier = 8'b01001101; 
        #200;
        
        multiplier = 8'b11111111; 
        #200 $finish;
    end
 initial begin 
    $monitor("T=%0t, multiplier=%b, enc_op0=%b, enc_op1=%b, enc_op2=%b, enc_op3=%b", $time, multiplier, enc_op0, enc_op1, enc_op2, enc_op3);
end

endmodule