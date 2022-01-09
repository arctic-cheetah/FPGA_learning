module d_ff(input wire D, clk, output reg Q);
	always @(posedge clk) begin
		Q <= D;
	end
endmodule