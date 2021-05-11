`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/12 02:07:53
// Design Name: 
// Module Name: alu_regis
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


module alu_regis(res_o, carry_o, overf, zero, opcode, a, b, carry, result, clk);
    parameter width = 32;
    input [width - 1:0] a, b, result;
    input carry;
    input [2:0] opcode;
    input clk;
    output reg [width -1:0] res_o;
    output reg carry_o, overf, zero;
    
    
    always@(posedge clk)
		begin
    carry_o = carry;
    res_o = result;
    overf = (carry>0)? 1:0;         
    zero = (result != 0)? 0: 1;
    
    end
        
endmodule
