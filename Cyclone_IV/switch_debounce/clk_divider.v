module clk_divider(input wire clk, output reg new_clk);
	localparam BOARD_FREQ = 50000000; //50 MHZ
	localparam NEW_FREQ = 400;
	localparam N_CYCLES = BOARD_FREQ / 2 / NEW_FREQ; //4Hz
	reg [31:0] count = 0;
	
	
	always @(posedge clk) begin
		if (count == N_CYCLES) begin
			count = 0;
			new_clk <= ~new_clk;
		end
		else begin
			count = count + 1;
		end
	end
	
	
endmodule