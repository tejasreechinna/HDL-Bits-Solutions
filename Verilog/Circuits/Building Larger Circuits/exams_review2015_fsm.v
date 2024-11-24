
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output reg done,
    input ack );
    
    parameter s=4'd0 , s1=4'd1 , s11 = 4'd2 , s110 = 4'd3 , b0=4'd4 , b1= 4'd5 , b2 = 4'd6, b3 = 4'd7 , count = 4'd8 , Wait = 4'd9;
    reg [3:0] state , next_state ;
    
    always @(posedge clk)
        begin 
            if(reset)
                state <= s ;
            else 
                state <= next_state ;
        end 
    always @(*)
        begin 
            case(state)
                s : next_state <= (data)? s1 : s ;
                s1: next_state <= (data)?s11:s;
                s11: next_state <= (data)? s11 : s110;
                s110: next_state <=(data)? b0: s;
                b0 : next_state <= b1;
                 b1 : next_state <= b2;
                 b2 : next_state <= b3;
                 b3 : next_state <= count;
                count : next_state <= (done_counting)?Wait : count ;
                Wait : next_state <= (ack)? s : Wait ;
                default : next_state <= s;
            endcase
        end 
    
    assign shift_ena = (state==b0)|(state == b1)| (state==b2)||(state==b3);
    assign counting= (state == count);
    assign done = (state== Wait);
                
 endmodule