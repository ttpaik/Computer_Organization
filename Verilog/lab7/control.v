`timescale 1ns / 1ns

module control(
      input [5:0] instruction,
      output reg [1:0] ALUOp,
      output reg MemRead,
      output reg MemtoReg,
      output reg RegDst,
      output reg Branch, 
      output reg ALUSrc,
      output reg MemWrite,
      output reg RegWrite
      );


always @(*) begin
      if (instruction == 6'b00_0000) begin            //RType
      ALUOp = 2'b00;
      MemRead = 1'b0;
      MemtoReg = 1'b0;
      RegDst = 1'b1;
        Branch = 1'b0;      
       ALUSrc = 1'b0;
      MemWrite = 1'b0;
      RegWrite = 1'b1;
      end 
      
      else if (instruction == 6'b11_0000) begin  //IType ADDI
      ALUOp = 2'b00;
      MemRead = 1'b0;
      MemtoReg = 1'b0; 
      RegDst = 1'b1;
        Branch = 1'b0;      
       ALUSrc = 1'b1;
      MemWrite = 1'b0;
      RegWrite = 1'b1;
      end 
      
      else if (instruction == 6'b11_0001) begin  //IType SUBI
      ALUOp = 2'b00;
      MemRead = 1'b0;
      MemtoReg = 1'b0; 
      RegDst = 1'b1;
        Branch = 1'b0;      
       ALUSrc = 1'b1;
      MemWrite = 1'b0;
      RegWrite = 1'b1;
      end 
      
      else if (instruction == 6'b11_0010) begin  //IType ANDI
      ALUOp = 2'b00;
      MemRead = 1'b0;
      MemtoReg = 1'b0; 
      RegDst = 1'b1;
        Branch = 1'b0;      
       ALUSrc = 1'b1;
      MemWrite = 1'b0;
      RegWrite = 1'b1;
      end
       
      else if (instruction == 6'b11_0011) begin  //IType ORI
      ALUOp = 2'b00;
      MemRead = 1'b0;
      MemtoReg = 1'b0; 
      RegDst = 1'b1;
        Branch = 1'b0;      
       ALUSrc = 1'b1;
      MemWrite = 1'b0;
      RegWrite = 1'b1;
      end 
      
      else if (instruction == 6'b11_0100) begin  //IType SLTI
      ALUOp = 2'b00;
      MemRead = 1'b0;
      MemtoReg = 1'b0; 
      RegDst = 1'b1;
        Branch = 1'b0;      
       ALUSrc = 1'b1;
      MemWrite = 1'b0;
      RegWrite = 1'b1;
      end 
      
      else if (instruction == 6'b01_0000) begin   //J
      ALUOp = 2'b11;
      MemRead = 1'b0;
      MemtoReg = 1'b0;
      RegDst = 1'b0;
        Branch = 1'b0;      
       ALUSrc = 1'b1;
      MemWrite = 1'b0;
      RegWrite = 1'b0;
      end
      
      else if (instruction == 6'b01_0001) begin   //JR
      ALUOp = 2'b11;
      MemRead = 1'b0;
      MemtoReg = 1'b0;
      RegDst = 1'b0;
        Branch = 1'b0;      
       ALUSrc = 1'b0;
      MemWrite = 1'b0;
      RegWrite = 1'b0;
      end
      
      
      else if (instruction == 6'b00_0100) begin   // beq
      ALUOp = 2'b01;
      MemRead = 1'b0;
      MemtoReg = 1'b0;
      RegDst = 1'b0;
        Branch = 1'b1;      
       ALUSrc = 1'b0;
      MemWrite = 1'b0;
      RegWrite = 1'b0;
      
      
      end else if (instruction == 6'b00_0101) begin   // bne
      ALUOp = 2'b01;
      MemRead = 1'b0;
      MemtoReg = 1'b0;
      RegDst = 1'b0;
        Branch = 1'b1;      
       ALUSrc = 1'b0;
      MemWrite = 1'b0;
      RegWrite = 1'b0;
      
      
      end else if (instruction == 6'b10_1011) begin   // sw
      ALUOp = 2'b10;
      MemRead = 1'b0;
      MemtoReg = 1'b0;
      RegDst = 1'b0;
      Branch = 1'b0;      
      ALUSrc = 1'b1;
      MemWrite = 1'b1;
      RegWrite = 1'b0;
      end else if (instruction == 6'b10_0011) begin   // lw
      ALUOp = 2'b10;
      MemRead = 1'b1;
      MemtoReg = 1'b1;
      RegDst = 1'b0;
      Branch = 1'b0;      
      ALUSrc = 1'b1;
      MemWrite = 1'b0;
      RegWrite = 1'b1;
      
      end else if (instruction == 6'b10_1111) begin   // lui
      ALUOp = 2'b10;
      MemRead = 1'b0;
      MemtoReg = 1'b0;
      RegDst = 1'b0;
      Branch = 1'b0;      
      ALUSrc = 1'b1;
      MemWrite = 1'b1;
      RegWrite = 1'b0;
      
      end else begin
      ALUOp = 2'b00;
      MemRead = 1'b0;
      MemtoReg = 1'b0;
      RegDst = 1'b0;
      Branch = 1'b0;      
      ALUSrc = 1'b0;
      MemWrite = 1'b0;
      RegWrite = 1'b0;
      end
   
   
end
endmodule