module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    
    parameter byte1 = 2'b00 , byte2 = 2'b01 , byte3 = 2'b10 , complete = 2'b11 ;
    
    reg [1:0] state , next_state ;
    
    
    always @(posedge clk)
        begin 
            if(reset)
                state <= byte1;
            else 
                state<= next_state ;
        end 
    
    always @(*)
        begin 
            case (state)
                byte1 : next_state <= (in[3])? byte2 : byte1 ;
                byte2 : next_state <= byte3 ;
                byte3 : next_state <= complete ;
                complete : next_state <= (in[3])? byte2 : byte1;
            endcase 
        end 
    
    assign done = (state == complete) ; 
	always@(posedge clk) begin
        case(state)
                    byte1:out_bytes[23:16]<=in;
                    byte2:out_bytes[15:8]<=in;
                    byte3:out_bytes[7:0]<=in;
                    complete:out_bytes[23:16]<=in;
        endcase
    end 
 
endmodule
