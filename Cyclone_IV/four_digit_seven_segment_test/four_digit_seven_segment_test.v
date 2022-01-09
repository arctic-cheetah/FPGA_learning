//This program tests the possibility of using the 4 digit 7 segment display
//It operates by changing each digit at 60hz, faster than the human eye can see.
//Resulting in the illusion that the image numbers remain static.
module four_digit_seven_segment_test(input wire clk, output wire [6:0] seg, output reg [3:0] n_digit);
	//reg [15:0] num = 16'b0100001100100001; //4'H4321;
	reg [3:0] bcd = 0;
	localparam FREQ = 50000000; //50 Mhz
	localparam SECS = 240; //This is in hz if 1/s 240 / 4 (digits) = 60Hz refresh rate
	localparam N_CYCLES = FREQ / 2 / SECS;//Need a quick refresh rate
	reg [31:0] count = 0;
	
	seven_segment_disp dipslay(.seg(seg), .bcd(bcd));
	
	always @(posedge clk) begin
		count = count + 1;
		
		//Show the first digit
		if (count == N_CYCLES) begin
			n_digit = ~4'b0001;
			bcd = 1;
		end
		//Then second
		else if (count == (2*N_CYCLES) ) begin
			n_digit = ~4'b0010;
			bcd = 2;
			
		end
		
		//Third
		else if (count == (3*N_CYCLES) ) begin
			n_digit = ~4'b0100;
			bcd = 3;
		end
		
		//Fourth
		else if (count == (4*N_CYCLES) ) begin
			n_digit = ~4'b1000;
			bcd = 4;
			//Must set count = 0. Integer does not overflow and unexpected behaviours may occur
			count = 0;
		end
		
		
	end
	
endmodule