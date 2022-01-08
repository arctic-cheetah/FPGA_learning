//A program to count the number of times the switched was pressed.
//by displaying it to a 7 segment display
//Need to implement switch debouncer for program to work
module counter_w_seven_segment_disp
#( parameter                W = 16)  // input width
(input wire sw_add, sw_reset, output wire [6:0] seg, output wire [3:0] n_segment);

	reg [15:0] decimal = 0;
	reg [3:0] digit0, digit1, digit2, digit3;
	reg [W+(W-4)/3:0] bcd = 0;
	wire [6:0] seg0, seg1, seg2, seg3;
	
	integer i,j;
	
	seven_segment_display disp0 (.seg(seg), .n_segment(n_segment[0]), .bcd(digit0));
//	seven_segment_display disp1 (.seg(seg1), .n_segment(n_segment[1]), .bcd(digit1));
//	seven_segment_display disp2 (.seg(seg2), .n_segment(n_segment[2]), .bcd(digit2));
//	seven_segment_display disp3 (.seg(seg3), .n_segment(n_segment[3]), .bcd(digit3));
	
	
	
	
	//Increment if the sw_add is pressed
	always @(sw_add) begin 
		
		decimal = decimal + 1;

		
		//Update the display
		//Send digit0
		digit0 = bcd[3:0];
		//Send digit1
//		digit1 = bcd[7:4];
//		//etc
//		digit2 = bcd[11:8];
//		digit3 = bcd[15:12];
		
	end
	
	always @(sw_reset) begin
		 for(i = 0; i <= W+(W-4)/3; i = i+1) bcd[i] = 0;     // initialize with zeros
		 bcd[W-1:0] = decimal;                                   // initialize with input vector
		 for(i = 0; i <= W-4; i = i+1)                       // iterate on structure depth
			for(j = 0; j <= i/3; j = j+1)                     // iterate on structure width
			  if (bcd[W-i+4*j -: 4] > 4)                      // if > 4
				 bcd[W-i+4*j -: 4] = bcd[W-i+4*j -: 4] + 4'd3; // add 3
		//Clear the display to zero
	end
	//
endmodule