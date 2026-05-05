`timescale 1ns / 1ps


module tb_ppg_1line(  );
reg signed [7:0] multiplicand;
reg [2:0] enc_op;         // one encoder's output
wire signed [8:0] pp;

ppg_1line uut ( .multiplicand(multiplicand), .enc_op(enc_op),
.pp(pp) );

initial begin
    multiplicand=8'b00000000; enc_op=3'b000;
    #10; multiplicand=8'b00101010; enc_op=3'b000;
    #10; multiplicand=8'b00101010; enc_op=3'b001;
    #10; multiplicand=8'b00101010; enc_op=3'b010;
    #10; multiplicand=8'b00101010; enc_op=3'b011;
    #10; multiplicand=8'b00101010; enc_op=3'b100;
    #10; multiplicand=8'b00101010; enc_op=3'b101;
    #10; multiplicand=8'b00101010; enc_op=3'b110;
    #10; multiplicand=8'b00101010; enc_op=3'b111;
    #10; multiplicand=8'b10101010; enc_op=3'b001;
    #10; multiplicand=8'b10101010; enc_op=3'b010;
    #10; multiplicand=8'b10101010; enc_op=3'b011;
    #10; multiplicand=8'b10101010; enc_op=3'b100;
    #10; multiplicand=8'b10101010; enc_op=3'b101;
    #10; multiplicand=8'b10101010; enc_op=3'b110;
    #10; multiplicand=8'b10101010; enc_op=3'b111;
    #10; $finish;
end
 initial begin 
    $monitor("T=%0t, multiplicand=%d, enc_op=%b,pp=%0d", $time, $signed(multiplicand), enc_op, $signed(pp));
end


endmodule
