//Macros:
//`define LED_ON = 0;
//`define LED_OFF = 1;

module LED_blinker (output wire LED, input wire SW_1, SW_2, EN, clk);

	//Half duty cycle, clock is 66MHz, eg
	//66Mhz / 100Hz * .5
	localparam CLOCK_FREQUENCY = 66000000;
	localparam HZ_30 = CLOCK_FREQUENCY / 30 / 2;
	localparam HZ_20 = CLOCK_FREQUENCY / 20 / 2;
	localparam HZ_10 = CLOCK_FREQUENCY / 10 / 2;
	localparam HZ_1 = CLOCK_FREQUENCY / 2;
	
	integer HZ_1_cnt = 0;
	integer HZ_10_cnt = 0;
	integer HZ_20_cnt = 0;
	integer HZ_30_cnt = 0;
	
	reg out_mux = 1;
	
	//Frequencies
	
	
	always @ (posedge clk) begin
	
		//1HZ
		if (!SW_1 && !SW_2) begin
			if (HZ_1_cnt == HZ_1) begin
				HZ_1_cnt <= 0; 
				out_mux <= ~out_mux;
			end else begin
				HZ_1_cnt <= HZ_1_cnt + 1;
			end
		end else begin
			HZ_1_cnt <= 0; 
		end
		
		//10HZ
		if (SW_1 && !SW_2) begin
			if (HZ_10_cnt == HZ_10) begin
				HZ_10_cnt <= 0; 
				out_mux <= ~out_mux;
			end else begin
				HZ_10_cnt <= HZ_10_cnt + 1;
			end
		end else begin
			HZ_10_cnt <= 0; 
		end
		
		//20Hz
		if (!SW_1 && SW_2) begin
			if (HZ_20_cnt == HZ_20) begin
				HZ_20_cnt <= 0; 
				out_mux <= ~out_mux;
			end else begin
				HZ_20_cnt <= HZ_20_cnt + 1;
			end
		end else begin
			HZ_20_cnt <= 0; 
		end
		
		//30Hz
		if (SW_1 && SW_2) begin
			if (HZ_30_cnt == HZ_30) begin
				HZ_30_cnt <= 0; 
				out_mux <= ~out_mux;
			end else begin
				HZ_30_cnt <= HZ_30_cnt + 1;
			end
		end else begin
			HZ_30_cnt <= 0; 
		end
		
	end
	
	assign LED = out_mux & EN;
	
	
endmodule
