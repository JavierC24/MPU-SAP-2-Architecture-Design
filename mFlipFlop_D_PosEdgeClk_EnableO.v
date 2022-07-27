module mFlipFlop_D_PosEdgeClk_EnableO (iClk, iEnable, iD, oQ);

input iClk, iD, iEnable;
output oQ;
reg oQ;

always@(posedge iClk)
	if(iEnable)
		if(!iD)
			oQ <= 1'b0;
		else
			oQ <= 1'b1;
	else
		oQ <= oQ;

endmodule
