`timescale 1ns / 1ns
module clc_counter_tb();

	reg clk = 0;
	wire [6:0] seg = 7'b0000000;
	wire n_segment = 0;
	
	clk_counter_with_disp DUT(.clk(clk), .seg(seg), .n_segment(n_segment));
	
	initial begin
		forever
			#20 clk = !clk;
	end



endmodule
