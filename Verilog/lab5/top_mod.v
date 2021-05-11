`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/12 03:23:38
// Design Name: 
// Module Name: top_mod
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


module top_mod(res_out, overflow, zero, carry_out, a, b, opcode, clk);
parameter width = 32;

output [width - 1:0] res_out;
output overflow, zero, carry_out;
input clk;
input [width - 1:0] a, b;
input [2:0] opcode;
wire C;
wire [width - 1:0] result;


ALU_32bit #(width) alub (.result(result), .c_out(C), .a(a), .b(b), .opcode(opcode), .clk(clk));
alu_regis #(width) areg (.res_o(res_out), .carry_o(carry_out), .overf(overflow), .zero(zero), .opcode(opcode), .a(a), .b(b), .carry(C), .result(result), .clk(clk));
endmodule
