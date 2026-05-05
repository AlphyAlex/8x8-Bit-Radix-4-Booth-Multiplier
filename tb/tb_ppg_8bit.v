`timescale 1ns / 1ps
module tb_ppg_8bit();
    reg signed [7:0] multiplicand;
    reg [2:0] enc_op0, enc_op1, enc_op2, enc_op3;
    wire signed [8:0 ] pp0;
    wire signed [10:0] pp1;
    wire signed [12:0] pp2;
    wire signed [14:0] pp3 ;
    //wire signed [8:0] p0, p1, p2, p3;
    
    ppg_8bit uut (
        .multiplicand(multiplicand),
        .enc_op0(enc_op0), .enc_op1(enc_op1),
        .enc_op2(enc_op2), .enc_op3(enc_op3),
        .pp0(pp0), .pp1(pp1), .pp2(pp2), .pp3(pp3) );
       // .p0(p0), .p1(p1), .p2(p2), .p3(p3) );
    
    initial begin

        multiplicand = 8'sd25;
        enc_op0 = 3'b010; // +1X -> pp0 = +25, contributes at weight 2^0
        enc_op1 = 3'b110; // -1X -> pp1 = -25, contributes at weight 2^2
        enc_op2 = 3'b001; // +1X -> pp2 = +25, contributes at weight 2^4
        enc_op3 = 3'b000; //  0X -> pp3 =   0, contributes at weight 2^6
        // Expected: 25*(1 - 4 + 16) = 25*13 = 325
        #10;
        
     
        multiplicand = 8'b00000000;                                                                                                               
        enc_op0 = 3'b000;                                                                                                                         
        enc_op1 = 3'b000;                                                                                                                         
        enc_op2 = 3'b000;                                                                                                                         
        enc_op3 = 3'b000;                                                                                                                         

        #10 multiplicand = 8'b11100111;                                                                                                           
            enc_op0 = 3'b100;                                                                                                                     
            enc_op1 = 3'b000;                                                                                                                     
            enc_op2 = 3'b101;                                                                                                                     
            enc_op3 = 3'b001;                                                                                                                     

        #10 multiplicand = 8'b00110011;                                                                                                           
            enc_op0 = 3'b011;                                                                                                                     
            enc_op1 = 3'b100;                                                                                                                     
            enc_op2 = 3'b011;                                                                                                                     
            enc_op3 = 3'b001;                                                                                                                     

        #10 multiplicand = 8'b10010011;                                                                                                           
            enc_op0 = 3'b101;                                                                                                                     
            enc_op1 = 3'b111;                                                                                                                     
            enc_op2 = 3'b001;                                                                                                                     
            enc_op3 = 3'b110;                                                                                                                     

#10;
        multiplicand = -8'sd86;
        enc_op0 = 3'b100; // -2X -> pp0 = +172
        enc_op1 = 3'b101; // -1X -> pp1 = +86
        enc_op2 = 3'b101; // -1X -> pp2 = +86
        enc_op3 = 3'b001; // +1X -> pp3 = -86
        #10;
        
        $finish;
    end
    
    initial begin
        $monitor("T=%0t | X=%0d | enc0=%b|enc1=%b|enc2=%b|enc3=%b | pp0=%0d|pp1=%0d|pp2=%0d|pp3=%0d", $time, multiplicand,
                 enc_op0, enc_op1, enc_op2, enc_op3, $signed(pp0), $signed(pp1), $signed(pp2), $signed(pp3));
                 //| p0=%0d|p1=%0d | p2=%0d, p3=%0d
                 //$signed(p0),$signed(p1),$signed(p2),
                // $signed(p3));
    end
endmodule