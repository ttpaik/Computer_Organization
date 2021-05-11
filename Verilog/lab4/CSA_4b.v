`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/03 19:19:24
// Design Name: 
// Module Name: CSA_4b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CSA_4b(sum, c_out, a, b, c_in);
input [3:0] a,b;
input c_in;
output [3:0] sum;
output c_out;
 
wire [3:0] s0,s1;
wire w0,w1;
 
RCA_4b ripplecarry1(
.sum(s0[3:0]),
.c_out(w0),
.a(a[3:0]),
.b(b[3:0]),
.c_in(1'b0));
 
RCA_4b ripplecarry2(
.sum(s1[3:0]),
.c_out(w1),
.a(a[3:0]),
.b(b[3:0]),
.c_in(1'b1));

mux mux1(
.input1(s0[3:0]),
.input2(s1[3:0]),
.sel(c_in),
.outp(sum[3:0]));
 
mux mux2(
.input1(w0),
.input2(w1),
.sel(c_in),
.outp(c_out));
endmodule