module MIPS_MainDecoder 
(
input wire [5:0] 	Opcode,
output reg			Mem2Reg,
output wire			MemWrite,
output wire			Branch,
output reg			ALUSrc,
output wire			RegDst,
output reg			RegWrite,
output wire			Jump,
output reg	[1:0]	ALUOp
);


assign Jump 	= (Opcode == 6'b000010);

assign MemWrite = (Opcode == 6'b101011);

assign RegDst 	= (Opcode == 6'b000000);

assign Branch 	= (Opcode == 6'b000100);


always @(*)
  begin
	casex(Opcode)
		6'b10x011: 	begin	Mem2Reg = 1'b1;		end
		default:	begin	Mem2Reg = 1'b0;		end
	endcase
  end
  
always @(*)
  begin
	case(Opcode)
		6'b000000: 	begin	ALUOp = 2'b10;		end
		6'b000100: 	begin	ALUOp = 2'b01;		end
		default:	begin	ALUOp = 2'b00;		end
	endcase
  end 
	
always @(*)
  begin
	casex(Opcode)
		6'b100011: 	begin	RegWrite = 1'b1;	end
		6'b00x000: 	begin	RegWrite = 1'b1;	end
		default:	begin	RegWrite = 1'b0;	end
	endcase
  end

always @(*)
  begin
	casex(Opcode)
		6'b10x011: 	begin	ALUSrc = 1'b1;		end
		6'b001000: 	begin	ALUSrc = 1'b1;		end
		default:	begin	ALUSrc = 1'b0;		end
	endcase
  end


endmodule
