module four_digit_seven_segment_test_TB();

	reg clk = 0;
	wire [6:0] seg;
	wire [3:0] n_digit;
	
	four_digit_seven_segment_test DUT (.clk(clk), .seg(seg), .n_digit(n_digit));
	
	initial begin
		forever #20 clk = ~clk;
	
	end

endmodule