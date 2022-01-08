//A program that displays the number of button presses
module clk_counter_switch_dp (input wire sw_add, output wire [6:0] seg, output wire n_segment);
	reg [3:0] count = 0;
	
	seven_segment_disp disp(.seg(seg), .n_segment(n_segment), .bcd(count));
	
	//Need to create a switch debouncer
	always @ (posedge sw_add) begin
		if (count < 10) begin
			count = count + 1;
		end
		else begin
			count = 0;
		end
	end
	

endmodule