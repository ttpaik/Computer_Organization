`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/10 04:45:13
// Design Name: 
// Module Name: carry_select_adder_subtractor
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


module carry_select_adder_subtractor(result, c_out, overflow, a, b, opcode);
parameter width = 32;
   output [width-1:0] result;   
   output 	 c_out;   
   output 	overflow;   
   input [width-1:0]  a;  
   input [width-1:0]  b;   
   input 	 opcode;  
   
   
   wire 	 c_final;  
   wire [width-1:0] Bx;
   wire opcode_out;
   
   not(opcode_out,opcode);
   

genvar i;
   generate 
   for (i  = 0; i < width; i = i +1) begin: loop
        xor(Bx[i], b[i], opcode_out);
    end
endgenerate
ripple_carry_adder #(width) rca(result, c_final, overflow, a, Bx, opcode_out);       
xor(c_out, c_final, opcode_out);              
endmodule
