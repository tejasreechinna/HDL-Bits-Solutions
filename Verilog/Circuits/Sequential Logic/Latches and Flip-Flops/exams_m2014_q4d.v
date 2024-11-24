module top_module (
    input clk,
    input in, 
    output out);
    always @(posedge clk)
        begin 
            if(clk)
                out=(out^in);
            else 
                out<=0;
        end

endmodule
