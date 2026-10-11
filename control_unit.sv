module ControlUnit (
input logic [6:0] opcode,
input logic [2:0] funct3,
input logic [6:0] funct7,
output logic RegWrite,
output logic MemWrite,
output logic Branch,
output logic Jump,
output logic ALUSrc,
output logic [1:0] ResultSrc,
output logic [3:0] ALUSel
);

logic f7_5;

assign f7_5 = funct7[5];

always_comb 
begin

RegWrite = 0;
MemWrite = 0;
Branch = 0;
Jump = 0;
ALUSrc = 0;
ResultSrc = 2'b00;
ALUSel = 4'b0000;

case(opcode)

// R-Type
7'b0110011: begin
RegWrite = 1;
ALUSrc = 0;
case(funct3)
3'b000: ALUSel = (f7_5) ? 4'b0001 : 4'b0000;
3'b111: ALUSel = 4'b0010;
3'b110: ALUSel = 4'b0011;
3'b100: ALUSel = 4'b0100;
3'b001: ALUSel = 4'b0101;
3'b101: ALUSel = (f7_5) ? 4'b0111 : 4'b0110;
3'b010: ALUSel = 4'b1000;
3'b011: ALUSel = 4'b1001;
default: ALUSel = 4'b0000;
endcase
end

// I-Type
7'b0010011: begin
RegWrite = 1;
ALUSrc = 1;
case(funct3)
3'b000: ALUSel = 4'b0000;
3'b111: ALUSel = 4'b0010;
3'b110: ALUSel = 4'b0011;
3'b100: ALUSel = 4'b0100;
3'b001: ALUSel = 4'b0101;
3'b101: ALUSel = (f7_5) ? 4'b0111 : 4'b0110;
3'b010: ALUSel = 4'b1000;
3'b011: ALUSel = 4'b1001;
default: ALUSel = 4'b0000;
endcase
end

// Load
7'b0000011: begin
RegWrite = 1;
ALUSrc = 1;
ResultSrc = 2'b01;
ALUSel = 4'b0000;
end

// Store
7'b0100011: begin
MemWrite = 1;
ALUSrc = 1;
ALUSel = 4'b0000;
end

// Branch
7'b1100011: begin
Branch = 1;
ALUSel = 4'b0001;
end

// JAL
7'b1101111: begin
Jump = 1;
RegWrite = 1;
ResultSrc = 2'b10;
end

// JALR 
7'b1100111: begin
RegWrite  = 1;
ALUSrc    = 1;
Jump      = 1;
ResultSrc = 2'b10;
ALUSel    = 4'b0000;
end

// LUI
7'b0110111: begin
RegWrite = 1;
ResultSrc = 2'b11;
end

default: begin
RegWrite = 0;
MemWrite = 0;
Branch = 0;
Jump = 0;
ALUSrc = 0;
ResultSrc = 2'b00;
ALUSel = 4'b0000;
end

endcase
end

endmodule