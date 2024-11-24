module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter idle=0,start=1,data=2,error=3,stop=4;
    reg [2:0]state,next;
    reg [3:0]cnt;
    reg done_lable;
    
    always@(*) begin
        case(state)
            idle:next=in?idle:start;
            start:next=data;
            data:next=(cnt==8)?(in?stop:error):data;
            error:next=in?idle:error;
            stop:next=in?idle:start;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state<=idle;
        else
            state<=next;
    end
    
    always@(posedge clk) begin       
        case(next)
            data:cnt<=cnt+1;
            start:cnt<=0;
            default:cnt<=cnt;
        endcase
    end
    
    always@(posedge clk) begin
        case(next)
            stop:done_lable<=1;
            default:done_lable<=0;
        endcase
    end
    
    assign done=done_lable;
                           
endmodule