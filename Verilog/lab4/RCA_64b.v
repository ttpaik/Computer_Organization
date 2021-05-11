`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/03 16:56:10
// Design Name: 
// Module Name: RCA_64b
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

module RCA_64b (sum, c_out, a, b, c_in);
    output [63:0] sum;
    output c_out;
    input [63:0] a, b;
    input c_in;
    wire c_in16, c_in32, c_in48;
   
    RCA_16b L1 (sum[15:0], c_in16, a[15:0], b[15:0], c_in);
    RCA_16b L2 (sum[31:16], c_in32, a[31:16], b[31:16], c_in16);
    RCA_16b L3 (sum[47:32], c_in48, a[47:32], b[47:32], c_in32);
    RCA_16b L4 (sum[63:48], c_out, a[63:48], b[63:48], c_in48);

endmodule
