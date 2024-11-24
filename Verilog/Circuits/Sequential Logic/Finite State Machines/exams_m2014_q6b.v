module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    assign Y2 = ~w & ( (y==3'b001)| (y==3'b101)) | w & ((y==3'b100) | (y==3'd5 ) | (y==3'd1) | ( y==3'd2) );

endmodule
