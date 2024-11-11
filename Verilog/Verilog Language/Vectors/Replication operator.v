`timescale 1ns / 1ps

module multiplier_approx_2(

    );
endmodule

`timescale 1ns / 1ps

module half_adder(input a , b , output sum , carry);
assign sum = a^b ; 
assign carry = a&b;
endmodule

module approx_ha (input a , b , output sum , carry);
assign sum = a|b ;
assign carry = a&b;
endmodule 

module full_adder(input a , b , c, output sum , carry);
assign sum = a^b^c ;
assign carry = (a|b)&c|a&b;
endmodule 

module approx_fa(input a , b, c, output  sum ,carry);
assign carry = a&b|(b&c)|(c&a);
assign sum = ~a&(b|c) | b&c;
endmodule 


module partial_row(input b , input [7:0] a , output [7:0] c);
assign c = a & {8{b}};
endmodule 

module multiplier_approx_2(input [7:0] a , b , output [15:0] y);

wire [7:0] p[7:0] ;
partial_row a1(b[0] , a , p[0]);
partial_row a2(b[1] , a , p[1]);
partial_row a3(b[2] , a , p[2]);
partial_row a4(b[3] , a , p[3]);
partial_row a5(b[4] , a , p[4]);
partial_row a6(b[5] , a , p[5]);
partial_row a7(b[6] , a , p[6]);
partial_row a8(b[7] , a , p[7]);

wire [65:0] c;
wire [54:0]s;

//----------------------------LEVEL-1 -----------------------------//
//-------------------approximate region --------------------------//
approx_ha h1(p[0][1] , p[1][0] ,s[0] , c[0]);//s[0]=y[1]
approx_fa f1(p[0][2] , p[1][1] , p[2][0],s[1],c[1]); 
approx_fa f2(p[0][3] , p[1][2] , p[2][1],s[2],c[2]);
approx_fa f3(p[0][4] , p[1][3] , p[2][2],s[3],c[3]);
approx_ha h2(p[3][1] , p[4][0] , s[4] , c[4]);
approx_fa f4(p[0][5] , p[1][4] , p[2][3],s[5],c[5]);
approx_fa f5(p[3][2] , p[4][1] , p[5][0],s[6],c[6]);
approx_fa f6(p[0][6] , p[1][5] , p[2][4],s[7],c[7]);
approx_fa f7(p[3][3] , p[4][2] , p[5][1],s[8],c[8]);
approx_fa f8(p[0][7] , p[1][6] , p[2][5],s[9],c[9]);
approx_fa f9(p[3][4] , p[4][3] , p[5][2],s[10],c[10]);

//------------------ Exact region --------------------------------//

half_adder h3(p[1][7] , p[2][6] ,s[11],c[11]);
full_adder f10(p[3][5] , p[4][4] , p[5][3],s[12],c[12]);
full_adder f11(p[3][6] , p[4][5] , p[5][4],s[13],c[13]);
full_adder f12(p[3][7] , p[4][6] , p[5][5],s[14],c[14]);
half_adder h4(p[4][7] , p[5][6],s[15],c[15]);

//---------------------------LEVEL-2----------------------------// 
//----------------------approximate region---------------------//
approx_ha h5(c[0] , s[1] ,s[16],c[16]); //s[16]=y[2]
approx_fa f13(p[3][0] , c[1] , s[2] , s[17],c[17]);
approx_fa f14(s[3] , s[4] , c[2],s[18],c[18]); 
approx_fa f15(s[5] , s[6] , c[3] ,s[19],c[19]); 
approx_fa f16(s[7] , s[8] , c[5] , s[20],c[20]);
approx_ha h6(c[6] , p[6][0],s[21],c[21]);
approx_fa f17(s[9] , s[10] , c[7],s[22],c[22]);
approx_fa f18(c[8] , p[6][1] , p[7][0],s[23],c[23]);

//---------------------------Exact region--------------------//
full_adder f19(s[11] , s[12] , c[9] ,s[24],c[24]);
full_adder f20(c[10] , p[6][2] , p[7][1],s[25],c[25]);
full_adder f21(p[2][7] , c[11] , c[12],s[26],c[26]);
full_adder f22(s[13] , p[6][3] , p[7][2],s[27],c[27]);
full_adder f23(c[13] , p[6][4] , p[7][3],s[28],c[28]);
full_adder f24(s[15] ,p[6][5] , p[7][4],s[29],c[29]);
full_adder f25(p[5][7] , p[6][6] , p[7][5] , s[30],c[30]);
half_adder h7(p[6][7] , p[7][6],s[31],c[31]);


//-------------------LEVEL-3-------------------------------------//
//---------------- approximate region --------------------------//
approx_ha h8(c[16] , s[17], s[32] ,c[32]);
approx_ha h9(c[17] , s[18],s[33],c[33]);
approx_fa f26(c[18] , c[4] , s[19],s[34],c[34]); 
approx_fa f27(c[19] , s[20] , s[21],s[35],c[35]);
approx_fa f28( c[20] ,c[21] , s[22],s[36],c[36]);

//----------------------Exact  region---------------------------//
full_adder f29(c[22] ,c[23] , s[24],s[37],c[37]);
full_adder f30(c[25],c[24] , s[26],s[38],c[38]);
full_adder f31(s[14] , c[26] , c[27],s[39],c[39]);
full_adder f32(c[14] , c[28],s[29],s[40],c[40]);
full_adder h10(c[29] , s[30] ,c[15], s[41] , c[41]);
half_adder h11(c[30] , s[31] , s[42] , c[42]);
half_adder h12(c[31] , p[7][7] , s[43] , c[43]);

//---------------------LEVEL-4------------------------------------//
//-------------------approximate region--------------------------//
approx_ha h13(c[32] , s[33] , s[44] , c[44]);
approx_ha h14(c[33] , s[34] , s[45] , c[45]);
approx_ha h15(c[34] , s[35] , s[46] , c[46]);
approx_fa f33(c[35] , s[36] , s[23] , s[47] , c[47]);

//---------------------exact region-----------------------------//
full_adder f34(c[36] , s[37] , s[25] , s[48] , c[48]);
full_adder f35(c[37] , s[38] , s[27] , s[49] , c[49]);
full_adder f36(c[38] , s[39] , s[28] , s[50] , c[50]);
half_adder h16(c[39] , s[40] , s[51] , c[51]);
half_adder h17(c[40] , s[41] , s[52] , c[52]);
half_adder h18(c[41] , s[42] , s[53] , c[53]);
half_adder h19(c[42] , s[43] , s[54] , c[54]);

//----------------------LEVEL-5--------------------------------//

//--------------approximate region -----------------------------//
assign y[0]= p[0][0] ;
assign y[1]= s[0];
assign y[2]=s[16];
assign y[3]=s[32];
assign y[4]=s[44];
approx_ha h20(c[44] , s[45] , y[5] , c[55]);
approx_fa f37(c[45] , s[46] , c[55] , y[6] , c[56]);
approx_fa f38(c[46] , s[47] , c[56] , y[7] , c[57]);
approx_fa f39(c[47] , s[48] , c[57] , y[8] , c[58]);

//----------------------exact region -------------------------//
full_adder f40(c[48] , s[49] , c[58] , y[9] , c[59]);
full_adder f41(c[49] , s[50] , c[59] , y[10] , c[60]);
full_adder f42(c[50] , s[51] , c[60] , y[11] , c[61]);
full_adder f43(c[51] , s[52] , c[61] , y[12] , c[62]);
full_adder f44(c[52] , s[53] , c[62] , y[13] , c[63]);
full_adder f45(c[53] , s[54] , c[63] , y[14] , c[64]);
full_adder f46(c[43] , c[54] , c[64] , y[15] , c[65]);


endmodule
