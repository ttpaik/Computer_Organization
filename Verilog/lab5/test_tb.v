`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/10 05:55:11
// Design Name: 
// Module Name: test_tb
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


module test_tb();
parameter size = 32;
	// Inputs
	reg [size-1:0] a;
	reg [size-1:0] b;
	reg [2:0] select;
	reg clk;

	// Outputs
	wire c_out;
	wire [size-1:0] result;
	wire c_out_verify;
	wire [size-1:0]result_verify;
	wire error_flag;
	wire overflow;
	wire zero;
	
	// Instantiate the Unit Under Test (UUT)
	top_mod #(size) top(
	.res_out(result),
    .overflow(overflow),
    .zero(zero),
    .carry_out(c_out),
    .a(a),
    .b(b),
    .opcode(select),
    .clk(clk));

	
	ALU_verification1 #(size) Verification (
		.c_out(c_out_verify), 
		.result(result_verify), 
		.a(a), 
		.b(b), 
		.select(select),
		.clk(clk)
	);
	
	// Assign Error_flag
	assign error_flag = (c_out != c_out_verify || result != result_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, select);
		end
		

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		select = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		//Move
		#50;
		a = 343455;
		b = 10;
		select = 0;
		
		//NOT
		#50;
		a = 7;
		b = 0;
		select = 1;
		
		//ADD
		#50;
		a = 32'b11111111111111111111111111111110;
		b = 1;
		select = 6;
		
		#50;
		a = 32'b11111111111111111111111111111111;
		b = 1;
		select = 6;
		
		#50;
		a = 78;
		b = 3432;
		select = 6;

		#50;
		a = -6;
		b = 5;
		select = 6;
		
		//SUB
		#50;
		a = 10;
		b = 10;
		select = 5;
		
		#50;
		a = 7;
		b = 10;
		select = 5;
		
		#50;
		a = 52;
		b = 3;
		select = 5;

		#50;
		a = 8003434;
		b = 452;
		select = 5;
		
		//OR
		#50;
		a = 3423;
		b = 1000;
		select = 4;
		
		//AND
		#50;
		a = 4463;
		b = 2122;
		select = 3;
	end
	
      always
	#5 clk = ~clk;
	
endmodule
