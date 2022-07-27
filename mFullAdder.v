module mFullAdder(input iA,
								input iB,
								input iC,
								output oSum,
								output oCarry);
							
wire n1, n2, n3;

mHalfAdder HalfAdder_0 (.iA(iB), .iB(iC), .oSum(n1), .oCarry(n2));
mHalfAdder HalfAdder_1 (.iA(iA), .iB(n1), .oSum(oSum), .oCarry(n3));
or OR(oCarry, n2, n3);

endmodule