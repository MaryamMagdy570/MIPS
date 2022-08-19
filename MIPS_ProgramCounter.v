module MIPS_ProgramCounter #(parameter width = 32)
(
input wire 			         CLK, 
input wire 					 RST,
input wire [width-1:0] 	 PC_old,
output reg [width-1:0] 	 PC_new
);

always @ (posedge CLK or negedge RST)
	begin
	  if(!RST)
      begin
        PC_new <= 0;
      end
    else
      begin
        PC_new <= PC_old;
      end
  end

endmodule