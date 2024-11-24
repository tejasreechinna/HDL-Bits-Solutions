module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output reg tc
);
    reg [ 9:0] q;
    reg [ 9:0] w;
    always @(posedge clk)
        begin
            if(load)
                 begin 
                     w<=data;
                 end 
            else if(w!=0)
                 begin 
                     w = w-1'b1;
                 end 
              else
                  w <= w;
        end 
    
    assign tc =(w==0)? 1: 0;
endmodule
