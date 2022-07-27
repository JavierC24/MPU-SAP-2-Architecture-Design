module mFlipFlop_JK_Negedge_NegRst (iClk, iReset, iJ, iK, oQ, oQBar, iEnable, iLoad);

input iClk, iJ, iK, iReset, iEnable, iLoad;
output reg oQ, oQBar;

always@(negedge iClk or negedge iReset or posedge iEnable)
	if (!iReset)
		begin
		oQ <= 1'b0;
		end
	else if (iEnable)
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

