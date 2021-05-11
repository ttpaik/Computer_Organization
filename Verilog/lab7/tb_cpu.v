`timescale 1ns / 1ns


module tb_cpu;

	// Inputs
	reg rst;
	reg clk;
	reg initialize;
	reg [31:0] instruction_initialize_data;
	reg [31:0] instruction_initialize_address;
    wire  [31:0] write_data;    
	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.rst(rst), 
		.clk(clk), 
		.initialize(initialize), 
		.instruction_initialize_data(instruction_initialize_data), 
		.instruction_initialize_address(instruction_initialize_address),
		.write_data(write_data)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		initialize = 1;
		instruction_initialize_data = 0;
		instruction_initialize_address = 0;
		#100;

        


        // I - Type
      #20;
      instruction_initialize_address = 0;
      instruction_initialize_data = 32'b11_0000_00001_00001_00000_00000_00_0010;      // ADDI R1, 2(R1)  12
      
      #20;
      instruction_initialize_address = 4;
      instruction_initialize_data = 32'b11_0001_00110_00100_00000_00000_00_0010;      // SUBI R4, R6 - 2  58
      
      #20;
      instruction_initialize_address = 8;
      instruction_initialize_data = 32'b11_0010_00010_01001_00000_00000_00_1100;      // ANDI R9, 12(R2)  4
      #20;
      instruction_initialize_address = 12;
      instruction_initialize_data = 32'b11_0011_00010_01001_00000_00000_00_1100;      // ORI R9, 12(R2) 28

		#20;
		instruction_initialize_address = 16;
		instruction_initialize_data = 32'b11_0100_00001_00001_00000_00000_01_0001;      // SLTI R1, 17(R1) 1
		
		// R - Type
		#20	
        instruction_initialize_address = 20;
		instruction_initialize_data = 32'b000000_00001_00001_00001_00000_10_0000;      // ADD R1, R1, R1   20   //40
		#20;
		instruction_initialize_address = 24;
		instruction_initialize_data = 32'b000000_00100_00100_01000_00000_10_0010;      // SUB R8, R4, R4 0
		#20;
		instruction_initialize_address = 28;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_10_0100;      // AND R7, R5, R6 48
		#20;
		instruction_initialize_address = 32;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_10_0101;      // OR R7, R5, R6  62
		#20;
		instruction_initialize_address = 36;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_10_0111;      // SLT R6, R5, R7  1
		
		#20;
		instruction_initialize_address = 40;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_10_1000;      // NOT R7, R5, R6   -51
		#20;
		instruction_initialize_address = 44;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_10_0110;      // MOV R7, R5, R6   50
		
		// MEMORY
		#20;
		instruction_initialize_address = 48;
		instruction_initialize_data = 32'b101011_00000_01001_00000_00000_00_1100;      // SW R9, 12(R0)
		#20;
		instruction_initialize_address = 52;
		instruction_initialize_data = 32'b100011_00000_01100_00000_00000_00_1100;      // LW R12, 12(R0)
		
		#20;
		instruction_initialize_address = 56;
		instruction_initialize_data = 32'b10_1111_01001_01001_11111_11111_11_1111;   // LUI R9, -1
		
		
	    //JUMP
		
//		//JR
//        #20;
//        instruction_initialize_address = 60;
//        instruction_initialize_data = 32'b01_0001_00001_00001_00001_00000_00_0000;     // JR R1   0
		
//		//J
//		#20;
//		instruction_initialize_address = 60;
//		instruction_initialize_data = 32'b01_0000_00000_00000_00000_00000_00_0001;    //J 4
		
		//BRANCH
		
//		#20;	
//        instruction_initialize_address = 60;
//		instruction_initialize_data = 32'b00_0100_00001_00001_11111_11111_11_1000;      // BEQ R1, R1, -8
		
//	    #20;	
//        instruction_initialize_address = 60;
//		instruction_initialize_data = 32'b00_0101_00001_00011_11111_11111_11_1000;      // BNE R1, R3, -8	 

		#20
		initialize = 0;
		rst = 0;
		
	end
      
always
#5 clk = ~clk;
endmodule

