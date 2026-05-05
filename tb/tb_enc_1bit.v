`timescale 1ns / 1ps

module tb_enc_1bit();

reg y_p, y, y_n;
wire X_sel, TwoX_sel, NEG;

enc_1bit uut1 ( .y_p(y_p), .y(y), .y_n(y_n), .X_sel(X_sel), 
.TwoX_sel(TwoX_sel), .NEG(NEG));

initial begin
    for (integer i = 0; i < 8; i = i + 1) begin
        {y_p, y, y_n} = i;
        #10;
    end
$finish;
end
initial begin 
    $monitor("T=%0t, yp=%0b, y=%0b, yn=%0b,Xsel=%0b, 2Xsel=%0b, Neg=%b", $time, y_p, y, y_n, X_sel, TwoX_sel, NEG);
end


endmodule

