module MIPS_RegisterFile #(parameter width = 32 , depth = 32 , Address = 5)
(
	input wire [Address-1:0] 	A1,
	input wire [Address-1:0] 	A2,
	input wire [Address-1:0] 	A3,
	input wire 				CLK,
	input wire 				RST,
	input wire 			 	WE3,	
	input wire [width-1:0]	WD3,
	output reg [width-1:0]	RD1,
	output reg [width-1:0]	RD2
);

reg [width-1:0] RegFile [depth-1:0];

integer i;

always @ (posedge CLK or negedge RST)	//posedge CLK??
	begin 
		if (!RST)
			begin
				for (i = 0 ; i < depth ; i = i + 1)
				begin
					RegFile[i] <= 32'b0;
				end
			end
		else if (WE3)
			begin
				RegFile[A3] <= WD3;
			end
	end
		

always @ (*)
	begin
		RD1 = RegFile[A1];
	end

always @ (*)
	begin
		RD2 = RegFile[A2];
	end

endmodule





