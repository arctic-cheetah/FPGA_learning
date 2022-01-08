module decimal_to_bcd_TB ();
	reg [15:0] dec = 16'b0;
	wire [15:0] bcd;
	
	decimal_to_bcd DUT(.decimal(dec), .bcd(bcd));
	
	initial begin
		#50 dec = 16'b0000000000000111; //7
		#100 dec = 15;
		#150 dec = 35;
		#200 dec = 0;
	end
	
	//$display("%d", bcd);

endmodule