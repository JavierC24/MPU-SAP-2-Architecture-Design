module mInstructionDecoder (	input [7:0] iData,
										output oADD_B,
										output oADD_C,
										output oANA_B,
										output oANA_C,
										output oCALL_add,
										output oDCR_A,
										output oHLT,
										output oIN_byte,
										output oINR_A,
										output oJMP_add,
										output oJZ_add,
										output oLDA_add,
										output oMOV_AB,
										output oMOV_AC,
										output oMOV_BA,
										output oMOV_CA,
										output oMVI_A_byte,
										output oNOP,
										output oORA_B,
										output oORA_C,
										output oOUT_byte,
										output oRAL,
										output oRAR,
										output oRET,
										output oSTA_add,
										output oSUB_B,
										output oSUB_C,
										output oXRA_B,
										output oXRA_C
										);
										
assign oADD_B = (iData == 8'b10000000) ? 1:0;
assign oADD_C = (iData == 8'b10000001) ? 1:0;
assign oANA_B = (iData == 8'b10100000) ? 1:0;
assign oANA_C = (iData == 8'b10100001) ? 1:0;
assign oCALL_add = (iData == 8'b11001101) ? 1:0;
assign oDCR_A = (iData == 8'b00111101) ? 1:0;
assign oHLT = (iData == 8'b01110110) ? 1:0;
assign oIN_byte = (iData == 8'b11011011) ? 1:0;
assign oINR_A = (iData == 8'b00111100) ? 1:0;
assign oJMP_add = (iData == 8'b11000011) ? 1:0;
assign oJZ_add = (iData == 8'b11001010) ? 1:0;
assign oLDA_add = (iData == 8'b00111010) ? 1:0;
assign oMOV_AB = (iData == 8'b01111000) ? 1:0;
assign oMOV_AC = (iData == 8'b01111001) ? 1:0;
assign oMOV_BA = (iData == 8'b01000111) ? 1:0;
assign oMOV_CA = (iData == 8'b01001111) ? 1:0;
assign oMVI_A_byte = (iData == 8'b00111110) ? 1:0;
assign oNOP = (iData == 8'b00000000) ? 1:0;
assign oORA_B = (iData == 8'b10110000) ? 1:0;
assign oORA_C = (iData == 8'b10110001) ? 1:0;
assign oOUT_byte = (iData == 8'b11010011) ? 1:0;
assign oRAL = (iData == 8'b00010111) ? 1:0;
assign oRAR = (iData == 8'b00011111) ? 1:0;
assign oRET = (iData == 8'b11001001) ? 1:0;
assign oSTA_add = (iData == 8'b00110010) ? 1:0;
assign oSUB_B = (iData == 8'b10010000) ? 1:0;
assign oSUB_C = (iData == 8'b10010001) ? 1:0;
assign oXRA_B = (iData == 8'b10101000) ? 1:0;
assign oXRA_C = (iData == 8'b10101001) ? 1:0;

endmodule