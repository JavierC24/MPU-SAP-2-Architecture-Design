module mDFF_posedgeclk(input [7:0] iD, 			//from ALU
								input iClock,
								input iReset,
								input iEnable,
								output reg oQ,
								output reg oQn);
						
always @(posedge iClock)
begin
	if (iReset == 1'b1)
		begin
			oQ <= 1'b0;
			oQn <= 1'b1;
		end		
	else
		if (iEnable == 1'b1)
		begin
			oQ <= iD;
			oQn <= ~iD;
		end
end

endmodule
