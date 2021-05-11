`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/16 18:45:27
// Design Name: 
// Module Name: reg_tb
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


module reg_tb();

    reg clk;
	reg rst;
	reg S2_WriteEnable;
	reg [4:0] S2_WriteSelect;
	reg [31:0] ALUres;
	//Outputs
	
	
	wire [4:0] S3_WriteSelect;
	wire S3_WriteEnable;
	wire [31:0] ALUOut;

	// Instantiate the Unit Under Test (UUT)
	S3_Register s3(
	.clk(clk),
	.rst(rst),
	.ALUres(ALUres),
	.S2_WriteEnable(S2_WriteEnable),
	.S2_WriteSelect(S2_WriteSelect),
	.S3_WriteSelect(S3_WriteSelect),
	.S3_WriteEnable(S3_WriteEnable),
	.ALUOut(ALUOut)
    );
	
	always #5 assign clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		ALUres = 0;
		S2_WriteSelect = 0;
		S2_WriteEnable = 0;

		// Wait 10 ns for global reset to finish
		#10;
		rst = 0;
		ALUres = 0;
		S2_WriteSelect = 5;
		S2_WriteEnable = 1;
	end
      
endmodule
