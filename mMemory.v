module mMemory (	input [15:0] iAddress, // from MAR
						input iRW, // read = 0 (mem to MDR), write = 1 (MDR to mem)
						input iEmem, // enable memory
						input iLmem, // load memory
						output reg [7:0] iMDR, // to MDR
						input [7:0] oMDR // from MDR
					 );
					 
	reg [7:0] aMemory [0:255];

	initial
		$readmemh("C:/Users/User/Documents/program.txt", aMemory);
	
	always @(iAddress or iRW or iEmem or iLmem)
	begin
		if (iAddress >= 16'h0000 && iAddress <= 16'h007F)
			begin
				if (!iRW && iEmem) // read
					iMDR <= aMemory[iAddress];
				else	
					iMDR <= 8'h00;
			end	
		else if (iAddress >= 16'h0080 && iAddress <= 16'h00FF)
			begin
				if (!iRW && iEmem) // read
					iMDR <= aMemory[iAddress];
				else if (iRW && iLmem) // write
					iMDR <= oMDR;
				else	
					iMDR <= 8'h00;
			end
		else
			begin
				iMDR <= 8'h00;
			end
	end
	
endmodule