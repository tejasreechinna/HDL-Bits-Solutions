module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter s0=0 , s1=1 , s2=2 ;
    reg [1:0] state , next_state ;
    
    always @(posedge clk or posedge areset)
        begin 
            if(areset)
                state<= s0;
            else
                state <= next_state;
        end 
    always @(*)
        begin 
            case(state)
                s0: next_state <= x? s1 : s0;
                s1: next_state<= s2;
                s2: next_state <= s2;
                default : next_state <= s0;
            endcase
        end 
    
    always @(posedge clk or posedge areset)
        begin 
            if(areset)
                z<=1'b0;
            else 
                begin 
                if(next_state==s2)
                    z <= ~x;
            else 
                z= x;
                end 
        end              
                

endmodule
