module CRegister( 	input [7:0] iData,
							input iClk,
							input iLoad,
							input iEn,
							output [7:0] oData,
							output tri [7:0]wBus	);

//D Flip Flop Call
D_FF_EDGE Buffer_0(.in_D(iData[0]),.clk(iClk),.reset(iLoad),.out_Q(oData[0]));
D_FF_EDGE Buffer_1(.in_D(iData[1]),.clk(iClk),.reset(iLoad),.out_Q(oData[1]));
D_FF_EDGE Buffer_2(.in_D(iData[2]),.clk(iClk),.reset(iLoad),.out_Q(oData[2]));
D_FF_EDGE Buffer_3(.in_D(iData[3]),.clk(iClk),.reset(iLoad),.out_Q(oData[3]));
D_FF_EDGE Buffer_4(.in_D(iData[4]),.clk(iClk),.reset(iLoad),.out_Q(oData[4]));
D_FF_EDGE Buffer_5(.in_D(iData[5]),.clk(iClk),.reset(iLoad),.out_Q(oData[5]));
D_FF_EDGE Buffer_6(.in_D(iData[6]),.clk(iClk),.reset(iLoad),.out_Q(oData[6]));
D_FF_EDGE Buffer_7(.in_D(iData[7]),.clk(iClk),.reset(iLoad),.out_Q(oData[7]));

//Tristate Buffer
bufif1(wBus[0], oData[0],iEn);
bufif1(wBus[1], oData[1],iEn);
bufif1(wBus[2], oData[2],iEn);
bufif1(wBus[3], oData[3],iEn);
bufif1(wBus[4], oData[4],iEn);
bufif1(wBus[5], oData[5],iEn);
bufif1(wBus[6], oData[6],iEn);
bufif1(wBus[7], oData[7],iEn);

endmodule
