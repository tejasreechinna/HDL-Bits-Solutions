module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    //int cin=1'b0;
    wire w1, cin , cout1 ;
    
    add16 g1(.a(a[15:0]) ,.b(b[15:0]) , .cin(0) ,.sum(sum[15:0]) ,.cout( w1));
    add16 g2(.a(a[31:16]),.b(b[31:16]) , .cin(w1), .sum(sum[31:16]) , .cout(cout1));

endmodule

module add1( input a, input b, input cin,   output sum, output cout );
assign sum=a^b^cin;
    assign cout= (a&b)|(cin&(a^b));
endmodule
