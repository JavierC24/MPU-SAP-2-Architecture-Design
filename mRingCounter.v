module mRingCounter (input iClk, 
							input iReset,  
							output [17:0] oRingCounter, 
							output [17:0] oRingCounterBar);
							
							
mFlipFlop_JK_Negedge_PosRst RingCounter0(.iJ(oRingCounterBar[17]), .iK(oRingCounter[17]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[0]), .oQb(oRingCounterBar[0]));
mFlipFlop_JK_Negedge_PosRst RingCounter1(.iJ(oRingCounterBar[0]), .iK(oRingCounter[0]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[1]), .oQb(oRingCounterBar[1]));
mFlipFlop_JK_Negedge_PosRst RingCounter2(.iJ(oRingCounter[1]), .iK(oRingCounterBar[1]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[2]), .oQb(oRingCounterBar[2]));
mFlipFlop_JK_Negedge_PosRst RingCounter3(.iJ(oRingCounter[2]), .iK(oRingCounterBar[2]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[3]), .oQb(oRingCounterBar[3]));
mFlipFlop_JK_Negedge_PosRst RingCounter4(.iJ(oRingCounter[3]), .iK(oRingCounterBar[3]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[4]), .oQb(oRingCounterBar[4]));
mFlipFlop_JK_Negedge_PosRst RingCounter5(.iJ(oRingCounter[4]), .iK(oRingCounterBar[4]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[5]), .oQb(oRingCounterBar[5]));
mFlipFlop_JK_Negedge_PosRst RingCounter6(.iJ(oRingCounter[5]), .iK(oRingCounterBar[5]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[6]), .oQb(oRingCounterBar[6]));
mFlipFlop_JK_Negedge_PosRst RingCounter7(.iJ(oRingCounter[6]), .iK(oRingCounterBar[6]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[7]), .oQb(oRingCounterBar[7]));
mFlipFlop_JK_Negedge_PosRst RingCounter8(.iJ(oRingCounter[7]), .iK(oRingCounterBar[7]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[8]), .oQb(oRingCounterBar[8]));
mFlipFlop_JK_Negedge_PosRst RingCounter9(.iJ(oRingCounter[8]), .iK(oRingCounterBar[8]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[9]), .oQb(oRingCounterBar[9]));
mFlipFlop_JK_Negedge_PosRst RingCounter10(.iJ(oRingCounter[9]), .iK(oRingCounterBar[9]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[10]), .oQb(oRingCounterBar[10]));
mFlipFlop_JK_Negedge_PosRst RingCounter11(.iJ(oRingCounter[10]), .iK(oRingCounterBar[10]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[11]), .oQb(oRingCounterBar[11]));
mFlipFlop_JK_Negedge_PosRst RingCounter12(.iJ(oRingCounter[11]), .iK(oRingCounterBar[11]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[12]), .oQb(oRingCounterBar[12]));
mFlipFlop_JK_Negedge_PosRst RingCounter13(.iJ(oRingCounter[12]), .iK(oRingCounterBar[12]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[13]), .oQb(oRingCounterBar[13]));
mFlipFlop_JK_Negedge_PosRst RingCounter14(.iJ(oRingCounter[13]), .iK(oRingCounterBar[13]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[14]), .oQb(oRingCounterBar[14]));
mFlipFlop_JK_Negedge_PosRst RingCounter15(.iJ(oRingCounter[14]), .iK(oRingCounterBar[14]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[15]), .oQb(oRingCounterBar[15]));
mFlipFlop_JK_Negedge_PosRst RingCounter16(.iJ(oRingCounter[15]), .iK(oRingCounterBar[15]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[16]), .oQb(oRingCounterBar[16]));
mFlipFlop_JK_Negedge_PosRst RingCounter17(.iJ(oRingCounter[16]), .iK(oRingCounterBar[16]), .iClk(iClk), .iReset(iReset), .oQ(oRingCounter[17]), .oQb(oRingCounterBar[17]));

endmodule
