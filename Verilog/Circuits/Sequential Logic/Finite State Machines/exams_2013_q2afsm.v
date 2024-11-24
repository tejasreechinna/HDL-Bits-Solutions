module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    
    parameter A = 2'b00 , B = 2'b01 , C = 2'b10 , D = 2'b11 ;
    reg [1:0] state , next_state ;
    
    always @(posedge clk)
        begin 
            if(~resetn)
                state<=A ;
            else 
                state <= next_state;
        end 
    
    always @(*)
        begin 
            case(state)
                A : begin
                    	case(r)
                        3'b000 : next_state <= A;
                        3'b001 : next_state <= B ;
                        3'b010 : next_state <= C;
                        3'b011 : next_state <= B ;
                        3'b100 : next_state <= D;
                        3'b101 : next_state <= B ;
                        3'b110 : next_state <= C;
                        3'b111: next_state <= B;
                   		endcase 
               		 end 
				 B : begin
                    	 case(r[1])
                         	1'b1 : next_state <= B ;
                         	1'b0 : next_state <= A;                       
                   		endcase 
               		 end   
 				 C : begin
                     	case(r[2])
                         	1'b1 : next_state <= C ;
                         	1'b0 : next_state <= A;                       
                   		endcase 
               		 end   
				 D : begin
                       case(r[3])
                         	1'b1 : next_state <= D ;
                         	1'b0 : next_state <= A;                       
                   		endcase 
               		 end 
            endcase 
        end 
    
    assign g[1] = (state == B);
    assign g[2] = (state == C);
    assign g[3] = (state== D);
       
    

endmodule
