`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/15 22:02:19
// Design Name: 
// Module Name: S3_Register
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


module S3_Register(input clk,
	   input rst,
	   input [31:0] ALUres,
	   input S2_WriteEnable,
	   input [4:0] S2_WriteSelect,
	   output reg [4:0] S3_WriteSelect,
	   output reg S3_WriteEnable,
	   output reg [31:0] ALUOut
       );
    
always@(posedge clk)
		begin
		if (rst)
			begin
			S3_WriteSelect <= 5'd0;
			S3_WriteEnable <= 1'b0;
			ALUOut <= 32'd0;
			end
			
		else
			begin
			S3_WriteSelect <= S2_WriteSelect;
			S3_WriteEnable <= S2_WriteEnable;
			ALUOut <= ALUres;
			end
		end
		
endmodule
