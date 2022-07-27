module m8bitOR(input[7:0] iA,
						input[7:0] iB,
						output[7:0] oOR);
						
assign oOR[7:0] = iA[7:0] | iB[7:0];


endmodule
