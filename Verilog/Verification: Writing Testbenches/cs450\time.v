module top_module();
    reg clk , in ;
    reg [2:0] s ;
    wire out;
    
    q7 dut(.clk(clk) , .in(in) , .s(s));
 initial begin 
     clk=0;
     forever #5 clk=~clk;
 end 
    initial begin 
        s=3'd2; in=0; #10;
        s=3'd6 ; in=0; #10;
        s= 3'd2; in=1; #10;
        s=3'd7 ; in=0; #10;
        s=3'd0; in=1; # 30;
        in=0;s=3'd0;
            
    end
            

endmodule
