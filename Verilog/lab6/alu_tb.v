`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/16 19:00:28
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
parameter width = 32; 
wire [width-1:0] result;
reg [width-1:0] a,b;
reg [2:0]ALUop; 

ALU alu1(.result(result), 
.a(a), 
.b(b), 
.ALUop(ALUop)
);


 
initial begin
#0
a = 3;
b = 2;
ALUop = 3'b000;    //not

#30
a = 3;
b = 2;
ALUop = 3'b001;    //move

#30
a = 3;
b = 2;
ALUop = 3'b011;   //or

#30
a = 3;
b = 2;
ALUop = 3'b100;   //and

#30
a = 3;
b = 2;
ALUop = 3'b101;    //sum

#30
a = 3;
b = 2;
ALUop = 3'b110;   //diff

#30
a = 2;
b = 3;
ALUop = 3'b111;  //slt


end

endmodule
