`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/10 02:03:08
// Design Name: 
// Module Name: ALU_32bit
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

module ALU_32bit(result,c_out, a, b, opcode, clk);
parameter width = 32;
output [width-1:0] result; 
output c_out;  

input clk;
input [width-1:0]  a;  
input [width-1:0]  b;  
input [2:0] opcode; 

wire [width-1:0] add_sub, and_out, or_out, xor_out, not_out, mov_out;
wire 	 s; 
wire 	 overflow_intermediate;
wire 	 c_out_intermediate;

carry_select_adder_subtractor #(width) addsub(add_sub, c_out, overflow_intermediate, a, b, opcode[1]);     
genvar i;
   generate 
   for (i  = 0; i < width; i = i +1) begin: loop
        and and11 (and_out[i], a[i],b[i]);
        or or11 (or_out[i], a[i],b[i]);
        not not11(not_out[i],a[i]);
        or mov11(mov_out[i], 1'b0,a[i]);
    end
endgenerate 

                                                                                 
mux #(width) muxy(result,add_sub, and_out, or_out,not_out, mov_out, opcode); 

endmodule
