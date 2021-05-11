`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/03 19:31:45
// Design Name: 
// Module Name: CSA_16b
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


module CSA_16b(sum, c_out, a, b, c_in);
input [15:0] a,b;
input c_in;
output [15:0] sum;
output c_out;
 
wire [2:0] w;
 
RCA_4b ripplecarry1(
.sum(sum[3:0]),
.c_out(w[0]),
.a(a[3:0]),
.b(b[3:0]),
.c_in(c_in));
 
CSA_4b CSA4_1(
.sum(sum[7:4]),
.c_out(w[1]),
.a(a[7:4]),
.b(b[7:4]),
.c_in(w[0]));
 
CSA_4b CSA4_2(
.sum(sum[11:8]), 
.c_out(w[2]),
.a(a[11:8]),
.b(b[11:8]),
.c_in(w[1]));
 
CSA_4b CSA4_3(
.sum(sum[15:12]),
.c_out(c_out),
.a(a[15:12]),
.b(b[15:12]),
.c_in(w[2]));
endmodule
