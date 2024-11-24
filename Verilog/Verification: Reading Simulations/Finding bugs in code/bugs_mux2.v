module top_module (
    input wire sel,
    input wire[7:0] a,
    input wire[7:0] b,
    output reg [7:0] out  );

    always @(*)begin
 
        if(sel==1)
            out=a[7:0];
            else
                out=b[7:0];
            end 
    

endmodule

