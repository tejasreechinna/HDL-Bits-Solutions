module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output  z);
    
    parameter A=6'b000001 , B=6'b000010 , C=6'b000100 , D=6'b001000 , E=6'b010000 , F=6'b100000;
    reg [5:0] state , next_state;
    
    always @(posedge clk)
        begin 
            if(reset)
                state <= A;
            else 
                state<=next_state;
        end 
    always @(*)
        begin 
            case(state)
                A :next_state<= w? A:B;
                B: next_state<= w? D: C;
                C :next_state<= w? D:E;
                D: next_state<= w? A:F ;
                E: next_state<= w? D:E;
                F: next_state<= w? D:C;
                default : next_state <=A;
            endcase
        end 
    assign z = (state==E)||(state==F);
                

endmodule
