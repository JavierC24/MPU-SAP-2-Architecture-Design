module mIncDecA(input[7:0] iA,
					input Inc, 			//if 1 = Inc; 0 = Dec
					output reg [7:0] oIncDec);
					
always@(Inc)
	if (Inc)
		oIncDec <= iA + 1;
	else
		oIncDec <= iA - 1;

endmodule
		