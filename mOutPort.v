module mOutPort (input [7:0] iData,
			input iClk,
			input iLoad,
			output [7:0] oData);

//D Flip Flop Call
mFlipFlop_D_PosEdgeClk_EnableO OutPort_0(.iD(iData[0]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[0]));
mFlipFlop_D_PosEdgeClk_EnableO OutPort_1(.iD(iData[1]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[1]));
mFlipFlop_D_PosEdgeClk_EnableO OutPort_2(.iD(iData[2]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[2]));
mFlipFlop_D_PosEdgeClk_EnableO OutPort_3(.iD(iData[3]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[3]));
mFlipFlop_D_PosEdgeClk_EnableO OutPort_4(.iD(iData[4]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[4]));
mFlipFlop_D_PosEdgeClk_EnableO OutPort_5(.iD(iData[5]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[5]));
mFlipFlop_D_PosEdgeClk_EnableO OutPort_6(.iD(iData[6]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[6]));
mFlipFlop_D_PosEdgeClk_EnableO OutPort_7(.iD(iData[7]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[7]));

endmodule
