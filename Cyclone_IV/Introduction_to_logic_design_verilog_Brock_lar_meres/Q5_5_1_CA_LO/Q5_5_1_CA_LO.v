module Q5_5_1_CA_LO (input wire A, B, C, output wire F);
	//Not's
	assign n_A = ~A;
	assign n_B = ~B;
	assign n_C = ~C;
	
	//Products
	assign m_1 = A & n_B & n_C;
	assign m_3 = A & B & n_C;
	assign m_4 = n_A & n_B & C;
	assign m_6 = n_A & B & C;
	
	//Sum
	assign F = m_1 | m_3 | m_4 | m_6;
	
	
	
endmodule
