module mInPort(	input[7:0] iData,
							input iEnable, //controls if Input Port will release values to the bus
							output tri [7:0] oData
							);

bufif1(oData[0], iData[0], iEnable);
bufif1(oData[1], iData[1], iEnable);
bufif1(oData[2], iData[2], iEnable);
bufif1(oData[3], iData[3], iEnable);
bufif1(oData[4], iData[4], iEnable);
bufif1(oData[5], iData[5], iEnable);
bufif1(oData[6], iData[6], iEnable);
bufif1(oData[7], iData[7], iEnable);

endmodule
