module top_module (
    input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
    output [2:0] LEDR);  // Q
    //reg  d;
    always @(posedge KEY[0] )
        begin 
            case(KEY[1])
                1'b0 :
                    begin
                        LEDR[0] <= LEDR[2];
                        LEDR[1] <=LEDR[0];
                        LEDR[2] <=LEDR[2] ^LEDR[1];
                    end 
                1'b1: 
                    begin
                        //d<=SW[0];
                        LEDR[0]<=SW[0];
                        LEDR[1]<=SW[1];
                        LEDR[2]<=SW[2];
                    end 
            endcase
        end              
             
endmodule
