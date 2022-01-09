module button_counter_with_sw_debounce	(input wire sw_add, clk, output wire [6:0] seg, output wire n_segment);
	wire sw_add_db;
	integer count = 0;
	seven_segment_disp disp(.seg(seg), .n_segment(n_segment), .bcd(count));
	//Debounce the switch
	switch_debounce debounce (.sw(sw_add), .clk(clk), .db_sw(sw_add_db));
	
	//Need to create a switch debouncer
	always @ (posedge sw_add_db) begin
		if (count < 10) begin
			count = count + 1;
		end
		else begin
			count = 0;
		end
	end
	
endmodule