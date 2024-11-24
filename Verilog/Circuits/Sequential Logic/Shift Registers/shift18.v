module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
 
    always @(posedge clk)
        begin 
            if(load)
                q<=data;
            else 
                begin 
                    if(ena)
                        begin 
                            case(amount)
                                2'b00: q<= q<<1;// shift left by 1 bit.
                                2'b01: q<= q<<8; //shift left by 8 bits.
                                2'b10: begin 
                                       q<= q>>1;//shift right by 1 bit.
                                        if(q[63]==1)
                                        begin q[63]<=1; end 
                                       end 
                                2'b11: 
                                    begin 
                                        q<= q>>8; // shift right by 8 bits.
                                        if(q[63]==1)
                                            begin 
                                                q[63:56]<={8{1'b1}};
                                            end 
                                    end 
                                default: q<=q;
                            endcase
                        end 
                end 
        end 
                   
endmodule
