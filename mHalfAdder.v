module mHalfAdder(input iA,
						input iB,
						output oSum,
						output oCarry);
						
assign oSum = iA^iB;
assign oCarry = iA&iB;

endmodule