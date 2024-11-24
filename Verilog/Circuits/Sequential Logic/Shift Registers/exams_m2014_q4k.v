module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [2:0] q;
    always @(posedge clk)
        begin 
            if(resetn==0)
               begin q<=2'd0;
                   out<=1'b0; end 
            else begin
               q[0] <= in;
            q[1]<=q[0];
            q[2]<=q[1];
                out<=q[2];end
        end 
           
endmodule
