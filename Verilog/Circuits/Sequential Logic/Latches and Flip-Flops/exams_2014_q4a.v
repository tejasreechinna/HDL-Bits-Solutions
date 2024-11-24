module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    reg w1 , w2 ;
    
    assign w1=E?w:Q;
    assign w2 = L ? R :w1;
    always @(posedge clk)
        begin if(clk)
            Q<=w2;
            else 
                Q<=0;
        end

endmodule
