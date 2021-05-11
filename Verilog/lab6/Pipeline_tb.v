`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:34:40 10/16/2015
// Design Name:   Pipeline
// Module Name:   C:/Users/Ethan/Desktop/Pre_Lab6/Pre_Lab6/Pipeline_tb.v
// Project Name:  Pre_Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk), 
		.rst(rst), 
		.InstrIn(InstrIn), 
		.final_result(Out)
	);

	// Define clk
	always #5 assign clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		InstrIn = 0;

		#0;		
		InstrIn = 32'b011101_00001_00001_0000000000001010;
		#30
		InstrIn = 32'b011011_00010_00010_0000000000000010;
		#30
		InstrIn= 32'b010101_00011_00001_00010_00000000000;
		#30
		InstrIn= 32'b010110_00100_00001_00010_00000000000;
	end
      
endmodule

