//A program to display the number of button presses
//on a seven segment display

module button_counter_4_digits(input wire clk, sw_add, sw_reset, output wire [6:0] seg, output reg [3:0] n_digit);
	localparam W = 16;
	reg [15:0] btn_count = 0;
	reg [W+(W-4)/3:0] bcd = 0;
	 
	reg [3:0] bcd_show = 0;
	wire sw_add_db;
	
	localparam FREQ = 50000000; //50 Mhz
	localparam HZ = 240; //This is in hz if 1/s 240 / 4 (digits) = 60Hz refresh rate
	localparam REFRESH_CYCLE = FREQ / 2 / HZ;//Need a quick refresh rate
	
	reg [31:0] increment_count = 0;
	reg [31:0] refresh_disp_count = 0;
	
	//Debounce the switch
	switch_debounce db(.sw(sw_add), .clk(clk), .db_sw(sw_add_db));
	
	//Convert the button count to bcd
	integer i,j;

	always @(btn_count) begin
		for(i = 0; i <= W+(W-4)/3; i = i+1) bcd[i] = 0;     // initialize with zeros
		bcd[W-1:0] = btn_count;                                   // initialize with input vector
			for(i = 0; i <= W-4; i = i+1)                       // iterate on structure depth
				for(j = 0; j <= i/3; j = j+1)                     // iterate on structure width
					if (bcd[W-i+4*j -: 4] > 4)                      // if > 4
						bcd[W-i+4*j -: 4] = bcd[W-i+4*j -: 4] + 4'd3; // add 3
	end

	
	//Refresh the display @ 60hz
	seven_segment_display dipslay(.seg(seg), .bcd(bcd_show));
	always @(posedge clk) begin

		refresh_disp_count = refresh_disp_count + 1;
		
		//Show the first digit
		if (refresh_disp_count == REFRESH_CYCLE) begin
			n_digit = ~4'b0001;
			bcd_show = bcd[3:0];
		end
		//Then second
		else if (refresh_disp_count == (2*REFRESH_CYCLE) ) begin
			n_digit = ~4'b0010;
			bcd_show = bcd[7:4];
			
		end
		
		//Third
		else if (refresh_disp_count == (3*REFRESH_CYCLE) ) begin
			n_digit = ~4'b0100;
			bcd_show = bcd[11:8];
		end
		
		//Fourth
		else if (refresh_disp_count == (4*REFRESH_CYCLE) ) begin
			n_digit = ~4'b1000;
			bcd_show = bcd[15:12];
			//Must set refresh_disp_count = 0. Integer does not overflow and unexpected behaviours may occur
			refresh_disp_count = 0;
		end
		
	end
	
	//Increment the button count every press
	//Reset the count if sw_reset is pressed
	always @ (posedge sw_add_db, negedge sw_reset) begin 
	   //sw_reset is pulled up 
		if (!sw_reset) begin
			btn_count = 0;
		end
		else begin
			btn_count = btn_count + 1;
		end
			
	end
	

endmodule
