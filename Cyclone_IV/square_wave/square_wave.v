//A program to make a square wave
module square_wave (input wire clk, output reg square_wave);
	//Board clock is 66MHZ
	localparam CLOCK_FREQUENCY = 66000000;
	//Change frequency here:
	localparam freq = 20;
	//Half Duty Cycle
	localparam COUNT_FREQ = CLOCK_FREQUENCY / freq / 2;
	integer counter = 0;
	
	always @ (posedge clk) begin
		if (counter == COUNT_FREQ) begin
			counter <= 0; 
			square_wave <= ~square_wave;
		end else begin
			counter <= counter + 1;
		end
	end
endmodule