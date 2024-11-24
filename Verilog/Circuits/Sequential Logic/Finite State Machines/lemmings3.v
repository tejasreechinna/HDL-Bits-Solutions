module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
	// parameter LEFT=0, RIGHT=1, ...
    parameter LEFT=3'd0, RIGHT=3'd1,FALL_L=3'd2,FALL_R=3'd3,DIG_L=3'd4,DIG_R=3'd5;
    reg [2:0]state, next_state;
 
    always @(*) begin
        // State transition logic
        next_state = state;
        case(state)
            LEFT  :begin
                if(~ground)begin
                    next_state=FALL_L;
                end
                else if(dig)begin
                    next_state=DIG_L;
                end
                else if(bump_left)begin
                    next_state=RIGHT;
                end
            end
            RIGHT :begin
                if(~ground)begin
                    next_state=FALL_R;
                end
                else if(dig)begin
                    next_state=DIG_R;
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
            DIG_L:begin
                if(!ground)begin
                    next_state=FALL_L;
                end
            end
            DIG_R:begin
                if(!ground)begin
                    next_state=FALL_R;
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
    assign digging = (state == DIG_L)|((state == DIG_R));
endmodule