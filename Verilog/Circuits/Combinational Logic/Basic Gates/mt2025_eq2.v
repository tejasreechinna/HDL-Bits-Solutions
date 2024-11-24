module top_module ( input [1:0] A, input [1:0] B, output z ); 
    assign z=1?(A==B):0;

endmodule
