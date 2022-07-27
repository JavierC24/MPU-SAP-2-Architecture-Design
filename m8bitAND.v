module m8bitAND(input[7:0] iA,
						input[7:0] iB,
						output[7:0] oAND);

						
assign oAND[7:0] = iA[7:0] & iB[7:0];

endmodule
