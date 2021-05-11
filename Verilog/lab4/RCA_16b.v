`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/03 16:40:28
// Design Name: 
// Module Name: RCA_16b
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


module RCA_16b(sum, c_out, a, b, c_in);

    output [15:0] sum;
    output c_out;
    input [15:0] a, b;
    input c_in;
    wire  c_in4, c_in8, c_in12;
    
    RCA_4b M1 (sum[3:0], c_in4, a[3:0], b[3:0], c_in);
    RCA_4b M2 (sum[7:4], c_in8, a[7:4], b[7:4], c_in4);
    RCA_4b M3 (sum[11:8], c_in12, a[11:8], b[11:8], c_in8);
    RCA_4b M4 (sum[15:12], c_out, a[15:12], b[15:12], c_in12);
endmodule
