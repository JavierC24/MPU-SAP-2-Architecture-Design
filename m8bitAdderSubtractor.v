module m8bitAdderSubtractor(input[7:0] iA,
										input[7:0] iB,
										input iSub,		//if iSub = 0: ADD; iSub = 1: SUB
										output[7:0] oAddSub);
										
wire nCarry0, nCarry1, nCarry2, nCarry3, nCarry4, nCarry5, nCarry6, nCarry7;
wire nBinput0, nBinput1, nBinput2, nBinput3, nBinput4, nBinput5, nBinput6, nBinput7;
wire [7:0] nCarryout;
wire [7:0] nAddSub;

assign nBinput0 = iB[0]^iSub;
assign nBinput1 = iB[1]^iSub;
assign nBinput2 = iB[2]^iSub;
assign nBinput3 = iB[3]^iSub;
assign nBinput4 = iB[4]^iSub;
assign nBinput5 = iB[5]^iSub;
assign nBinput6 = iB[6]^iSub;
assign nBinput7 = iB[7]^iSub;
assign oCarry = nCarry7;

mFullAdder FullAdder_0 (.iA(iA[0]), .iB(nBinput0), .iC(iSub), .oSum(nAddSub[0]), .oCarry(nCarry0));
mFullAdder FullAdder_1 (.iA(iA[1]), .iB(nBinput1), .iC(nCarry0), .oSum(nAddSub[1]), .oCarry(nCarry1));
mFullAdder FullAdder_2 (.iA(iA[2]), .iB(nBinput2), .iC(nCarry1), .oSum(nAddSub[2]), .oCarry(nCarry2));
mFullAdder FullAdder_3 (.iA(iA[3]), .iB(nBinput3), .iC(nCarry2), .oSum(nAddSub[3]), .oCarry(nCarry3));
mFullAdder FullAdder_4 (.iA(iA[4]), .iB(nBinput4), .iC(nCarry3), .oSum(nAddSub[4]), .oCarry(nCarry4));
mFullAdder FullAdder_5 (.iA(iA[5]), .iB(nBinput5), .iC(nCarry4), .oSum(nAddSub[5]), .oCarry(nCarry5));
mFullAdder FullAdder_6 (.iA(iA[6]), .iB(nBinput6), .iC(nCarry5), .oSum(nAddSub[6]), .oCarry(nCarry6));
mFullAdder FullAdder_7 (.iA(iA[7]), .iB(nBinput7), .iC(nCarry6), .oSum(nAddSub[7]), .oCarry(nCarry7));

assign oAddSub [7:0] = nAddSub [7:0];

endmodule

		