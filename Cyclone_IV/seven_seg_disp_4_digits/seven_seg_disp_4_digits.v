//A program to display a decimal number to a 4 digit seven segment display
module seven_seg_disp_4_digits(input wire [15:0] decimal, output reg [6:0] seg, output reg [3:0] n_segment);

	reg [15:0] bcd = 0;
	
	//Convert the decimal to a bcd
	
	always @(bcd) begin
		//
		case (decimal)
			//Seven segment display is pulled up. This also needs to be negated
			0 : seg = ~7'b1111110;
			1 : seg = ~7'b0000110;
			2 : seg = ~7'b1101101;
			3 : seg = ~7'b1111001;
			4 : seg = ~7'b0110011;
			5 : seg = ~7'b1011011;
			6 : seg = ~7'b1011111;
			7 : seg = ~7'b1110000;
			8 : seg = ~7'b1111111;
			9 : seg = ~7'b1110011;
			10 : seg = ~7'b1110111;
			11 : seg = ~7'b0011111;
			12 : seg = ~7'b1001110;
			13 : seg = ~7'b0111101;
			14 : seg = ~7'b1001111;
			15 : seg = ~7'b1000111;
			
			default : seg = ~7'b0000000;
		endcase
	end
	

endmodule