module MIPS_InstructionMemory #(parameter width = 32 , depth = 100)
  (
  input wire [width-1:0]  PC,
  output reg [width-1:0]  Instr
  );
  
  reg [width-1:0] INST_File [depth-1:0]; 
  
  always @(*)
	begin
		Instr = INST_File[PC >> 2];
	end

initial
  begin
    //$readmemh("GCD.txt",INST_File);
    $readmemh("FACTORIAL.txt",INST_File);
  end

endmodule
