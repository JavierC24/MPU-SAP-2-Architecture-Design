module mAccumulator (inout tri[7:0] iotData, 
							input iClk,             
							input iLoad,            
							input iEnable,          
							output [7:0] oData      
							);


	mFlipFlop_D_PosEdgeClk_Enable Accumulator_0(.iD(iotData[0]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[0]));
	mFlipFlop_D_PosEdgeClk_Enable Accumulator_1(.iD(iotData[1]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[1]));
	mFlipFlop_D_PosEdgeClk_Enable Accumulator_2(.iD(iotData[2]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[2]));
	mFlipFlop_D_PosEdgeClk_Enable Accumulator_3(.iD(iotData[3]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[3]));
	mFlipFlop_D_PosEdgeClk_Enable Accumulator_4(.iD(iotData[4]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[4]));
	mFlipFlop_D_PosEdgeClk_Enable Accumulator_5(.iD(iotData[5]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[5]));
	mFlipFlop_D_PosEdgeClk_Enable Accumulator_6(.iD(iotData[6]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[6]));
	mFlipFlop_D_PosEdgeClk_Enable Accumulator_7(.iD(iotData[7]), .iClk(iClk), .iEnable(iLoad), .oQ(oData[7]));
	
	bufif1(iotData[0], oData[0], iEnable);
	bufif1(iotData[1], oData[1], iEnable);
	bufif1(iotData[2], oData[2], iEnable);
	bufif1(iotData[3], oData[3], iEnable);
	bufif1(iotData[4], oData[4], iEnable);
	bufif1(iotData[5], oData[5], iEnable);
	bufif1(iotData[6], oData[6], iEnable);
	bufif1(iotData[7], oData[7], iEnable);

endmodule
