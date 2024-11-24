module fa(input a , b , z , output s , c);
    assign s=a^b^z;
    assign c=a&b||z&(a^b);
    endmodule 
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire w1 , w2 , w3;
    fa g1(x[0] , y[0] , 1'b0 , sum[0] , w1);
    fa g2(x[1] , y[1] , w1, sum[1] , w2 );
    fa g3(x[2] , y[2] , w2 , sum[2] , w3);
    fa g4(x[3] , y[3] , w3 , sum[3] , sum[4]);

endmodule
