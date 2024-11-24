module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
/*
    wire clk,L, E,W;
    wire [3:0] R;
    reg [3:0] Q;
    assign clk= KEY[0];
    assign E= KEY[1];
    assign L=KEY[2];
    assign W=KEY[3];
    assign R= SW;
    assign Q= LEDR;
    
    always @(posedge clk)
        begin 
            case({E,L})
                2'b00: Q <=Q;
                2'b01: Q<=R;
                2'b10: 
                    begin 
                        Q[0]<=Q[1] ; Q[1]<=Q[2];Q[2]<=Q[3];
                        Q[3]<=W;
                    end 
                2'b11: Q<=R;
            endcase   
        end 
        */
     MUXDFF ins0(SW[3], KEY[0], KEY[1], KEY[2], KEY[3], LEDR[3]);
    MUXDFF ins1(SW[2], KEY[0], KEY[1], KEY[2], LEDR[3], LEDR[2]);
    MUXDFF ins2(SW[1], KEY[0], KEY[1], KEY[2], LEDR[2], LEDR[1]);
    MUXDFF ins3(SW[0], KEY[0], KEY[1], KEY[2], LEDR[1], LEDR[0]);
    
endmodule

module MUXDFF ( input R , clk , E , L , W , output reg Q);
    wire w1 , w2;
    
    assign w1 = E ? W : Q;
    assign w2 = L ? R : w1;
    
    always @(posedge clk)begin 
        Q<=w2;
    end

endmodule
