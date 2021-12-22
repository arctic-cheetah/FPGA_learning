//Need to set time scale appropriately to allow for LED to blink
`timescale 1ns/1ns

module LED_blinker_tb;
	reg t_clock    = 1'b0;
	reg t_EN   = 1'b0;
	reg t_SW_1 = 1'b0;
	reg t_SW_2 = 1'b0;
	
	wire W_LED_DRIVE;
	
	LED_blinker UUT (.LED(W_LED_DRIVE), .SW_1(t_SW_1), .SW_2(t_SW_2), .EN(t_EN), .clk(t_clock));
	
	always #15 t_clock <= !t_clock; //Period of one cycle is 15ns
	
	initial begin
		t_EN <= 1'b1;
		t_SW_1 <= 1'b1;
		t_SW_2 <= 1'b1;
		#5E8
		
		t_SW_1 <= 1'b1;
		t_SW_2 <= 1'b0;
		#5E8
		
		t_SW_1 <= 1'b0;
		t_SW_2 <= 1'b1;
		#5E8
		
		t_SW_1 <= 1'b0;
		t_SW_2 <= 1'b0;
		#5E8
		
		$display("Test complete");
	end

endmodule