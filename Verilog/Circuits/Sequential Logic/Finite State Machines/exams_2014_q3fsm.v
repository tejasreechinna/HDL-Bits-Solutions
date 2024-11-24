module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    parameter A=1'b0 , B=1'b1 ;
    
    reg [1:0] cnt;
    reg [1:0] cntr;
    
    reg state , next_state;
    
    always @(posedge clk)
        begin 
            if(reset)
                state<= A;
            else 
                state<=next_state;
        end 
    always @(*)
        begin 
            case(state)
                A: next_state= s? B : A ;
                B: next_state= B;
                default :next_state=B;
             endcase 
        end 
    always @(posedge clk)
        begin 
            if(reset)begin 
                cnt<=2'd0;
                cntr <=2'd0;end 
            else 
                if(state==A)
                    begin 
                     cnt<=2'd0;
                    cntr <=2'd0; end
                else 
                    if(cntr==3)
                        begin 
                        cntr<=2'd1;
                        cnt<=w;
                        end
                    else 
                        begin 
                            cntr = cntr+1'd1;
                            cnt = cnt + w ;
                        end 
        end 
    assign z = (cnt==2)&&(cntr==3);
    
endmodule
