module MIPS_DataMemory #(parameter width = 32 , depth = 100 )
(
	input wire [width-1:0] 	A,
	input wire 				CLK,
	input wire 				RST,
	input wire 			 	WE,	
	input wire [width-1:0]	WD,
	output reg [width-1:0]	RD,
	output reg [15:0]	test_value
);

reg [width-1:0] MemFile [depth-1:0];


integer i;

always @ (posedge CLK or negedge RST)	//posedge CLK??
	begin 
		if (!RST)
			begin
				for (i = 0 ; i < depth ; i = i + 1)
				begin
					MemFile[i] <= 32'b0;
				end
			end
		else if (WE)
			begin
				MemFile[A] <= WD;
			end
	end
		

always @ (*)
	begin
		RD = MemFile[A];
	end

always @ (*)
	begin
		test_value = MemFile[32'b0];
	end


endmodule
