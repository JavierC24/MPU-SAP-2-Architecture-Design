module MDR(		input [7:0]iMem,
						input [7:0]iwBus,
						input iClk,				//Syncs MDR with D Flip Flop
						input iLmdr,			//Chooses where to load data from (Either WBus or RAM/Memory) | On when MDR receives data
						input iRm,				//0 if Read RAM; 1 if Write RAM
						input iEnBus,
						input iEnableUN,
						output [7:0] oQ,
						output [7:0]oMem,
						output tri [15:0]owBus
						);

//Wire Assign
wire [7:0]Data;
//wire[7:0] oQ;
//wire MemEnable = iRm;							// parang di na magagamit??
//wire BusEnable = !iRm;			// ayusin kasi lagi siyang naglload sa bus (sa T3), pwede kaya alisin yung !iEnableUN ditong part?
//wire BusEnableHigh = !iRm & iEnableUN;

assign oMem = oQ & iRm;

//Mux - Data Assignment
assign Data[7:0] = !iRm? iMem[7:0]:iwBus[7:0];

//D Flip Flop Call
mD_FF_EDGE Buffer_0(.in_D(Data[0]),.clk(iClk),.reset(iLmdr),.out_Q(oQ[0]));
mD_FF_EDGE Buffer_1(.in_D(Data[1]),.clk(iClk),.reset(iLmdr),.out_Q(oQ[1]));
mD_FF_EDGE Buffer_2(.in_D(Data[2]),.clk(iClk),.reset(iLmdr),.out_Q(oQ[2]));
mD_FF_EDGE Buffer_3(.in_D(Data[3]),.clk(iClk),.reset(iLmdr),.out_Q(oQ[3]));
mD_FF_EDGE Buffer_4(.in_D(Data[4]),.clk(iClk),.reset(iLmdr),.out_Q(oQ[4]));
mD_FF_EDGE Buffer_5(.in_D(Data[5]),.clk(iClk),.reset(iLmdr),.out_Q(oQ[5]));
mD_FF_EDGE Buffer_6(.in_D(Data[6]),.clk(iClk),.reset(iLmdr),.out_Q(oQ[6]));
mD_FF_EDGE Buffer_7(.in_D(Data[7]),.clk(iClk),.reset(iLmdr),.out_Q(oQ[7]));

//Tristate Buffer for Memory Output
//bufif1(oMem[0], oQ[0], MemEnable);
//bufif1(oMem[1], oQ[1], MemEnable);
//bufif1(oMem[2], oQ[2], MemEnable);
//bufif1(oMem[3], oQ[3], MemEnable);
//bufif1(oMem[4], oQ[4], MemEnable);
//bufif1(oMem[5], oQ[5], MemEnable);
//bufif1(oMem[6], oQ[6], MemEnable);
//bufif1(oMem[7], oQ[7], MemEnable);

//Tristate Buffer for Bus Output
bufif1(owBus[0], oQ[0], iEnBus && !iRm);
bufif1(owBus[1], oQ[1], iEnBus && !iRm);
bufif1(owBus[2], oQ[2], iEnBus && !iRm);
bufif1(owBus[3], oQ[3], iEnBus && !iRm);
bufif1(owBus[4], oQ[4], iEnBus && !iRm);
bufif1(owBus[5], oQ[5], iEnBus && !iRm);
bufif1(owBus[6], oQ[6], iEnBus && !iRm);
bufif1(owBus[7], oQ[7], iEnBus && !iRm);

//Tristate Buffer for Bus Output Higher Nibble
bufif1(owBus[8], oQ[0], iEnableUN && !iRm);
bufif1(owBus[9], oQ[1], iEnableUN && !iRm);
bufif1(owBus[10], oQ[2], iEnableUN && !iRm);
bufif1(owBus[11], oQ[3], iEnableUN && !iRm);
bufif1(owBus[12], oQ[4], iEnableUN && !iRm);
bufif1(owBus[13], oQ[5], iEnableUN && !iRm);
bufif1(owBus[14], oQ[6], iEnableUN && !iRm);
bufif1(owBus[15], oQ[7], iEnableUN && !iRm);

endmodule
