module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire w1 , w2,w3,w4;
    and g1(w1 , p2a , p2b);
    and g2(w2 , p2c , p2d);
    or g3(p2y , w1 , w2);
    and g4(w3 , p1a , p1b , p1c);
    and g5(w4 , p1d , p1e , p1f);
    or g6(p1y , w4 , w3);
    


endmodule
