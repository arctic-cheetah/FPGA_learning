//
//Converts decimals to bcd.
//Returns a 16 bit bcd
//Does not work because synthesiser is removing all the logic
 	
	//Find the index of the most siginificant bit (msb)
	integer msb_index;
	reg [15:0] temp_dec;
	reg [4:0] nibble;
	integer i = 0;
	
	
	always @ (decimal, clk) begin
	
		//set bcd to zero 
		for (i = 0; i < 16; i = i + 1) bcd[i] = 0;
		
		for (i = 16 ;i > 0 && ((1 << i) & decimal) != 1; i = i - 1);
		
		//Prepare the decimal for bcd conversion
		temp_dec = decimal << (16 - msb_index);
		nibble = 0;
		
		for (msb_index = i; msb_index > 0; msb_index = msb_index - 1) begin 
		
			//Check if any of output's nibbles are greater than 4
			nibble = temp_dec & 16'h000F;
			if (nibble > 4) begin 
				bcd = bcd + 16'h0003;
			end
			
			nibble = (temp_dec & 16'h00F0) >> 4;
			if (nibble > 4) begin 
				bcd = bcd + 16'h0030;
			end

			
		end
		
		
		
	end

endmodule


// parametric Verilog implementation of the double dabble binary to BCD converter
// for the complete project, see
// https://github.com/AmeerAbdelhadi/Binary-to-BCD-Converter

//
//module decimal_to_bcd
// #( parameter                W = 16)  // input width
//  ( input      [W-1      :0] bin   ,  // binary
//    output reg [W+(W-4)/3:0] bcd   ); // bcd {...,thousands,hundreds,tens,ones}
//
//  integer i,j;
//
//  always @(bin) begin
//    for(i = 0; i <= W+(W-4)/3; i = i+1) bcd[i] = 0;     // initialize with zeros
//    bcd[W-1:0] = bin;                                   // initialize with input vector
//    for(i = 0; i <= W-4; i = i+1)                       // iterate on structure depth
//      for(j = 0; j <= i/3; j = j+1)                     // iterate on structure width
//        if (bcd[W-i+4*j -: 4] > 4)                      // if > 4
//          bcd[W-i+4*j -: 4] = bcd[W-i+4*j -: 4] + 4'd3; // add 3
//  end
//
//endmodule