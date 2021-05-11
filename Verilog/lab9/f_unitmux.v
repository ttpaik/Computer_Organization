`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/04 17:03:32
// Design Name: 
// Module Name: f_unitmux
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


module f_unitmux(forA, forB, ex_mem_rd, mem_wb_rd, id_ex_rs, id_ex_rt, ex_mem_regwrite, ex_mem_memwrite, mem_wb_regwrite);
    input ex_mem_regwrite, mem_wb_regwrite,ex_mem_memwrite;
    input [4:0] ex_mem_rd,mem_wb_rd,id_ex_rs,id_ex_rt;
    output [1:0] forA,forB;
    
    assign forA = (ex_mem_regwrite&&(ex_mem_rd == id_ex_rs))?2'b10:
    (mem_wb_regwrite&&(mem_wb_rd == id_ex_rs))?2'b01:
    2'b00;
    assign forB = ((ex_mem_memwrite||ex_mem_regwrite)&&(ex_mem_rd == id_ex_rt))?2'b10:
    (mem_wb_regwrite&&(mem_wb_rd == id_ex_rt))?2'b01:
    2'b00;  
    
endmodule
