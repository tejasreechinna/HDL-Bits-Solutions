module top_module (
    input clk,
    input a,
    output q );
    always @(posedge clk)
        begin 
            if(clk)
                q<=~a;
        end 
    

endmodule
