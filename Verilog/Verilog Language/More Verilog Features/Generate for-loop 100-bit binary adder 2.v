module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
 
    assign {sum} = a+b+cin;
    assign cout[0]= a[0]&b[0]|cin&(a[0]^b[0]);
    always @(*)
        begin 
            for( int i=1 ; i<100 ; i=i+1 )
                cout[i]=a[i]&b[i]|cout[i-1]&(a[i]^b[i]);
        end 

endmodule
