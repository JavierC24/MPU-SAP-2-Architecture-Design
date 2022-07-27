module mInstructionRegister(input [7:0] iData,
										input iClk,
										input iLoad,
										output [7:0] oInstruction);

mFlipFlop_D_PosEdgeClk_PosEdgeReset_Enable IR_0 (.iD(iData[0]), .iClk(iClk), .iEnable(iLoad), .oQ(oInstruction[0]));
mFlipFlop_D_PosEdgeClk_PosEdgeReset_Enable IR_1 (.iD(iData[1]), .iClk(iClk), .iEnable(iLoad), .oQ(oInstruction[1]));
mFlipFlop_D_PosEdgeClk_PosEdgeReset_Enable IR_2 (.iD(iData[2]), .iClk(iClk), .iEnable(iLoad), .oQ(oInstruction[2]));
mFlipFlop_D_PosEdgeClk_PosEdgeReset_Enable IR_3 (.iD(iData[3]), .iClk(iClk), .iEnable(iLoad), .oQ(oInstruction[3]));
mFlipFlop_D_PosEdgeClk_PosEdgeReset_Enable IR_4 (.iD(iData[4]), .iClk(iClk), .iEnable(iLoad), .oQ(oInstruction[4]));
mFlipFlop_D_PosEdgeClk_PosEdgeReset_Enable IR_5 (.iD(iData[5]), .iClk(iClk), .iEnable(iLoad), .oQ(oInstruction[5]));
mFlipFlop_D_PosEdgeClk_PosEdgeReset_Enable IR_6 (.iD(iData[6]), .iClk(iClk), .iEnable(iLoad), .oQ(oInstruction[6]));
mFlipFlop_D_PosEdgeClk_PosEdgeReset_Enable IR_7 (.iD(iData[7]), .iClk(iClk), .iEnable(iLoad), .oQ(oInstruction[7]));

endmodule
