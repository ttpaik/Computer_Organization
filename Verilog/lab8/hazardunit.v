module hazardunit(IFIDWrite,PCWrite,HazardMux,IFID_rs, IFID_rt, IDEX_rt, EXMEM_rd, Ins, regload, regstore, mem);

	output IFIDWrite, PCWrite, HazardMux;
	input [4:0] IDEX_rt,IFID_rs,IFID_rt, EXMEM_rd;
	input mem, regload, regstore;
    input [31:0] Ins;


        assign HazardMux = ((mem||regload||regstore)&&
		(IDEX_rt == IFID_rs || 
		IDEX_rt == IFID_rt || 
		(EXMEM_rd == IFID_rt && IDEX_rt != IFID_rt) || 
		(EXMEM_rd == IFID_rs && IDEX_rt != IFID_rs)))?1:0;  
		
		assign IFIDWrite = ((mem || regload || regstore)&&
		(IDEX_rt == IFID_rs || 
		IDEX_rt == IFID_rt ||  
		(EXMEM_rd == IFID_rt && IDEX_rt != IFID_rt) || 
		(EXMEM_rd == IFID_rs && IDEX_rt != IFID_rs)))?0:1;                // (EXMEM_rd == IFID_rt && IDEX_rt != IFID_rt) || (EXMEM_rd == IFID_rs && IDEX_rt != IFID_rs)
		
		assign PCWrite = ((mem|| regload || regstore)&&
		(IDEX_rt == IFID_rs || 
		IDEX_rt == IFID_rt  || 
		(EXMEM_rd == IFID_rt && IDEX_rt != IFID_rt) || 
		(EXMEM_rd == IFID_rs && IDEX_rt != IFID_rs)))?0:1;                    //    EXMEM_rd == IFID_rt || EXMEM_rd == IFID_rs 
		
endmodule





//module hazardunit(IFIDWrite,PCWrite,HazardMux, IFID_rs, IFID_rt, IDEX_rd, EXMEM_rd, Ins, mem, mem2);
//   output reg   IFIDWrite, PCWrite, HazardMux;
//   input [31:0] Ins;
//   input [4:0] EXMEM_rd, IDEX_rd, IFID_rs, IFID_rt;
//   wire [5:0]opcode;
//   input mem, mem2;
//   wire [4:0]IFID_rt, IFID_rs;
//   assign opcode = Ins[31:26];
////   assign IFID_rs = IFID_ins[25:21];
////   assign IFID_rt = IFID_ins[20:16];
   
////   wire [5:0] opcode2; 
////   assign opcode2 = IDEX_ins[31:26];
////   assign IDEX_rd = (opcode2 == 6'b0)? IDEX_ins[20:16]:IDEX_ins[15:11];

//always@(mem2) begin
//    if (mem == 1) begin
//        if ((IDEX_rd == IFID_rs || IDEX_rd == IFID_rt)) begin
//            IFIDWrite = 0;
//            PCWrite = 0;
//            HazardMux = 1;
        
//        end else if ((IDEX_rd != IFID_rs  && EXMEM_rd == IFID_rs)) begin
//            IFIDWrite = 0;
//            PCWrite = 0;
//            HazardMux = 1;    
        
//        end else if ((IDEX_rd != IFID_rt  && EXMEM_rd == IFID_rt)) begin
//            IFIDWrite = 0;
//            PCWrite = 0;
//            HazardMux = 1;    
         
//        end else begin
//            IFIDWrite = 1;
//            PCWrite = 1;
//            HazardMux = 0; 
//        end                       
//    end
    
//    else begin
//        if ((IDEX_rd == IFID_rs)) begin
//            IFIDWrite = 0;
//            PCWrite = 0;
//            HazardMux = 1;
        
//        end else if ((IDEX_rd != IFID_rs  && EXMEM_rd == IFID_rs)) begin
//            IFIDWrite = 0;
//            PCWrite = 0;
//            HazardMux = 1;      
         
//        end else begin
//            IFIDWrite = 1;
//            PCWrite = 1;
//            HazardMux = 0;  
//        end    
//    end  
//end        
//endmodule