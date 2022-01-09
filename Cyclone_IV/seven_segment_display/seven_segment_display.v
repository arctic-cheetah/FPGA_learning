//A program to decode a seven segment display via BCD

//Read array from LSB to MSB... Rightmost to leftmost bit
module seven_segment_display (output reg [6:0]seg, output wire n_segment, input wire [3:0]bcd);

	assign n_segment = 0;
	wire [3:0] neg_bcd;
	//Sw is pullup high, therefore negate it
	assign neg_bcd = ~bcd;
	//Seven segment display is pulled up. Therefore this also needs to be negated
	always @(bcd) begin
		case (bcd)
		
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


//
////oLD
//module seven_segment_display (output wire a,b,c,d,e,f,g,select_dis, input wire b0, b1, b2, b3);
//	
//	assign select_dis = 0;
//	assign a = ~(b3 | b1 | (b0 & b2) | (~b0 & ~b2));
//	assign b = ~(~b3 | (~b1 & ~b0) | (b1 & b0));
//	assign c = ~(~b1 | b2 | b0);
//	assign d = ~(b3 | (b1 & ~b0) | (~b2 & ~b0) | (b2 & ~b1 & b0) | (~b2 & b1));
//	assign e = ~(~b0 & (b1 | ~b2));
//	assign f = ~(b3 | (b2 | ~b1) | (~b1 & ~b0) | (b2 & ~b0));
//	assign g = ~(b3 | (b2 & ~b1) | (b2 & ~b0) | (~b3 & ~b2));
//
//endmodule
