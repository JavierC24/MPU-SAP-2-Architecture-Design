module mFlipFlop_D_PosEdgeClk_Enable (iClk, iEnable, iD, oQ, oQn);

input iClk, iD, iEnable;
output oQ, oQn;

reg oQ, oQn;

always@(posedge iClk)
	if(iEnable)
		if(!iD)
			begin
			oQ <= 1'b0;
			oQn <= 1'b1;
			end
		else
			begin
			oQ <= 1'b1;
			oQn <= 1'b0;
			end
		
	else
		begin
		oQ <= oQ;
		oQn <= oQn;
		end

endmodule
