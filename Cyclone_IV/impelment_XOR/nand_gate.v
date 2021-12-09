module nand_gate (A,B,C);
	input A;
	input B;
	output C;
	assign C = !(A & B);
endmodule