module fa(input x , y, z , output s , c);
    assign s=x^y^z;
    assign c=x&&y|| (z&&(x^y));
    endmodule 
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    fa g1(a[0] , b[0] , cin , sum[0] , cout[0] );
    fa g2(a[1] , b[1] , cout[0], sum[1] , cout[1] );
    fa g3(a[2] , b[2] , cout[1] , sum[2] , cout[2]);

endmodule
