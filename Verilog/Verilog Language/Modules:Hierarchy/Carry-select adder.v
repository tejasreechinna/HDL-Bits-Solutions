module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w1 ;
    wire [31:0] b_exor;
    assign b_exor={32{1'b0}}^b;
    wire [15:0] sum1 , sum2;
    add16 g1 (a[15:0] , b_exor[15:0] ,0 , sum[15:0] , w1);
    add16 g2 (a[31:16] , b_exor[31:16], 0 , sum1 );
    add16 g3(a[31:16] , b_exor[31:16] , 1 , sum2 );
    assign sum[31:16]=(w1)?sum2:sum1;
             
endmodule
