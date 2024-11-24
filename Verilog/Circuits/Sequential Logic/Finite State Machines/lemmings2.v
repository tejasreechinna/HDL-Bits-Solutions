module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT=2'd0, RIGHT=2'd1,FALL_L=2'd2,FALL_R=2'd3;
    reg [1:0]state, next_state;
 
    always @(*) begin
        next_state = state;
        case(state)
            LEFT :begin
                if(~ground)begin
                    next_state=FALL_L;
                end
                else if(bump_left)begin
                    next_state=RIGHT;
                end
            end
            RIGHT :begin
                if(~ground)begin
                    next_state=FALL_R;
                end
                else if(bump_right)begin
                    next_state=LEFT;
                end
            end
            FALL_L:begin
                if(ground)begin
                    next_state=LEFT;
                end
            end
            FALL_R:begin
                if(ground)begin
                    next_state=RIGHT;
                end
            end
        endcase
    end
 
    always @(posedge clk, posedge areset) begin
      
        if(areset)begin
            state <= LEFT;
        end
        else begin
            state <= next_state;
        end
    end
 
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL_L)|((state == FALL_R));
endmodule