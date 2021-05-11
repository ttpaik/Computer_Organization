`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/15 21:33:24
// Design Name: 
// Module Name: mux
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


module mux(R3, read2, IMM, DataSrc2);
output reg [31:0] R3;
input [31:0] read2;
input [15:0] IMM;
input DataSrc2;

 
always@(*)
    begin
        case (DataSrc2)
        1'b1: R3 <= IMM;
        1'b0: R3 <= read2;
        default: R3 = 0;
    endcase
end

endmodule
