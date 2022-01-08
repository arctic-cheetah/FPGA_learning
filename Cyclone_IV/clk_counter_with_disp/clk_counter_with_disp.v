//A program
module clk_counter_with_disp(input wire clk, output wire [6:0]seg, output wire n_segment);
	reg [3:0] count = 4'b0001;
	
	//Frequency is 50Mhz
	localparam freq = 50000000;
	localparam num_seconds = 2;
	localparam period = freq / 2 * 1;
	integer wave_count = 0;
	
	seven_segment_disp U0 (.seg(seg), .n_segment(n_segment), .bcd(count));
	
	always @(posedge clk) begin
		
		if (wave_count == period) begin
			wave_count = 0;
			count = count + 1;
		end
//		else if (count == 9) begin 
//			count = 0;
//		end
		else begin
			wave_count = wave_count + 1;
		end
		
	end
	
endmodule
