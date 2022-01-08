module implement_xor (A,B,C);
	input wire A;
	input wire B;
	output wire C;
	wire C1, C2, C3;
	nand_gate U0 (.A(A), .B(B), .C(C1));
	nand_gate U1 (.A(A), .B(C1), .C(C2));
	nand_gate U2 (.A(B), .B(C1), .C(C3));
	nand_gate U3 (.A(C2), .B(C3), .C(C));
endmodule