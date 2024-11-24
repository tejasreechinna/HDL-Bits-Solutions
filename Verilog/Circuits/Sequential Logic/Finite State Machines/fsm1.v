module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    
        case(state)
            B: next_state <=(in)?B :A;
            A: next_state<= (in)?A:B;
        endcase
    end

    always @(posedge clk or posedge areset) begin    // This is a sequential always block
        if(areset)
            state <= B;
        else
            state <= next_state;
    end

    // Output logic
            assign out = (state == B);

endmodule
