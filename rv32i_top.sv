module RV32I_Top (
    input logic clk,
    input logic reset
);

    logic [31:0] pc;
    logic [31:0] pc_next;
    logic [31:0] instruction;
    logic [31:0] imm;
    logic [4:0]  rs1, rs2, rd;
    logic [6:0]  opcode;
    logic [2:0]  funct3;
    logic [6:0]  funct7;
    logic [31:0] rd1, rd2;
    logic [31:0] alu_in2;
    logic [31:0] alu_result;
    logic [31:0] mem_data;
    logic [31:0] writeback_data;
    logic        RegWrite;
    logic        MemWrite;
    logic        Branch;
    logic        Jump;
    logic        ALUSrc;
    logic [1:0]  ResultSrc;
    logic [3:0]  ALUSel;
    logic        Zero;
    logic        branch_taken;   

    assign opcode = instruction[6:0];
    assign rd     = instruction[11:7];
    assign funct3 = instruction[14:12];
    assign rs1    = instruction[19:15];
    assign rs2    = instruction[24:20];
    assign funct7 = instruction[31:25];

    Program_Counter PC (
        .clk    (clk),
        .reset  (reset),
        .pc_next(pc_next),
        .pc     (pc)
    );

    InstrMem IMEM (
        .addr       (pc),
        .instruction(instruction)
    );

    reg_file RF (
        .clk      (clk),
        .reset    (reset),
        .rs1      (rs1),
        .rs2      (rs2),
        .rd1      (rd1),
        .rd2      (rd2),
        .rd       (rd),
        .wr_data  (writeback_data),
        .reg_write(RegWrite)
    );

    ImmGen IG (
        .instruction(instruction),
        .imm        (imm)
    );

    ControlUnit CU (
        .opcode   (opcode),
        .funct3   (funct3),
        .funct7   (funct7),
        .RegWrite (RegWrite),
        .MemWrite (MemWrite),
        .Branch   (Branch),
        .Jump     (Jump),
        .ALUSrc   (ALUSrc),
        .ResultSrc(ResultSrc),
        .ALUSel   (ALUSel)
    );

    assign alu_in2 = ALUSrc ? imm : rd2;

    ALU alu (
        .A         (rd1),
        .B         (alu_in2),
        .ALUSel    (ALUSel),
        .ALU_Result(alu_result),
        .Zero      (Zero)
    );

    DataMem DMEM (
        .clk       (clk),
        .mem_write (MemWrite),
        .addr      (alu_result),
        .write_data(rd2),
        .read_data (mem_data)
    );

    always_comb 
    begin
        case (ResultSrc)
            2'b00:   writeback_data = alu_result;
            2'b01:   writeback_data = mem_data;
            2'b10:   writeback_data = pc + 32'd4;
            2'b11:   writeback_data = imm;
            default: writeback_data = 32'd0;
        endcase
    end

   always_comb begin
    branch_taken = 1'b0;

    case (funct3)

        3'b000: branch_taken = (rd1 == rd2);                    

        3'b001: branch_taken = (rd1 != rd2);                    
        3'b100: branch_taken = ($signed(rd1) <  $signed(rd2)); 

        3'b101: branch_taken = ($signed(rd1) >= $signed(rd2)); 

        3'b110: branch_taken = (rd1 < rd2);                    

        3'b111: branch_taken = (rd1 >= rd2);                   

    endcase
end

    always_comb 
    begin
    pc_next = pc + 4;  

    if (Jump && opcode == 7'b1100111)
        pc_next = (rd1 + imm) & 32'hFFFFFFFE; 

    else if (Jump)
        pc_next = pc + imm;  

    else if (Branch && branch_taken)
        pc_next = pc + imm;
end

endmodule