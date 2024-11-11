module top_module ();
  
    reg clk;
    reg reset ;
    reg t;
    wire q;
    
    tff ttt(clk, reset, t,q);
    
    initial begin
        clk=1'b0;
        forever #5 clk=~clk;
    end
    
    initial begin
        reset = 1'b1;
        t = 1'b0;
        #10;
        reset = 1'b0;
        t = 1'b1;
       
    end
    

endmodule
