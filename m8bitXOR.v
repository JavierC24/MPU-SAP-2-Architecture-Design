module m8bitXOR(input[7:0] iA,
						input[7:0] iB,
						output[7:0] oXOR);
						
assign oXOR[7:0] = iA[7:0] ^ iB[7:0];

endmodule
