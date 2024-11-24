module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    always @(posedge clk or posedge areset)
        begin 
            if(areset==1)
                q<=4'd0;
            else 
                begin 
                    if(load==1)
                        q<=data;
                    else 
                        begin 
                            if(ena==1)
                               q = q>>1;
                        end   
                end 
        end 
   
endmodule
