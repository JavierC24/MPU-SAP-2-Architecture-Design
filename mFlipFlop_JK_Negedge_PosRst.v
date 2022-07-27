module mFlipFlop_JK_Negedge_PosRst (input iClk, 
												input iReset, 
												input iJ, 
												input iK, 
												output reg oQ, 
												output reg oQb);

always@(negedge iClk or posedge iReset)
	if (iReset == 1)
		begin
		oQ <= 1'b0;
		oQb <= 1'b1;
		end
	else 
			if (!iJ && !iK)
				begin
				oQ <= oQ;
				oQb <= oQb;
				end
			else if (!iJ && iK)
				begin
				oQ <= 1'b0;
				oQb <= 1'b1;
				end
			else if (iJ && !iK)
				begin
				oQ <= 1'b1;
				oQb <= 1'b0;
				end
			else
				begin
				oQ <= ~oQ;
				oQb <= ~oQb;
				end
		
		
endmodule
