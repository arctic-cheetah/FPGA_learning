module test;
	reg in;
	wire out;
	Timing t(in,out);
	initial begin 
		in = 0;
		repeat (3) #10 in = !in;
	end
endmodule
		