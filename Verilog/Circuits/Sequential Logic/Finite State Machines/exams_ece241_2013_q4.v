module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr
); 
    
    // State encoding
    parameter belows1 = 3'b000, 
              btws1_s2 = 3'b001, 
              s2tos1 = 3'b010, 
              btws2_s3 = 3'b011, 
              s3_s2 = 3'b100, 
              aboves3 = 3'b101;
    
    reg [2:0] state, next_state;
    
    // State register
    always @(posedge clk )
    begin 
        if (reset)
            state <= belows1;
        else 
            state <= next_state;
    end 

    // Output logic based on current state
    always @(*)
    begin 
        case(state)
            belows1:  {fr3, fr2, fr1, dfr} = 4'b1111;
            btws1_s2: {fr3, fr2, fr1, dfr} = 4'b0110;
            s2tos1:   {fr3, fr2, fr1, dfr} = 4'b0111;
            btws2_s3: {fr3, fr2, fr1, dfr} = 4'b0010;
            s3_s2:    {fr3, fr2, fr1, dfr} = 4'b0011;
            aboves3:  {fr3, fr2, fr1, dfr} = 4'b0000;
            default:  {fr3, fr2, fr1, dfr} = 4'bxxxx;
        endcase
    end 
     
    // Next state logic
    always @(*)
    begin
        case(state)
            belows1:    next_state = s[1] ? btws1_s2 : belows1;
            btws1_s2:   next_state = s[2] ? btws2_s3 : (s[1] ? btws1_s2 : belows1);
            s2tos1:     next_state = s[2] ? btws2_s3 : (s[1] ? s2tos1 : belows1);
            btws2_s3:   next_state = s[3] ? aboves3 : (s[2] ? btws2_s3 : s2tos1);
            s3_s2:      next_state = s[3] ? aboves3 : (s[2] ? s3_s2 : s2tos1);
            aboves3:    next_state = s[3] ? aboves3 : s3_s2;
            default:    next_state = belows1;
        endcase
    end        
endmodule
