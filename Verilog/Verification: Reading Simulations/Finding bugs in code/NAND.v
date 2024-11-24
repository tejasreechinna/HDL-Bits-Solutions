module top_module (input a, input b, input c, output reg out);//
reg x;
    andgate inst1 ( x, a, b, c, 1'b1, 1'b1 );
assign out=~x;
endmodule
