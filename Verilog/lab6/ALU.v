`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/15 21:49:04
// Design Name: 
// Module Name: ALU
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


module ALU(result,a,b,ALUop); 
output [31:0] result;
input [31:0] a,b;
input [2:0]ALUop; 
wire [31:0]sum, diff, and_out, or_out, not_out;
wire slt_out;

assign sum = a+b;
assign diff = a-b;
assign and_out = a&b; 
assign or_out = a|b; 
assign not_out = ~a; 
assign slt_out = (a<b)? 1:0;

assign result = (ALUop == 3'b000)? not_out:
 (ALUop == 3'b001)? a:
 (ALUop == 3'b011)? or_out:
 (ALUop == 3'b100)? and_out:
 (ALUop == 3'b101)? sum:
 (ALUop == 3'b110)? diff:
 (ALUop == 3'b111)? slt_out:0;

  
endmodule

