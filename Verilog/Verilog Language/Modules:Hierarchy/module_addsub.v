module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
 wire w1,w2;
    reg [31:0] b_in;
    assign b_in={32{sub}}^b;
    //wire [15:0] sum1;
    add16 g1(a[15:0] ,b_in[15:0],sub ,sum[15:0] , w1);
    add16 g2(a[31:16], b_in[31:16] , w1 , sum[31:16] , w2);
                                //assign sum[31:16]=sum[15:0];
                                
endmodule
