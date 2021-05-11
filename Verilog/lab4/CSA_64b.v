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


module CSA_64b(sum, c_out, a, b, c_in);
input [63:0] a,b;
input c_in;
output [63:0] sum;
output c_out;
 
wire [2:0] w;
 
RCA_16b RCA16_1(
.sum(sum[15:0]),
.c_out(w[0]),
.a(a[15:0]),
.b(b[15:0]),
.c_in(c_in));
 
CSA_16b CSA16_1(
.sum(sum[31:16]),
.c_out(w[1]),
.a(a[31:16]),
.b(b[31:16]),
.c_in(w[0]));
 
CSA_16b CSA16_2(
.sum(sum[47:32]), 
.c_out(w[2]),
.a(a[47:32]),
.b(b[47:32]),
.c_in(w[1]));
 
CSA_16b CSA16_3(
.sum(sum[63:48]),
.c_out(c_out),
.a(a[63:48]),
.b(b[63:48]),
.c_in(w[2]));

endmodule
