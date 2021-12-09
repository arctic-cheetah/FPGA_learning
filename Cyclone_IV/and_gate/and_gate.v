module and_gate (input1, input2, and_result);
	input input1;
	input input2;
	output and_result;
	//Clock is 50MHZ
	wire and_temp;
	assign and_result = input1 & input2;

endmodule