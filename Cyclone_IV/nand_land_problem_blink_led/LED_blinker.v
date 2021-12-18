//Macros:
//`define LED_ON = 0;
//`define LED_OFF = 1;

module LED_blinker (output wire LED, input wire SW_1, SW_2, EN, CLK);

	//Half duty cycle, clock is 66MHz
	//66Mhz / 100Hz * .5
	parameter HZ_100 = 33000;
	parameter HZ_50 = 16500;
	parameter HZ_10 = 1650;
	parameter HZ_1 = 165;
	
	always @ (SW_1, SW_2, EN) begin
		if (EN) 
			LED = `LED_ON;
			
		else
			LED = `LED_OFF;
	end
	
endmodule
