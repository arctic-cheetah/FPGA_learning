module Q5_5_4_CA_CO (input wire A, B, C, output wire F);
	//Logic table: in the order: (C,B,A)
	assign F = 
	( 
		(~A | ~B | ~C) ? 1'b1 :  
		( A | ~B | ~C) ? 1'b1 :
		( A |  B | ~C) ? 1'b1 :
		( A | ~B |  C) ? 1'b1 :
		( A |  B |  C) ? 1'b1 : 1'b0
	);
endmodule
