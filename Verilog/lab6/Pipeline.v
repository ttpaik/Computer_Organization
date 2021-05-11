`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:01 10/16/2015 
// Design Name: 
// Module Name:    Pipeline 
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
module Pipeline(
	input clk,
	input rst,
	input [31:0] InstrIn,
	output [31:0] final_result
   );


	// The naming format for wire: Source_Destination_portname
	wire [4:0] S1_Reg_ReadSelect1;
	wire [4:0] S1_Reg_ReadSelect2;
	wire [4:0] S1_S2_WriteSelect;
	wire S1_S2_WriteEnable;
	wire [31:0] Reg_S2_ReadData1;
	wire [31:0] Reg_S2_ReadData2;
	wire [4:0] S2_Reg_WriteSelect,S3_WriteSelect;
	wire S2_Reg_WriteEnable,S3_WriteEnable;
	
	// Wires for increment
	wire [31:0] R2, R3;
	
	//New wires
	wire [15:0] IMM,IMM2;
	wire DATASRC, DATASRC2;
	wire [2:0] ALUOP, ALUOP2;
	wire [31:0] mux_out;
	wire [31:0] ALU_out;

	S1_Register reg1(
		.clk(clk),
		.rst(rst),
		.InstrIn(InstrIn),
		.IMM(IMM),
	    .DataSrc(DATASRC),
	    .ALUop(ALUOP),
		.S1_ReadSelect1(S1_Reg_ReadSelect1),
		.S1_ReadSelect2(S1_Reg_ReadSelect2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable)
   );


	nbit_register_file regmid(
		.write_data(final_result),								
		.read_data_1(Reg_S2_ReadData1),
		.read_data_2(Reg_S2_ReadData2),
		.read_sel_1(S1_Reg_ReadSelect1),
		.read_sel_2(S1_Reg_ReadSelect2),
		.write_address(S3_WriteSelect),
		.RegWrite(S3_WriteEnable),
		.clk(clk)
	);
		
	
	S2_Register reg2(
		.clk(clk),
		.rst(rst),
		.IMM(IMM),
	    .DataSrc(DATASRC),
	    .ALUop(ALUOP),
		.Reg_ReadData1(Reg_S2_ReadData1),
		.Reg_ReadData2(Reg_S2_ReadData2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.S2_ReadData1(R2),
		.S2_ReadData2(R3),
		.S2_WriteSelect(S2_Reg_WriteSelect),
		.S2_WriteEnable(S2_Reg_WriteEnable),
		.S2_IMM(IMM2),
	    .S2_DataSrc(DATASRC2),
	    .S2_ALUop(ALUOP2)
   );
   
   
   mux mux1(
   .read2(R3),
   .IMM(IMM2),
   .DataSrc2(DATASRC2),
   .R3(mux_out)
   );
   
   
   ALU alu1(
   .result(ALU_out),
   .a(R2),
   .b(mux_out),
   .ALUop(ALUOP2)
   );
   
   
   S3_Register reg3(
    .clk(clk),
	.rst(rst),
	.ALUres(ALU_out),
	.S2_WriteSelect(S2_Reg_WriteSelect),
	.S2_WriteEnable(S2_Reg_WriteEnable),
	.S3_WriteSelect(S3_WriteSelect),
	.S3_WriteEnable(S3_WriteEnable),
	.ALUOut(final_result)
   );


endmodule

