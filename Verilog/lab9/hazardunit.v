module hazardunit(IFIDWrite,PCWrite,HazardMux,IDEX_rt,IFID_rs,IFID_rt,mem);

	output 	IFIDWrite, PCWrite, HazardMux;
	input [4:0] IDEX_rt,IFID_rs,IFID_rt;
	input mem;

        assign HazardMux = (mem&&(IDEX_rt == IFID_rs || IDEX_rt == IFID_rt))?1:0;
		assign IFIDWrite = (mem&&(IDEX_rt == IFID_rs || IDEX_rt == IFID_rt))?0:1;
		assign PCWrite = (mem&&(IDEX_rt == IFID_rs || IDEX_rt == IFID_rt))?0:1;
		

endmodule
