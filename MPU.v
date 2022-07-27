module MPU(input [7:0] iData,
				input iClk,
				input iRst,
				output [15:0] oPC,						//output for Program Counter
				output [7:0] oBReg,						//output for B Register
				output [7:0] oCReg,						//output for C Register
				output [7:0] oTMPReg,					//output for TMP Register
				output [7:0] oMDR,						//output for MDR
				output [15:0] oMARout,						//output for MAR
				output [7:0] oMemory,					//output for Memory
				output [7:0] oAccumulator,				//output for Accumulator
				output [7:0] oInstructionReg,			//output for Instruction Register
				output [15:0] oWbus,						//output for WBUS
				output [7:0] oOutPort,						//output for Output Port
				output [15:0] oHexReg,						//output for Hex Register
				output oSignFlagout,							//output for Sign Flag
				output oZeroFlagout,							//output for Zero Flag
				output oHalt,
				output oClk,
				output [17:0] oTstate, 
				output oEF, oEH, oEL, oCp, oLp, oRST, oEb, oLb, oEc, oLc, oEtmp, oLtmp, oEa, oLa,
				output oEAdd, oESub, oEAND, oEOR, oEXOR, oEINC, oEDEC, oERAL, oERAR,
				output oLm, iRW, iEmem, iLmem, oRm, oEnableUN, oEnBus, oLmdr,
				output oEi, oLo, oLir, oReset, oEHex, oSelect);

assign oWbus = tWbus;
assign oPC = nPC;
assign oBReg = nBReg;
assign oCReg = nCReg;
assign oTMPReg = nTMP;
assign oMARout = nMAR;
assign oMemory = nMemOut;
assign oMDR = nMDR;
assign oAccumulator = nAcc;
assign oInstructionReg = nIR;
assign oHexReg = nHex;
assign oZeroFlagout = nZeroFlag;
assign oSignFlagout = nSignFlag;

assign nClk = iClk & ~oHalt;
assign oClk = nClk;

//Control signals output
assign oEF = nEF; 
assign oEH = nEH; 
assign oEL = nEL; 
assign oCp = nCp; 
assign oLp = nLp; 
assign oRST = nRST;
assign oEb = nEb; 
assign oLb = nLb; 
assign oEc = nEc; 
assign oLc = nLc; 
assign oEtmp = nEtmp; 
assign oLtmp = nLtmp; 
assign oEa = nEa; 
assign oLa = nLa;
assign oEAdd = nEAdd; 
assign oESub = nESub; 
assign oEAND = nEAND; 
assign oEOR = nEOR; 
assign oEXOR = nEXOR; 
assign oEINC = nEINC; 
assign oEDEC = nEDEC; 
assign oERAL = nERAL; 
assign oERAR = nERAR;
assign oLm = nLm; 
assign iRW = nRW; 
assign iEmem = nEmem; 
assign iLmem = nLmem; 
assign oRm = nRm; 
assign oEnableUN = nEnableUN; 
assign oEnBus = nEnBus;
assign oLmdr = nLmdr; 
assign oEi = nEi; 
assign oLo = nLo; 
assign oLir = nLir; 
assign oReset = nReset; 
assign oEHex = nEHex; 
assign oSelect = nSelect;
				
//Bus line
tri [15:0] tWbus;

//Control signals
wire nEF, nEH, nEL, nCp, nLp, nRST, nEb, nLb, nEc, nLc, nEtmp, nLtmp, nEa, nLa;
wire nEAdd, nESub, nEAND, nEOR, nEXOR, nEINC, nEDEC, nERAL, nERAR;
wire nLm, nRW, nEmem, nLmem, nRm, nEnableUN, nEnBus, nLmdr;
wire nEi, nLo, nLir, nReset, nEHex, nSelect;

//Nodes
wire [7:0] nBReg, nCReg, nTMP, nMemOut, nMDR, nAcc, nIR, nMemIn;
wire [15:0] nHex, nPC, nMAR, nPCtobus, nbustoPC, iMAR, nHextoMAR, nBustoMAR, nPCtoMAR;

//Program Counter
//assign nPCtobus = (nEF||nEH||nEL) && nPC;
//assign nbustoPC = nLp && tWbus;

//Input for MAR
//assign nHextoMAR = nEHex && nHex;
//assign nPCtoMAR = nPC && nEF;
//assign nBustoMAR = tWbus && ((nEF && nLp)||(nEtmp || nEnableUN));
//assign iMAR = (nHextoMAR || nPCtoMAR);

//Input Port
mInPort InPort(.iData(iData), .iEnable(nEi), .oData(tWbus));

//Program Counter
mProgramCounter ProgramCounter(.iIncrement(nCp), .iLoad(nLp), .eFull(nEF), .eHigh(nEH), .eLow(nEL), .iClk(~nClk), .iReset(iRst),
										  .iInput(tWbus), .oProgramCounter(nPC), .tWbus(tWbus));

//Hex Register
mHexRegister HexReg(.iSelect(nSelect), .iEn(nEHex), .Data(nHex), .oMAR(tWbus));//change to tWbus

//MAR
mMar MAR(.iData(tWbus), .iClk(nClk), .iLoad(nLm), .oData(nMAR)); 

//Memory
mMemory Memory(.iAddress(nMAR), .iRW(nRW), .iEmem(nEmem), .iLmem(nLmem), .iMDR(nMemOut), .oMDR(nMemIn)); 

//MDR
MDR MDR(.iMem(nMemOut), .iwBus(tWbus), .iClk(nClk), .iLmdr(nLmdr), .iRm(nRm), .iEnableUN(nEnableUN), .iEnBus(nEnBus), .oQ(nMDR), .oMem(nMemIn), .owBus(tWbus)); 

//B Register
BRegister BReg(.iData(tWbus), .iClk(nClk), .iLoad(nLb), .iEn(nEb), .oData(nBReg), .wBus(tWbus));

//C Register
CRegister CReg(.iData(tWbus), .iClk(nClk), .iLoad(nLc), .iEn(nEc), .oData(nCReg), .wBus(tWbus));

//TMP Register
TMPRegister  TMPReg(.iData(tWbus), .iClk(nClk), .iLoad(nLtmp), .iEn(nEtmp), .oALU(nTMP), .wBus(tWbus));

//Accumulator
mAccumulator Acc (.iotData(tWbus), .iClk(nClk), .iEnable(nEa), .iLoad(nLa), .oData(nAcc));

//ALU
mALU ALU(.iA(nAcc), .iB(nTMP), .iClock(nClk), .Add(nEAdd), .Sub(nESub), .AND(nEAND), .OR(nEOR), .XOR(nEXOR), .Inc(nEINC), .Dec(nEDEC), 
			.RotateLeft(nERAL), .RotateRight(nERAR), .oALU(tWbus), .oZeroFlag(nZeroFlag), .oSignFlag(nSignFlag));


//Instruction Register
mInstructionRegister IR(.iData(tWbus), .iClk(nClk), .iLoad(nLir), .oInstruction(nIR));


//Controller Sequencer
mControllerSequencer mCON(.iCON(nIR), .iClk(nClk), .iReset(~iRst), .iZeroFlagin(nZeroFlag),
									.oEF(nEF), .oEH(nEH), .oEL(nEL), .oCp(nCp), .oLp(nLp), .oRST(nRST), .oEb(nEb), .oLb(nLb), 
									.oEc(nEc), .oLc(nLc), .oEtmp(nEtmp), .oLtmp(nLtmp), .oEa(nEa), .oLa(nLa),
									.oEAdd(nEAdd), .oESub(nESub), .oEAND(nEAND), .oEOR(nEOR), .oEXOR(nEXOR), .oEINC(nEINC), .oEDEC(nEDEC), 
									.oERAL(nERAL), .oERAR(nERAR), .oLm(nLm), .iRW(nRW), .iEmem(nEmem), .iLmem(nLmem), .oRm(nRm), 
									.oEnableUN(nEnableUN), .oEnBus(nEnBus), .oLmdr(nLmdr), .oEi(nEi), .oLo(nLo), .oLir(nLir), .oReset(nReset), 
									.oEHex(nEHex), .oSelect(nSelect), .oTstate(oTstate), .oHalt(oHalt));
									
//Output Port
mOutPort OutPort(.iData(tWbus), .iClk(nClk), .iLoad(nLo), .oData(oOutPort));

endmodule


