module MIPS_SignExtend 
  (
  input wire [15:0] Inst,
  output reg [31:0] Signlmm
  );
  
  always @(*)
    begin 
      if (Inst[15] == 0)
        Signlmm = {16'b0 , Inst};
      else
        Signlmm = {~(16'b0) , Inst};
    end
    
  endmodule