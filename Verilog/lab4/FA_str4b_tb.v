`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/02 09:07:48
// Design Name: 
// Module Name: FA_str4b_tb
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

module FA_str4b_tb();
    // Inputs
	reg [63:0]a;
	reg [63:0]b;
	reg c_in;
	reg clk;

	// Outputs
	wire c_out;
	wire [63:0]sum;
	wire c_out_verify;
	wire [63:0]sum_verify;
	wire error_flag;


	// Instantiate the Unit Under Test (UUT)
	RCA_64b RCA (
		.sum(sum), 
		.c_out(c_out),
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Verification module
	Verification4bit Ver (
	    .sum(sum_verify), 
		.c_out(c_out_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Assign Error_flag
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
		
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;

        a=0; b=0; c_in= 0;
        #100
        a = 9223372036854775806; b=3; c_in=0;  //9223372036854775806 is max number for 64 bits / Force overall carryout
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
