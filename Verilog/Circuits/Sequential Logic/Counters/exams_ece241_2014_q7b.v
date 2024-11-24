module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
  
    reg [3:0] q0, q1 , q2;
    
    always @(*) begin 
        if(reset)
            begin
            c_enable <=3'b000 ;
            end 
        else 
            begin 
            c_enable[0] = 1'b1;
            if(q0==4'd9)
                c_enable[1]=1'b1;
            else 
                c_enable[1]=1'b0;
                if(q0==4'd9 && q1==4'd9)
                    c_enable[2]=1'b1;
                else 
                    c_enable[2]=1'b0;
            end 
    end 
    
    assign OneHertz=( q2==4'd9 && q1==4'd9 && q0==4'd9); 
                
    bcdcount counter0 (clk, reset, c_enable[0] ,q0);
                    
    bcdcount counter1 (clk, reset, c_enable[1] ,q1);
                    
    bcdcount counter2 (clk, reset, c_enable[2] ,q2);
   // bcdcount counter1 ( .clk(q1), .reset(reset), c_enable[1] ,q2);
   // bcdcount counter2 ( .clk(q2), reset, c_enable[2] ,OneHertz);

endmodule
