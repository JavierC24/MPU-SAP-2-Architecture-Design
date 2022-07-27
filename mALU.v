module mALU(input[7:0] iA,
					input[7:0] iB,
					input iClock,
					
					//Control Signals for Operations:
					input Add,			//Adder
					input Sub,			//Subtracter
					input AND,			//AND operation
					input OR,			//OR operation
					input XOR,			//XOR operation

					//Control Signals for Increment/Decrement:
					input Inc,
					input Dec,
					
					//Control Signals for Rotate:
					input RotateLeft,	
					input RotateRight,
				
					//Output for ALU:
					output [7:0] oALU,
					output oZeroFlag,
					output oSignFlag
					);

//Wires:
wire [7:0] nAddSub;
wire [7:0] nAND;
wire [7:0] nOR;
wire [7:0] nXOR;
wire [7:0] nRotateA;
wire [7:0] nIncDecA;
wire [7:0] nSignSub;
wire [7:0] nSignDec;
wire [7:0] nSignFlag;

//ALU Operations:		
			
m8bitAdderSubtractor AdderSubtractor(.iA(iA), .iB(iB), .iSub(Sub), .oAddSub(nAddSub));

m8bitAND ANDGATE(.iA(iA), .iB(iB), .oAND(nAND));

m8bitOR ORGATE(.iA(iA), .iB(iB), .oOR(nOR));

m8bitXOR XORGATE(.iA(iA), .iB(iB), .oXOR(nXOR));

mIncDecA IncDec_A(.iA(iA), .Inc(Inc), .oIncDec(nIncDecA));

mRotate_iA Rotate_iA(.iA(iA), .iRotateLeft(RotateLeft), .oQ(nRotateA));

//Flags:

mDFF_posedgeclk ZeroFlag(.iD(oALU[7:0] == 8'b0), .iClock(iClock), .iReset(iReset), .iEnable(Add||Sub||AND||OR||XOR||Inc||Dec||RotateLeft||RotateRight), .oQ(oZeroFlag));

assign nSignSub = Sub && oALU[7] && (iB > iA);
assign nSignDec = Dec && (iA == 8'b0);
assign nSignFlag = nSignSub || nSignDec;

mDFF_posedgeclk SignFlag(.iD(nSignFlag), .iClock(iClock), .iReset(iReset), .iEnable(1), .oQ(oSignFlag));

//Outputs:
bufif1 (oALU [0], nAddSub[0], Add^Sub);
bufif1 (oALU [1], nAddSub[1], Add^Sub);
bufif1 (oALU [2], nAddSub[2], Add^Sub);
bufif1 (oALU [3], nAddSub[3], Add^Sub);
bufif1 (oALU [4], nAddSub[4], Add^Sub);
bufif1 (oALU [5], nAddSub[5], Add^Sub);
bufif1 (oALU [6], nAddSub[6], Add^Sub);
bufif1 (oALU [7], nAddSub[7], Add^Sub);

bufif1 (oALU [0], nAND [0], AND);
bufif1 (oALU [1], nAND [1], AND);
bufif1 (oALU [2], nAND [2], AND);
bufif1 (oALU [3], nAND [3], AND);
bufif1 (oALU [4], nAND [4], AND);
bufif1 (oALU [5], nAND [5], AND);
bufif1 (oALU [6], nAND [6], AND);
bufif1 (oALU [7], nAND [7], AND);

bufif1 (oALU [0], nOR [0], OR);
bufif1 (oALU [1], nOR [1], OR);
bufif1 (oALU [2], nOR [2], OR);
bufif1 (oALU [3], nOR [3], OR);
bufif1 (oALU [4], nOR [4], OR);
bufif1 (oALU [5], nOR [5], OR);
bufif1 (oALU [6], nOR [6], OR);
bufif1 (oALU [7], nOR [7], OR);

bufif1 (oALU [0], nXOR [0], XOR);
bufif1 (oALU [1], nXOR [1], XOR);
bufif1 (oALU [2], nXOR [2], XOR);
bufif1 (oALU [3], nXOR [3], XOR);
bufif1 (oALU [4], nXOR [4], XOR);
bufif1 (oALU [5], nXOR [5], XOR);
bufif1 (oALU [6], nXOR [6], XOR);
bufif1 (oALU [7], nXOR [7], XOR);

bufif1 (oALU [0], nIncDecA [0], Inc^Dec);
bufif1 (oALU [1], nIncDecA [1], Inc^Dec);
bufif1 (oALU [2], nIncDecA [2], Inc^Dec);
bufif1 (oALU [3], nIncDecA [3], Inc^Dec);
bufif1 (oALU [4], nIncDecA [4], Inc^Dec);
bufif1 (oALU [5], nIncDecA [5], Inc^Dec);
bufif1 (oALU [6], nIncDecA [6], Inc^Dec);
bufif1 (oALU [7], nIncDecA [7], Inc^Dec);

bufif1 (oALU [0], nRotateA [0], RotateLeft^RotateRight);
bufif1 (oALU [1], nRotateA [1], RotateLeft^RotateRight);
bufif1 (oALU [2], nRotateA [2], RotateLeft^RotateRight);
bufif1 (oALU [3], nRotateA [3], RotateLeft^RotateRight);
bufif1 (oALU [4], nRotateA [4], RotateLeft^RotateRight);
bufif1 (oALU [5], nRotateA [5], RotateLeft^RotateRight);
bufif1 (oALU [6], nRotateA [6], RotateLeft^RotateRight);
bufif1 (oALU [7], nRotateA [7], RotateLeft^RotateRight);

endmodule






