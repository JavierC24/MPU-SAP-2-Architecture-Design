module mMar (input [15:0] iData,
			input iClk,
			input iLoad,
			output [15:0] oData);

//D Flip Flop Call
mFlipFlop_D_PosEdgeClk_Enable Mar_0(.iD(iData[0]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[0]));
mFlipFlop_D_PosEdgeClk_Enable Mar_1(.iD(iData[1]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[1]));
mFlipFlop_D_PosEdgeClk_Enable Mar_2(.iD(iData[2]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[2]));
mFlipFlop_D_PosEdgeClk_Enable Mar_3(.iD(iData[3]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[3]));
mFlipFlop_D_PosEdgeClk_Enable Mar_4(.iD(iData[4]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[4]));
mFlipFlop_D_PosEdgeClk_Enable Mar_5(.iD(iData[5]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[5]));
mFlipFlop_D_PosEdgeClk_Enable Mar_6(.iD(iData[6]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[6]));
mFlipFlop_D_PosEdgeClk_Enable Mar_7(.iD(iData[7]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[7]));
mFlipFlop_D_PosEdgeClk_Enable Mar_8(.iD(iData[8]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[8]));
mFlipFlop_D_PosEdgeClk_Enable Mar_9(.iD(iData[9]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[9]));
mFlipFlop_D_PosEdgeClk_Enable Mar_10(.iD(iData[10]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[10]));
mFlipFlop_D_PosEdgeClk_Enable Mar_11(.iD(iData[11]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[11]));
mFlipFlop_D_PosEdgeClk_Enable Mar_12(.iD(iData[12]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[12]));
mFlipFlop_D_PosEdgeClk_Enable Mar_13(.iD(iData[13]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[13]));
mFlipFlop_D_PosEdgeClk_Enable Mar_14(.iD(iData[14]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[14]));
mFlipFlop_D_PosEdgeClk_Enable Mar_15(.iD(iData[15]),.iClk(iClk),.iEnable(iLoad),.oQ(oData[15]));

endmodule
