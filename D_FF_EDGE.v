module D_FF_EDGE (clk, reset, in_D, out_Q, out_Qn);

input clk, in_D, reset;
output out_Q, out_Qn;

reg out_Q, out_Qn;

always@(posedge clk)
	if(reset)
		begin
		out_Q <= in_D;
		out_Qn <= !in_D;
		end

endmodule 