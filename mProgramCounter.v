module mProgramCounter (input iIncrement,
								input iLoad,
								input eFull,
								input eHigh,
								input eLow,
								input iClk,
								input iReset,
								input [15:0] iInput,
								output[15:0] oProgramCounter,
								output tri [15:0] tWbus
								);
								
assign oProgramCounter = noPC;
wire [15:0] noPC;
wire [14:0] niPC;

assign niPC[0] = iIncrement&&noPC[0];
assign niPC[1] = niPC[0]&&noPC[1];
assign niPC[2] = niPC[1]&&noPC[2];
assign niPC[3] = niPC[2]&&noPC[3];
assign niPC[4] = niPC[3]&&noPC[4];
assign niPC[5] = niPC[4]&&noPC[5];
assign niPC[6] = niPC[5]&&noPC[6];
assign niPC[7] = niPC[6]&&noPC[7];
assign niPC[8] = niPC[7]&&noPC[8];
assign niPC[9] = niPC[8]&&noPC[9];
assign niPC[10] = niPC[9]&&noPC[10];
assign niPC[11] = niPC[10]&&noPC[11];
assign niPC[12] = niPC[11]&&noPC[12];
assign niPC[13] = niPC[12]&&noPC[13];
assign niPC[14] = niPC[13]&&noPC[14];

mFlipFlop_JK_Negedge_Rst Programcounter_0 (.iJ(iIncrement), .iK(iIncrement), .iClk(iClk), .iLoad(iInput[0]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[0]));
mFlipFlop_JK_Negedge_Rst Programcounter_1 (.iJ(niPC[0]), .iK(niPC[0]), .iClk(iClk), .iLoad(iInput[1]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[1]));
mFlipFlop_JK_Negedge_Rst Programcounter_2 (.iJ(niPC[1]), .iK(niPC[1]), .iClk(iClk), .iLoad(iInput[2]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[2]));
mFlipFlop_JK_Negedge_Rst Programcounter_3 (.iJ(niPC[2]), .iK(niPC[2]), .iClk(iClk), .iLoad(iInput[3]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[3]));
mFlipFlop_JK_Negedge_Rst Programcounter_4 (.iJ(niPC[3]), .iK(niPC[3]), .iClk(iClk), .iLoad(iInput[4]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[4]));
mFlipFlop_JK_Negedge_Rst Programcounter_5 (.iJ(niPC[4]), .iK(niPC[4]), .iClk(iClk), .iLoad(iInput[5]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[5]));
mFlipFlop_JK_Negedge_Rst Programcounter_6 (.iJ(niPC[5]), .iK(niPC[5]), .iClk(iClk), .iLoad(iInput[6]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[6]));
mFlipFlop_JK_Negedge_Rst Programcounter_7 (.iJ(niPC[6]), .iK(niPC[6]), .iClk(iClk), .iLoad(iInput[7]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[7]));
mFlipFlop_JK_Negedge_Rst Programcounter_8 (.iJ(niPC[7]), .iK(niPC[7]), .iClk(iClk), .iLoad(iInput[8]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[8]));
mFlipFlop_JK_Negedge_Rst Programcounter_9 (.iJ(niPC[8]), .iK(niPC[8]), .iClk(iClk), .iLoad(iInput[9]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[9]));
mFlipFlop_JK_Negedge_Rst Programcounter_10 (.iJ(niPC[9]), .iK(niPC[9]), .iClk(iClk), .iLoad(iInput[10]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[10]));
mFlipFlop_JK_Negedge_Rst Programcounter_11 (.iJ(niPC[10]), .iK(niPC[10]), .iClk(iClk), .iLoad(iInput[11]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[11]));
mFlipFlop_JK_Negedge_Rst Programcounter_12 (.iJ(niPC[11]), .iK(niPC[11]), .iClk(iClk), .iLoad(iInput[12]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[12]));
mFlipFlop_JK_Negedge_Rst Programcounter_13 (.iJ(niPC[12]), .iK(niPC[12]), .iClk(iClk), .iLoad(iInput[13]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[13]));
mFlipFlop_JK_Negedge_Rst Programcounter_14 (.iJ(niPC[13]), .iK(niPC[13]), .iClk(iClk), .iLoad(iInput[14]), .iReset(iReset), .iEnable(iLoad),.oQ(noPC[14]));
mFlipFlop_JK_Negedge_Rst Programcounter_15 (.iJ(niPC[14]), .iK(niPC[14]), .iClk(iClk), .iLoad(iInput[15]),.iReset(iReset), .iEnable(iLoad),.oQ(noPC[15]));

//16 Bits to BUS{ALL}
bufif1(tWbus[0], noPC[0], eFull);
bufif1(tWbus[1], noPC[1], eFull);
bufif1(tWbus[2], noPC[2], eFull);
bufif1(tWbus[3], noPC[3], eFull);
bufif1(tWbus[4], noPC[4], eFull);
bufif1(tWbus[5], noPC[5], eFull);
bufif1(tWbus[6], noPC[6], eFull);
bufif1(tWbus[7], noPC[7], eFull);
bufif1(tWbus[8], noPC[8], eFull);
bufif1(tWbus[9], noPC[9], eFull);
bufif1(tWbus[10], noPC[10], eFull);
bufif1(tWbus[11], noPC[11], eFull);
bufif1(tWbus[12], noPC[12], eFull);
bufif1(tWbus[13], noPC[13], eFull);
bufif1(tWbus[14], noPC[14], eFull);
bufif1(tWbus[15], noPC[15], eFull);

//8 Bits to BUS {LOW}
bufif1(tWbus[0], noPC[0], eLow);
bufif1(tWbus[1], noPC[1], eLow);
bufif1(tWbus[2], noPC[2], eLow);
bufif1(tWbus[3], noPC[3], eLow);
bufif1(tWbus[4], noPC[4], eLow);
bufif1(tWbus[5], noPC[5], eLow);
bufif1(tWbus[6], noPC[6], eLow);
bufif1(tWbus[7], noPC[7], eLow);

//8 Bits to BUS {HIGH}
bufif1(tWbus[0], noPC[8], eHigh);
bufif1(tWbus[1], noPC[9], eHigh);
bufif1(tWbus[2], noPC[10], eHigh);
bufif1(tWbus[3], noPC[11], eHigh);
bufif1(tWbus[4], noPC[12], eHigh);
bufif1(tWbus[5], noPC[13], eHigh);
bufif1(tWbus[6], noPC[14], eHigh);
bufif1(tWbus[7], noPC[15], eHigh);


endmodule
