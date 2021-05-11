`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/10 07:13:28
// Design Name: 
// Module Name: ALU_verification1
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


module ALU_verification1(c_out,result,a,b,select,clk);
parameter width = 32; 
output c_out; 
output [width-1:0] result;
input [width-1:0] a,b;
input [2:0]select; 
input clk; 
wire [width-1:0]sum, diff, and_out, or_out, not_out;
wire cout1, cout2; 


assign {cout1, sum} = a+b;
assign {cout2, diff} = a-b;
assign and_out = a&b; 
assign or_out = a|b; 
assign not_out = ~a; 


assign result = (select == 3'b000)? a:
 (select == 3'b001)? not_out:
 (select == 3'b011)? and_out:
 (select == 3'b100)? or_out:
 (select == 3'b101)? diff:
 (select == 3'b110)? sum: 0;
 
assign c_out =  (select == 3'b101)? cout2: 
  (select == 3'b110)? cout1: 0;
  
endmodule


