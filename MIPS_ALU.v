module MIPS_ALU #(parameter width = 32)
(
input wire 	[width-1:0] 	SrcA,		// INPUT SIZE ?? HANDLING CARRY
input wire 	[width-1:0] 	SrcB,		// INPUT SIZE ?? HANDLING CARRY
input wire 	[2:0]  	       	ALUControl,
output reg 	[width-1:0]  ALUResult,
output wire 					           ZeroFlag  // wire due to using in assign statement
);

always @ (*)
	begin
		case (ALUControl)
			3'b000: 
				begin
					ALUResult = SrcA && SrcB;	// LOGICAL AND OR BITWISE AND
				end
			3'b001:
				begin
					ALUResult = SrcA || SrcB;	// LOGICAL OR OR BITWISE AND
				end
			3'b010:
				begin
					ALUResult = SrcA + SrcB;
				end
			3'b100:
				begin
					ALUResult = SrcA - SrcB;
				end
			3'b101:
				begin
					ALUResult = SrcA * SrcB;
				end
			3'b110:
				begin
					if (SrcA < SrcB)
						ALUResult = 32'b1;
					else
						ALUResult = 32'b0;
				end
			default:
				begin
					ALUResult = 32'b0;			// value of ALUResult ??
				end
		endcase
	end
	

assign ZeroFlag = (ALUResult == 32'b0);

endmodule 

// what is the meaning of .. Don’t register the output Y or the inputs A and B

