module top_module (
    input clk,
    input reset,
    output [3:0] q);
    always @(posedge clk)
        begin 
            if(reset)
                q<=4'd1;
            else 
                if(q>=4'd0 && q < 4'd10)
                    q=q+4'd1;
                else 
                    q<=4'd1;
        end 

endmodule
