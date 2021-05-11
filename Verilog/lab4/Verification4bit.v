//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:51:17 09/26/2015 
// Design Name: 
// Module Name:    Verification_1bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Verification4bit(sum, c_out, a, b, c_in);
    input c_in; 
	input [63:0] a, b; 
	output [63:0] sum;
	output c_out;
	assign {c_out, sum} = a + b + c_in;
endmodule