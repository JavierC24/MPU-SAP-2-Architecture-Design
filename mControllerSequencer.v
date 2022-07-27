module mControllerSequencer (iCON, iClk, iReset, iZeroFlagin, 
										oEF, oEH, oEL, oCp, oLp, oRST, oEb, oLb, oEc, oLc, oEtmp, oLtmp, oEa, oLa,
										oEAdd, oESub, oEAND, oEOR, oEXOR, oEINC, oEDEC, oERAL, oERAR,
										oLm, iRW, iEmem, iLmem, oRm, oEnableUN, oEnBus, oLmdr, 
										oEi, oLo, oLir, oReset, oEHex, oSelect,
										oTstate, oHalt);

input [7:0] iCON;
input iClk, iReset, iZeroFlagin;
output [17:0] oTstate;
output oHalt;
output oEF, oEH, oEL, oCp, oLp, oRST, oEb, oLb, oEc, oLc, oEtmp, oLtmp, oEa, oLa;
output oEAdd, oESub, oEAND, oEOR, oEXOR, oEINC, oEDEC, oERAL, oERAR;
output oLm, iRW, iEmem, iLmem, oRm, oEnableUN, oEnBus, oLmdr;
output oEi, oLo, oLir, oReset, oEHex, oSelect;



wire [17:0] nT;
wire [17:0] nTbar;					//for variable Tstates
wire nRingCounterReset;
wire [17:0] nTstate;
wire nADD_B, nADD_C, nANA_B, nANA_C, nCALL_add, nDCR_A, nHLT;
wire nIN_byte, nINR_A, nJMP_add, nJZ_add, nLDA_add, nMOV_AB, nMOV_AC, nMOV_BA, nMOV_CA;
wire nMVI_A, nNOP, nORA_B, nORA_C, nOUT_byte;
wire nRAL, nRAR, nRET, nSTA_add, nSUB_B, nSUB_C, nXRA_B, nXRA_C;

assign oTstate = {nT[17:1], nTbar[0]};
assign oHalt = nHLT;
assign nRingCounterReset = ~iReset | oReset;			//previously (~iReset & ~nNOP);

mRingCounter RingCounter(.iClk(iClk), .iReset(nRingCounterReset), .oRingCounter(nT), .oRingCounterBar(nTbar));
mInstructionDecoder InstructionDecoder(.iData(iCON), .oADD_B(nADD_B), .oADD_C(nADD_C), .oANA_B(nANA_B), .oANA_C(nANA_C), 
													.oCALL_add(nCALL_add), .oDCR_A(nDCR_A), .oHLT(nHLT), .oIN_byte(nIN_byte), .oINR_A(nINR_A), 
													.oJMP_add(nJMP_add), .oJZ_add(nJZ_add), .oLDA_add(nLDA_add), .oMOV_AB(nMOV_AB), .oMOV_AC(nMOV_AC), 
													.oMOV_BA(nMOV_BA), .oMOV_CA(nMOV_CA), .oMVI_A_byte(nMVI_A), .oNOP(nNOP), .oORA_B(nORA_B), .oORA_C(nORA_C), 
													.oOUT_byte(nOUT_byte), .oRAL(nRAL), .oRAR(nRAR), .oRET(nRET), .oSTA_add(nSTA_add), .oSUB_B(nSUB_B), 
													.oSUB_C(nSUB_C), .oXRA_B(nXRA_B), .oXRA_C(nXRA_C));
mControlMatrix ControlMatrix(.iTstate({nT[17:1], nTbar[0]}), .iZeroFlag(iZeroFlagin),
										.iADD_B(nADD_B), .iADD_C(nADD_C), .iANA_B(nANA_B), .iANA_C(nANA_C), .iCALL_add(nCALL_add), .iDCR_A(nDCR_A), 
										.iHLT(nHLT), .iIN_byte(nIN_byte), .iINR_A(nINR_A), .iJMP_add(nJMP_add), .iJZ_add(nJZ_add), .iLDA_add(nLDA_add), 
										.iMOV_AB(nMOV_AB), .iMOV_AC(nMOV_AC), .iMOV_BA(nMOV_BA), .iMOV_CA(nMOV_CA), .iMVI_A(nMVI_A), .iNOP(nNOP), 
										.iORA_B(nORA_B), .iORA_C(nORA_C), .iOUT_byte(nOUT_byte), .iRAL(nRAL), .iRAR(nRAR), .iRET(nRET), .iSTA_add(nSTA_add), 
										.iSUB_B(nSUB_B), .iSUB_C(nSUB_C), .iXRA_B(nXRA_B), .iXRA_C(nXRA_C),
										.oEF(oEF), .oEH(oEH), .oEL(oEL), .oCp(oCp), .oLp(oLp), .oRST(oRST), .oEb(oEb), .oLb(oLb), .oEc(oEc), .oLc(oLc), 
										.oEtmp(oEtmp), .oLtmp(oLtmp), .oEa(oEa), .oLa(oLa), .oEAdd(oEAdd), .oESub(oESub), .oEAND(oEAND), 
										.oEOR(oEOR), .oEXOR(oEXOR), .oEINC(oEINC), .oEDEC(oEDEC), .oERAL(oERAL), .oERAR(oERAR),
										.oLm(oLm), .iRW(iRW), .iEmem(iEmem), .iLmem(iLmem), .oRm(oRm), .oEnableUN(oEnableUN), .oEnBus(oEnBus), .oLmdr(oLmdr), 
										.oEi(oEi), .oLo(oLo), .oLir(oLir), .oReset(oReset), .oEHex(oEHex), .oSelect(oSelect));

endmodule
