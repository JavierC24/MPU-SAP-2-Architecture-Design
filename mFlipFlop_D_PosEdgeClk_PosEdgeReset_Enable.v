module mFlipFlop_D_PosEdgeClk_PosEdgeReset_Enable(input iD, 
																	input iClk,
																	input iEnable,															
																	output reg oQ);

always@(posedge iClk or negedge iEnable)
	if(iEnable == 0)
		oQ <= oQ;
	else if(iEnable == 1)
		begin
			if (iD == 1)
			oQ <= iD;
			else if (iD == 0)
			oQ <= iD;
		end
		
endmodule
