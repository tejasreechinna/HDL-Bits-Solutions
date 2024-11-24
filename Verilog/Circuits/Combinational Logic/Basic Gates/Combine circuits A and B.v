module cktA(input a , b ,output c);
    assign c=(a^b)&a;
    endmodule 
module cktB(input A , B , output C );
    assign C=~(A^B);
    endmodule 
module top_module (input x, input y, output z);
    wire w1 , w2 , w3 , w4 ,w5 , w6;
    cktA g1(x , y , w1);
    cktB g2(x , y , w2);
    or g3(w3 , w1 , w2);
    cktA g4(x,y,w4);
    cktB g5(x , y, w5);
    and g6(w6 ,w4 , w5 );
    xor g7(z , w3 , w6);
endmodule
