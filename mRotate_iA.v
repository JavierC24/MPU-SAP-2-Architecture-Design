module mRotate_iA ( 	input [7:0] iA,
							input iRotateLeft,		//if 1 = RAL; 0 = RAR
							output reg [7:0] oQ
							);

always @ (iRotateLeft)
	begin
	if ((iRotateLeft == 1'b1))
		begin
		oQ <= iA << 1;
		oQ[0] <= iA[7];
		end
	else 
		begin
		oQ <= iA >> 1;
		oQ[7] <= iA[0];
		end
	end
	
	
endmodule
