module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always @(posedge clk)
        begin 
            if(reset)
                q<=4'd0;
            else
                if (q>=4'd0 && q<4'd9)
                    q = q+4'd1; 
                else 
                    q<=4'd0;
        end 

endmodule
