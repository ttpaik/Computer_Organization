`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/03 16:34:31
// Design Name: 
// Module Name: RCA_4b
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


module RCA_4b(sum, c_out, a, b, c_in);
    output [3:0] sum;
    output c_out;
    input [3:0] a, b;
    input c_in;
    wire  c_in2, c_in3, c_in4;
    
    FA_str M1 (sum[0], c_in2, a[0], b[0], c_in);
    FA_str M2 (sum[1], c_in3, a[1], b[1], c_in2);
    FA_str M3 (sum[2], c_in4, a[2], b[2], c_in3);
    FA_str M4 (sum[3], c_out, a[3], b[3], c_in4);

endmodule
