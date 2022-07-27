module mHexRegister(	input iSelect, //1 for FFFF and 0 for FFFE
			input iEn,
			output [15:0] Data, 
			output tri[15:0]oMAR	);

assign Data[15:0] = iSelect? 16'b1111111111111111:16'b1111111111111110;

bufif1(oMAR[0], Data[0],iEn);
bufif1(oMAR[1], Data[1],iEn);
bufif1(oMAR[2], Data[2],iEn);
bufif1(oMAR[3], Data[3],iEn);
bufif1(oMAR[4], Data[4],iEn);
bufif1(oMAR[5], Data[5],iEn);
bufif1(oMAR[6], Data[6],iEn);
bufif1(oMAR[7], Data[7],iEn);
bufif1(oMAR[8], Data[8],iEn);
bufif1(oMAR[9], Data[9],iEn);
bufif1(oMAR[10], Data[10],iEn);
bufif1(oMAR[11], Data[11],iEn);
bufif1(oMAR[12], Data[12],iEn);
bufif1(oMAR[13], Data[13],iEn);
bufif1(oMAR[14], Data[14],iEn);
bufif1(oMAR[15], Data[15],iEn);

endmodule
