`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/10 02:55:17
// Design Name: 
// Module Name: mux
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


module mux(result,add_sub, and_out, or_out,not_out, mov_out, opcode);
parameter width = 32;
output reg [width-1:0] result;
input [width-1:0] add_sub, and_out, or_out, not_out, mov_out;
input [2:0] opcode;

always @(*)
   begin
          case (opcode)
              3'b000: result <= mov_out; 
              3'b001: result <= not_out; 
              3'b010: ;
              3'b011: result <= and_out; 
              3'b100: result <= or_out; 
              3'b101: result <= add_sub; 
              3'b110: result <= add_sub; 
              3'b111: ;
              default: result = 0;
          endcase
end
endmodule
