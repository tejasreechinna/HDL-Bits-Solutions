module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk)
        begin 
        if(clk)
            q<=d;
    else 
        q=8'h00;
    end 

endmodule