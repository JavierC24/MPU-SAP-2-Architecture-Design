module mControlMatrix(input [17:0] iTstate, iZeroFlag,
							input iADD_B, iADD_C, iANA_B, iANA_C, iCALL_add, iDCR_A, iHLT,
							input iIN_byte, iINR_A, iJMP_add, iJZ_add, iLDA_add, iMOV_AB, iMOV_AC, iMOV_BA, iMOV_CA,
							input iMVI_A, iNOP, iORA_B, iORA_C, iOUT_byte, 
							input iRAL, iRAR, iRET, iSTA_add, iSUB_B, iSUB_C, iXRA_B, iXRA_C,
							output oEF, oEH, oEL, oCp, oLp, oRST, oEb, oLb, oEc, oLc, oEtmp, oLtmp, oEa, oLa,
							output oEAdd, oESub, oEAND, oEOR, oEXOR, oEINC, oEDEC, oERAL, oERAR,
							output oLm, iRW, iEmem, iLmem, oRm, oEnableUN, oEnBus, oLmdr, 
							output oEi, oLo, oLir, oReset, oEHex, oSelect);
							
//Program Counter
assign oEF = ((iTstate[0])||
					(iTstate[3]&&(iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iMVI_A||iSTA_add))||
					(iTstate[7]&&(iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iSTA_add))||
					(iTstate[9]&&(iCALL_add))||
					(iTstate[13]&&(iCALL_add))) ? 1:0;
assign oEH = (iTstate[4]&&(iCALL_add)) ? 1:0;
assign oEL = (iTstate[7]&&(iCALL_add)) ? 1:0;

assign oCp = ((iTstate[1])||	
					(iTstate[3]&&(iJZ_add&&!iZeroFlag)) ||
					(iTstate[4]&&(iJMP_add||(iJZ_add&&!iZeroFlag)||(iJZ_add&&iZeroFlag)||iLDA_add||iMVI_A))||
					(iTstate[5]&&(iSTA_add))||
					(iTstate[9]&&(iLDA_add||iRET||iSTA_add))||
					(iTstate[10]&&(iRET))||
					(iTstate[12]&&(iCALL_add))||
					(iTstate[15]&&(iCALL_add))) ? 1:0;
assign oLp = ((iTstate[0])||(iTstate[3]&&(iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iMVI_A||iSTA_add))||
(iTstate[4]&&(iCALL_add))||
(iTstate[5]&&(iRET))||
(iTstate[7]&&(iCALL_add||iJMP_add|||(iJZ_add&&iZeroFlag)||iLDA_add||iSTA_add))||
					(iTstate[8]&&(iRET))||
					(iTstate[9]&&(iCALL_add||iJMP_add||(iJZ_add&&iZeroFlag)))||(iTstate[13]&&(iCALL_add))||
					(iTstate[16]&&(iCALL_add))||
					(iTstate[17]&&(iCALL_add))) ? 1:0;

assign oRST = ((iTstate[5]&&(iJZ_add&&!iZeroFlag))||
					(iTstate[7]&&(iMVI_A))||
					(iTstate[10]&&(iJZ_add&&iZeroFlag)||iJMP_add)||
					(iTstate[11]&&(iRET))||
					(iTstate[13]&&(iLDA_add||iSTA_add))||
					(iTstate[17]&&(iCALL_add))) ? 1:0;

					
//B Register
assign oEb = (iTstate[3]&&(iADD_B||iANA_B||iMOV_AB||iORA_B||iSUB_B||iXRA_B)) ? 1:0;
assign oLb = (iTstate[3]&&(iMOV_BA)) ? 1:0;

//C Register
assign oEc = (iTstate[3]&&(iADD_C||iANA_C||iMOV_AC||iORA_C||iSUB_C||iXRA_C)) ? 1:0;
assign oLc = (iTstate[3]&&(iMOV_CA)) ? 1:0;

//TMP Register 
assign oEtmp = ((iTstate[9]&&(iJMP_add||(iJZ_add&&iZeroFlag)))||
					(iTstate[10]&&(iLDA_add||iSTA_add))||
					(iTstate[16]&&(iSTA_add||iCALL_add))) ? 1:0;
assign oLtmp = ((iTstate[3]&&(iADD_B||iADD_C||iANA_B||iANA_C||iORA_B||iORA_C||iSUB_B||iSUB_C||iXRA_B||iXRA_C))||
					(iTstate[6]&&(iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iSTA_add))||
					(iTstate[11]&&(iCALL_add))) ? 1:0;


//Accumulator
assign oEa = ((iTstate[3]&&(iMOV_BA||iMOV_CA||iOUT_byte))||
					(iTstate[11]&&(iSTA_add))) ? 1:0;
assign oLa = ((iTstate[3]&&(iDCR_A||iIN_byte||iINR_A||iMOV_AB||iMOV_AC||iRAL||iRAR))||
					(iTstate[4]&&(iADD_B||iADD_C||iANA_B||iANA_C||iORA_B||iORA_C||iSUB_B||iSUB_C||iXRA_B||iXRA_C))||
					(iTstate[6]&&(iMVI_A))||
					(iTstate[12]&&(iLDA_add))) ? 1:0;



//ALU
assign oEAdd = (iTstate[4]&&(iADD_B||iADD_C)) ? 1:0;
assign oESub = (iTstate[4]&&(iSUB_B||iSUB_C)) ? 1:0;
assign oEAND = (iTstate[4]&&(iANA_B||iANA_C)) ? 1:0;
assign oEOR = (iTstate[4]&&(iORA_B||iORA_C)) ? 1:0;
assign oEXOR = (iTstate[4]&&(iXRA_B||iXRA_C)) ? 1:0;
assign oEINC = (iTstate[3]&&(iINR_A)) ? 1:0;
assign oEDEC = (iTstate[3]&&(iDCR_A)) ? 1:0;
assign oERAL = (iTstate[3]&&(iRAL)) ? 1:0;
assign oERAR = (iTstate[3]&&(iRAR)) ? 1:0;



//MAR
assign oLm = ((iTstate[0])||
				 (iTstate[3]&&(iCALL_add||iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iMVI_A||iRET||iSTA_add))||
				 (iTstate[6]&&(iCALL_add||iRET))||
				 (iTstate[7]&&(iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iSTA_add))||
				 (iTstate[9]&&iCALL_add)||
				 (iTstate[10]&&(iLDA_add||iSTA_add))||
				 (iTstate[13]&&iCALL_add)) ? 1:0;

//Memory
assign iRW = ((iTstate[5]&&iCALL_add)||
		(iTstate[8]&&iCALL_add)||
		(iTstate[12]&&iSTA_add)) ? 1:0;

assign iEmem = ((iTstate[1])||
					(iTstate[4]&&(iRET||iSTA_add))||
					(iTstate[5]&&(iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iMVI_A))||
					(iTstate[7]&&iRET)||
					(iTstate[8]&&(iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iSTA_add))||
					(iTstate[10]&&iCALL_add)||
					(iTstate[11]&&iLDA_add)||
					(iTstate[14]&&iCALL_add)) ? 1:0;
assign iLmem = ((iTstate[5]&&iCALL_add)||
					(iTstate[8]&&iCALL_add)||
					(iTstate[12]&&iSTA_add)) ? 1:0;


//MDR
assign oRm = ((iTstate[5]&&(iCALL_add))||
				 (iTstate[8]&&(iCALL_add))||
				 (iTstate[12]&&(iSTA_add))) ? 1:0;
assign oLmdr = ((iTstate[1])||
					(iTstate[4]&&(iCALL_add||iRET||iSTA_add))||
					(iTstate[5]&&(iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iMVI_A))||
					(iTstate[7]&&(iCALL_add||iRET))||
					(iTstate[8]&&(iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iSTA_add))||
					(iTstate[10]&&iCALL_add)||
					(iTstate[11]&&(iLDA_add||iSTA_add))||
					(iTstate[14]&&iCALL_add)) ? 1:0;

assign oEnableUN = ((iTstate[5]&&(iRET))||
						 (iTstate[9]&&(iJMP_add||(iJZ_add&&iZeroFlag)))||
						 (iTstate[10]&&(iLDA_add||iSTA_add))||
						 (iTstate[17]&&(iCALL_add))) ? 1:0;
						 
assign oEnBus = ((iTstate[2])||
						(iTstate[6]&&(iMVI_A||iJMP_add||(iJZ_add&&iZeroFlag)||iLDA_add||iSTA_add))||
						(iTstate[8]&&(iRET))||
						(iTstate[11]&&(iCALL_add))||
						(iTstate[12]&&(iLDA_add))) ? 1:0;

//Input ports
assign oEi = (iTstate[3]&&(iIN_byte)) ? 1:0;

//Output ports
assign oLo = (iTstate[3]&&(iOUT_byte)) ? 1:0;

//Instruction Register
assign oLir = (iTstate[2]) ? 1:0;

//Ring Counter
assign oReset = ((iTstate[3]&&iNOP)||
					(iTstate[4]&&(iDCR_A||iIN_byte||iINR_A||iMOV_AB||iMOV_AC||iMOV_BA||iMOV_CA||iOUT_byte||iRAR||iRAL))||
					 (iTstate[5]&&(iADD_B||iADD_C||iANA_B||iANA_C||(iJZ_add&&!iZeroFlag)||iORA_B||iORA_C||iSUB_B||iSUB_C||iXRA_B||iXRA_C))||
					 (iTstate[7]&&(iMVI_A))||
					 (iTstate[10]&&(iJMP_add||(iJZ_add&&iZeroFlag)))||
					 (iTstate[11]&&(iRET))||
					 (iTstate[13]&&(iLDA_add||iSTA_add))||
					 (iTstate[17]&&(iCALL_add))) ? 1:0;
					 
 

//Hex Register
assign oEHex = ((iTstate[3]&&(iCALL_add||iRET))||	
				  (iTstate[6]&&(iCALL_add||iRET))) ? 1:0;
assign oSelect = (iTstate[3]&&(iCALL_add||iRET)) ? 1:0;


endmodule



