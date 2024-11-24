module top_module (
    input clk,
    input reset,     
    output shift_ena);
   
    reg [1:0] cnt;  
    always @(posedge clk)
        begin 
            if(reset)
               begin
                   shift_ena =1;
                   cnt=0;
               end 
            else 
                if(cnt== 2'b11)
                    begin 
                        shift_ena =0;
                    end 
            else 
                begin 
                    shift_ena=1;
                    cnt=cnt+1;
                end 
        end 
    

endmodule
