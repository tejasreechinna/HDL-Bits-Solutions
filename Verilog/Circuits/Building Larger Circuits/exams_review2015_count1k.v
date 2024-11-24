module top_module (
    input clk,
    input reset,
    output reg [9:0] q);
    
    always @(posedge clk)
        begin 
            if(reset)
                q<=10'b0000000000;
            else
                if( q>=0 && q< 10'd999)
                    q<= q + 10'b0000000001;
            else 
                q<=0;
        end 
            
endmodule
