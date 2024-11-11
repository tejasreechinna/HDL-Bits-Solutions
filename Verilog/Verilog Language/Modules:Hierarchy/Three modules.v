module top_module ( input clk, input d, output q );
    wire w1,w2;
    my_dff dut1(clk , d , w1);
    my_dff dut2(clk , w1,w2);
    my_dff dut3(clk , w2 , q);

endmodule
