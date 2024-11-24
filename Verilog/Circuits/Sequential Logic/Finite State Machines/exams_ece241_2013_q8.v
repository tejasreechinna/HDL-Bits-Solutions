module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); //101
    
    parameter A = 3'b001, B = 3'b010, C = 3'b100;
    reg [2:0] state, next_state;
    
    always @(posedge clk or negedge aresetn)
        begin 
            if(~aresetn)
                state <= A;
            else 
                state <= next_state;
        end 
    
    always @(*)
        begin 
            case(state)
                A: next_state<= (x)? B : A;
                B: next_state<= (x)? B : C;
                C: next_state<= (x)? B : A;
                default : next_state <= A;
            endcase
        end 
    
    assign z = (state== C) && x;

endmodule
