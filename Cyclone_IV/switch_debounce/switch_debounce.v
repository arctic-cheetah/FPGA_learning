//A program to debounce a SPST switch
//On the Cyclone IV board
//I need to understand the timing of this switch debounce. Otherwise, it will be difficult to migrate this
//program to other projects
module switch_debounce(input wire sw, clk, output wire db_sw);
	wire Q1, Q2;
	wire slow_clk;
	clk_divider U0 (.clk(clk), .new_clk(slow_clk));
	d_ff D0 (.D(sw), .clk(slow_clk), .Q(Q1));
	d_ff D1 (.D(Q1), .clk(slow_clk), .Q(Q2));
	
	assign db_sw = Q1 & (~Q2);

endmodule