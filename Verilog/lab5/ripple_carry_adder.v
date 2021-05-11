`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/10 06:11:14
// Design Name: 
// Module Name: ripple_carry_adder
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



module ripple_carry_adder(result, c_out, overflow, a,b, c_in);
parameter width = 32;
output [width-1:0] result;
output c_out,overflow;
input [width-1:0] a,b;
input c_in;

wire [width-1:0] c_out_intermediate;

FA_str fa0 (c_out_intermediate[0], result[0], a[0],b[0], c_in);
genvar i;
   generate 
   for (i  = 1; i < width; i = i +1) begin: loop
        FA_str fa1(c_out_intermediate[i],result[i],a[i],b[i],c_out_intermediate[i-1]);
    end
endgenerate
and (overflow,c_out_intermediate[width-1],result[width-1]);
or or11(c_out,c_out_intermediate[width-1],0);
endmodule
