module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire w;
    xnor g1(w , in1 , in2);
    xor g2(out , w , in3);

endmodule
