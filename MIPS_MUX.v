module MIPS_MUX #(parameter width =32)
(
input wire [width-1:0] 	IN1,
input wire [width-1:0] 	IN2,
input wire 			   	sel,
output reg [width-1:0] OUT
);

always @(*)
	begin
		if (sel)
			OUT = IN2;
		else
			OUT = IN1;
	end

endmodule