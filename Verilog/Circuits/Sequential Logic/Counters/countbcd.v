module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output reg [15:0] q);
    
                  
    always @(posedge clk)
        begin 
            if(reset)
                begin 
                    ena <= 3'd0;
                    //q<=0;
                end
            else 
                if(q[3:0]==4'd8)
                    ena[1] <= 1'b1;
            else 
                ena[1]<=1'b0;
            if(q[3:0]==4'd8 && q[7:4]==4'd9)
                ena[2]<=1'b1;
            else 
                ena[2]<=1'b0;
            if(q[11:8]==4'd9 && q[7:4] == 4'd9 && q[3:0]==4'd8)
                ena[3]<=1'b1;
            else 
                ena[3]<=1'b0;
        end 
    
    d_bcd d1( .clk(clk) , .reset(reset) , .ena(1) , .q(q[3:0]) );
    d_bcd d2( .clk(clk) , .reset(reset) , .ena(ena[1]) , .q(q[7:4]) );
    d_bcd d3( .clk(clk) , .reset(reset) , .ena(ena[2]) , .q(q[11:8]) );
    d_bcd d4( .clk(clk) , .reset(reset) , .ena(ena[3]) , .q(q[15:12]) );    
                    
            

endmodule


 module d_bcd( input clk , reset ,ena , output reg [3:0] q);
        
        always @(posedge clk)
            begin 
                if(reset)
                    begin q<=0; end 
                else
                    if(ena)
                        begin 
                            if( q== 4'd9)
                                begin q<=0; end 
                            else 
                                begin q<= q+1'd1; end 
                        end 
                   else 
                       begin   q<=q; end 
            end 
    endmodule
