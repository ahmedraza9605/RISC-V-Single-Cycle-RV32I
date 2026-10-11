module ALU (
input logic [31:0] A,
input logic [31:0] B,
input logic [3:0] ALUSel,
output logic [31:0] ALU_Result,
output logic Zero
);

logic [4:0] shamt;

always_comb 
begin
shamt = B[4:0];
ALU_Result = 32'd0;

case(ALUSel)
4'b0000: ALU_Result = A + B;
4'b0001: ALU_Result = A - B;
4'b0010: ALU_Result = A & B;
4'b0011: ALU_Result = A | B;
4'b0100: ALU_Result = A ^ B;
4'b0101: ALU_Result = A << shamt;
4'b0110: ALU_Result = A >> shamt;
4'b0111: ALU_Result = $signed(A) >>> shamt;
4'b1000: ALU_Result = {31'b0, ($signed(A) < $signed(B))};
4'b1001: ALU_Result = {31'b0, (A < B)};
default: ALU_Result = 32'd0;
endcase
end

assign Zero = (ALU_Result == 0);

endmodule
