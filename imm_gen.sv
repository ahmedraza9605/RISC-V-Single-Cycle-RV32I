module ImmGen (
    input  logic [31:0] instruction,
    output logic [31:0] imm
);

logic [6:0] op;

always_comb begin
    op  = instruction[6:0];
    imm = 32'd0;

    case(op)

    // I-Type
    7'b0010011,
    7'b0000011,
    7'b1100111: begin
        imm = {{20{instruction[31]}}, instruction[31:20]};
    end

    // S-Type
    7'b0100011: begin
        imm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
    end

    // B-Type
    7'b1100011: begin
        imm = {{19{instruction[31]}},
               instruction[31],
               instruction[7],
               instruction[30:25],
               instruction[11:8],
               1'b0};
    end

    // U-Type
    7'b0110111,
    7'b0010111: begin
        imm = {instruction[31:12], 12'b0};
    end

    // J-Type
    7'b1101111: begin
        imm = {{11{instruction[31]}},
               instruction[31],
               instruction[19:12],
               instruction[20],
               instruction[30:21],
               1'b0};
    end

    default: begin
        imm = 32'd0;
    end

    endcase
end

endmodule