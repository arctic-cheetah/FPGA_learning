module implement_xor (A,B,C);
	input wire A;
	input wire B;
	output wire C;
	nand_gate U0 (.A(A), .B(B), .C(C));
	assign C = ~C;
endmodule