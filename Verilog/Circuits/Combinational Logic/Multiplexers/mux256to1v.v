module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
   always @(*)
        begin
            integer z;
            z=0;
            for ( integer i=0;i<1024;i=i+4)
               begin
                   if ( sel == z && z<256)
                       out= {in[i+3],in[i+2],in[i+1],in[i]}; 
                   z=z+1;
               end
        end
endmodule