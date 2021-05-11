`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/03 19:55:36
// Design Name: 
// Module Name: CSA_64b_tb
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


module CSA_64b_tb;
//Inputs
reg [63:0] a,b;
reg c_in;
reg clk;

//Outputs
wire [63:0] sum;
wire c_out;
wire c_out_verify;
wire [63:0]sum_verify;
wire error_flag;

//Instantiate
CSA_64b uut(.sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));

//Verification
Verification4bit ver(.sum(sum_verify), .c_out(c_out_verify), .a(a), .b(b), .c_in(c_in));

//Error Flag  
    assign error_flag = (c_out != c_out_verify || sum != sum_verify);
    
//Verification Logic
    always@(posedge clk)
	   begin
	   if(error_flag)
		  $display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
	   end
	always #5 clk = ~clk;


initial begin

//Initialize Input
clk = 0;

a=0; b=0; c_in= 0;
#100
a = 9223372036854775806; b=3; c_in=0;  //9223372036854775806 is max number / Force overall carryout
#100 
a = 999999; b = 111111; c_in = 1; //Random Large (with Carry)
#100 
a = 999999; b = 111111; c_in = 0; //Random Large (without Carry)
#100 
a = 1; b = 2; c_in= 1; //Random Small (with Carry)
#100 
a = 3; b = 4; c_in = 0; //Random Small (without Carry)
#100
a = 3333; b = 5; c_in = 1;   //Any Random Combination
end
endmodule


