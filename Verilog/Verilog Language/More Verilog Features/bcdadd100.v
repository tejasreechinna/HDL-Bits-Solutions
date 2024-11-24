module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [399:0]w;
    bcd_fadd f1(a[3:0] , b[3:0] , cin , w[0] , sum[3:0]);
      generate 
            genvar i; 
            for (i=4 ; i<400 ; i=i+4 )
                begin:bcd100 // refering 100 copies of bcd
                    bcd_fadd dut(a[i+3:i] , b[i+3:i] ,w[i-4] ,w[i], sum[i+3:i] );
                end 
        endgenerate    
    assign cout=w[400-4];

endmodule
