module mFlipFlop_JK_Negedge_Rst (iClk, iReset, iJ, iK, oQ, oQBar, iEnable, iLoad);

input iClk, iJ, iK, iReset, iEnable, iLoad;
output reg oQ, oQBar;

initial
	begin
	oQ <= 1'b0;
	oQBar <= 1'b1;
	end

always@(negedge iClk)
	if (!iReset)
		if (iEnable)
		begin
		oQ <= iLoad;
		end
	else
	begin
		if (!iJ && !iK)
			begin
			oQ <= oQ;
			end
		else if (!iJ && iK)
			begin
			oQ <= 1'b0;
			end
		else if (iJ && !iK)
			begin
			oQ <= 1'b1;
			end
		else
			begin
			oQ <= ~oQ;
			end
	end
endmodule
