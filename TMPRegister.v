module TMPRegister (input[7:0] iData, //Wbus
							input iClk,             
							input iLoad,            
							input iEn,          
							output [7:0] oALU,   //OUT
							output tri [7:0] wBus
							);

//D Flip Flop Call
D_FF_EDGE Buffer_0(.in_D(iData[0]), .clk(iClk), .reset(iLoad), .out_Q(oALU[0]));
D_FF_EDGE Buffer_1(.in_D(iData[1]), .clk(iClk), .reset(iLoad), .out_Q(oALU[1]));
D_FF_EDGE Buffer_2(.in_D(iData[2]), .clk(iClk), .reset(iLoad), .out_Q(oALU[2]));
D_FF_EDGE Buffer_3(.in_D(iData[3]), .clk(iClk), .reset(iLoad), .out_Q(oALU[3]));
D_FF_EDGE Buffer_4(.in_D(iData[4]), .clk(iClk), .reset(iLoad), .out_Q(oALU[4]));
D_FF_EDGE Buffer_5(.in_D(iData[5]), .clk(iClk), .reset(iLoad), .out_Q(oALU[5]));
D_FF_EDGE Buffer_6(.in_D(iData[6]), .clk(iClk), .reset(iLoad), .out_Q(oALU[6]));
D_FF_EDGE Buffer_7(.in_D(iData[7]), .clk(iClk), .reset(iLoad), .out_Q(oALU[7]));

//Tristate Buffer
bufif1(wBus[0], oALU[0],iEn);
bufif1(wBus[1], oALU[1],iEn);
bufif1(wBus[2], oALU[2],iEn);
bufif1(wBus[3], oALU[3],iEn);
bufif1(wBus[4], oALU[4],iEn);
bufif1(wBus[5], oALU[5],iEn);
bufif1(wBus[6], oALU[6],iEn);
bufif1(wBus[7], oALU[7],iEn);

endmodule