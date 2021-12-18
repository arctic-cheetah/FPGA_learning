module Example_5_2(A, B, C, F);
	input wire A,B,C;
	output wire F;
	
	
	assign a1 = (~A) & (~B) & (~C);
	assign a2 = (~A) & B & (~C);
	assign a3 = A & B & (~C);
	
	assign F = (a1 | a2 | a3);
	
	
endmodule