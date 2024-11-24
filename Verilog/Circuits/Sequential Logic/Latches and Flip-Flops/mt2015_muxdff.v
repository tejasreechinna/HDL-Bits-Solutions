module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    reg w1;
    
    assign w1=(L)? r_in:q_in;
    
    always @(posedge clk)
        begin
            if(clk)
                Q<=w1;
            else 
                Q<=0;
        end

endmodule
