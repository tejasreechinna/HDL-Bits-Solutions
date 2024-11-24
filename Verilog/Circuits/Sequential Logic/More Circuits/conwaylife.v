module top_module (
    input clk,
    input reset,     
    input data,
    output start_shifting);
    

    parameter s0=0,s1=1,s11=2,s110=3,s1101=4;
    reg [2:0]state,next;
    
    always@(posedge clk) begin
        if(reset)
            state<=0;
        else
            state<=next;
    end
    
    always@(*) begin
        case(state)
            s0:next=data?s1:s0;
            s1:next=data?s11:s0;
            s11:next=data?s11:s110;
            s110:next=data?s1101:s0;
            s1101:next=s1101;
        endcase
    end   
    assign start_shifting=(state==s1101);
endmodule
