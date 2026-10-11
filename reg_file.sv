module reg_file (
    input  logic        clk,
    input  logic        reset,

    input  logic [4:0]  rs1,
    input  logic [4:0]  rs2,

    output logic [31:0] rd1,
    output logic [31:0] rd2,

    input  logic [4:0]  rd,
    input  logic [31:0] wr_data,
    input  logic        reg_write
);

    logic [31:0] r0;
    logic [31:0] r1;
    logic [31:0] r2;
    logic [31:0] r3;
    logic [31:0] r4;
    logic [31:0] r5;
    logic [31:0] r6;
    logic [31:0] r7;
    logic [31:0] r8;
    logic [31:0] r9;
    logic [31:0] r10;
    logic [31:0] r11;
    logic [31:0] r12;
    logic [31:0] r13;
    logic [31:0] r14;
    logic [31:0] r15;
    logic [31:0] r16;
    logic [31:0] r17;
    logic [31:0] r18;
    logic [31:0] r19;
    logic [31:0] r20;
    logic [31:0] r21;
    logic [31:0] r22;
    logic [31:0] r23;
    logic [31:0] r24;
    logic [31:0] r25;
    logic [31:0] r26;
    logic [31:0] r27;
    logic [31:0] r28;
    logic [31:0] r29;
    logic [31:0] r30;
    logic [31:0] r31;

    assign r0 = 32'd0;


    logic wen0,  wen1,  wen2,  wen3,  wen4,  wen5,  wen6,  wen7;
    logic wen8,  wen9,  wen10, wen11, wen12, wen13, wen14, wen15;
    logic wen16, wen17, wen18, wen19, wen20, wen21, wen22, wen23;
    logic wen24, wen25, wen26, wen27, wen28, wen29, wen30, wen31;

    assign wen0  = 1'b0;
    assign wen1  = reg_write & (rd == 5'd1);
    assign wen2  = reg_write & (rd == 5'd2);
    assign wen3  = reg_write & (rd == 5'd3);
    assign wen4  = reg_write & (rd == 5'd4);
    assign wen5  = reg_write & (rd == 5'd5);
    assign wen6  = reg_write & (rd == 5'd6);
    assign wen7  = reg_write & (rd == 5'd7);
    assign wen8  = reg_write & (rd == 5'd8);
    assign wen9  = reg_write & (rd == 5'd9);
    assign wen10 = reg_write & (rd == 5'd10);
    assign wen11 = reg_write & (rd == 5'd11);
    assign wen12 = reg_write & (rd == 5'd12);
    assign wen13 = reg_write & (rd == 5'd13);
    assign wen14 = reg_write & (rd == 5'd14);
    assign wen15 = reg_write & (rd == 5'd15);
    assign wen16 = reg_write & (rd == 5'd16);
    assign wen17 = reg_write & (rd == 5'd17);
    assign wen18 = reg_write & (rd == 5'd18);
    assign wen19 = reg_write & (rd == 5'd19);
    assign wen20 = reg_write & (rd == 5'd20);
    assign wen21 = reg_write & (rd == 5'd21);
    assign wen22 = reg_write & (rd == 5'd22);
    assign wen23 = reg_write & (rd == 5'd23);
    assign wen24 = reg_write & (rd == 5'd24);
    assign wen25 = reg_write & (rd == 5'd25);
    assign wen26 = reg_write & (rd == 5'd26);
    assign wen27 = reg_write & (rd == 5'd27);
    assign wen28 = reg_write & (rd == 5'd28);
    assign wen29 = reg_write & (rd == 5'd29);
    assign wen30 = reg_write & (rd == 5'd30);
    assign wen31 = reg_write & (rd == 5'd31);



    always_ff @(posedge clk) 
    begin if (reset) r1  <= 32'd0;
     else if (wen1)  r1  <= wr_data; 
     end

    always_ff @(posedge clk) 
    begin if (reset) r2  <= 32'd0; 
    else if (wen2)  r2  <= wr_data; 
    end

    always_ff @(posedge clk) 
    begin if (reset) r3  <= 32'd0; 
    else if (wen3)  r3  <= wr_data; 
    end

    always_ff @(posedge clk) 
    begin if (reset) r4  <= 32'd0; 
    else if (wen4)  r4  <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r5  <= 32'd0; 
    else if (wen5)  r5  <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r6  <= 32'd0; 
    else if (wen6)  r6  <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r7  <= 32'd0; 
    else if (wen7)  r7  <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r8  <= 32'd0; 
    else if (wen8)  r8  <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r9  <= 32'd0; 
    else if (wen9)  r9  <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r10 <= 32'd0; 
    else if (wen10) r10 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r11 <= 32'd0; 
    else if (wen11) r11 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r12 <= 32'd0; 
    else if (wen12) r12 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r13 <= 32'd0; 
    else if (wen13) r13 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r14 <= 32'd0; 
    else if (wen14) r14 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r15 <= 32'd0; 
    else if (wen15) r15 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r16 <= 32'd0; 
    else if (wen16) r16 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r17 <= 32'd0; 
    else if (wen17) r17 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r18 <= 32'd0; 
    else if (wen18) r18 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r19 <= 32'd0; 
    else if (wen19) r19 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r20 <= 32'd0; 
    else if (wen20) r20 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r21 <= 32'd0; 
    else if (wen21) r21 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r22 <= 32'd0; 
    else if (wen22) r22 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r23 <= 32'd0; 
    else if (wen23) r23 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r24 <= 32'd0; 
    else if (wen24) r24 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r25 <= 32'd0; 
    else if (wen25) r25 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r26 <= 32'd0; 
    else if (wen26) r26 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r27 <= 32'd0; 
    else if (wen27) r27 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r28 <= 32'd0; 
    else if (wen28) r28 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r29 <= 32'd0; 
    else if (wen29) r29 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r30 <= 32'd0; 
    else if (wen30) r30 <= wr_data; 
    end
    always_ff @(posedge clk) 
    begin if (reset) r31 <= 32'd0; 
    else if (wen31) r31 <= wr_data; 
    end

    always_comb 
    begin
        case (rs1)
            5'd0  : rd1 = r0;
            5'd1  : rd1 = r1;
            5'd2  : rd1 = r2;
            5'd3  : rd1 = r3;
            5'd4  : rd1 = r4;
            5'd5  : rd1 = r5;
            5'd6  : rd1 = r6;
            5'd7  : rd1 = r7;
            5'd8  : rd1 = r8;
            5'd9  : rd1 = r9;
            5'd10 : rd1 = r10;
            5'd11 : rd1 = r11;
            5'd12 : rd1 = r12;
            5'd13 : rd1 = r13;
            5'd14 : rd1 = r14;
            5'd15 : rd1 = r15;
            5'd16 : rd1 = r16;
            5'd17 : rd1 = r17;
            5'd18 : rd1 = r18;
            5'd19 : rd1 = r19;
            5'd20 : rd1 = r20;
            5'd21 : rd1 = r21;
            5'd22 : rd1 = r22;
            5'd23 : rd1 = r23;
            5'd24 : rd1 = r24;
            5'd25 : rd1 = r25;
            5'd26 : rd1 = r26;
            5'd27 : rd1 = r27;
            5'd28 : rd1 = r28;
            5'd29 : rd1 = r29;
            5'd30 : rd1 = r30;
            5'd31 : rd1 = r31;
            default : rd1 = 32'd0;
        endcase
    end

    always_comb 
    begin
        case (rs2)
            5'd0  : rd2 = r0;
            5'd1  : rd2 = r1;
            5'd2  : rd2 = r2;
            5'd3  : rd2 = r3;
            5'd4  : rd2 = r4;
            5'd5  : rd2 = r5;
            5'd6  : rd2 = r6;
            5'd7  : rd2 = r7;
            5'd8  : rd2 = r8;
            5'd9  : rd2 = r9;
            5'd10 : rd2 = r10;
            5'd11 : rd2 = r11;
            5'd12 : rd2 = r12;
            5'd13 : rd2 = r13;
            5'd14 : rd2 = r14;
            5'd15 : rd2 = r15;
            5'd16 : rd2 = r16;
            5'd17 : rd2 = r17;
            5'd18 : rd2 = r18;
            5'd19 : rd2 = r19;
            5'd20 : rd2 = r20;
            5'd21 : rd2 = r21;
            5'd22 : rd2 = r22;
            5'd23 : rd2 = r23;
            5'd24 : rd2 = r24;
            5'd25 : rd2 = r25;
            5'd26 : rd2 = r26;
            5'd27 : rd2 = r27;
            5'd28 : rd2 = r28;
            5'd29 : rd2 = r29;
            5'd30 : rd2 = r30;
            5'd31 : rd2 = r31;
            default : rd2 = 32'd0;
        endcase
    end

endmodule
