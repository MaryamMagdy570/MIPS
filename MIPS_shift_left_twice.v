module MIPS_shift_left_twice #(parameter width = 32)
(
	input wire [width-3:0] IN ,
	output wire [width-1:0] OUT
);

assign OUT = IN << 2 ;

endmodule