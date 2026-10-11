`timescale 1ns/1ps

module RV32I_Top_tb;

logic clk;
logic reset;

RV32I_Top uut (
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial begin
 $dumpfile("waveform.vcd");
 $dumpvars(0,RV32I_Top_tb );

 clk = 0;
 reset = 1;

#10 reset = 0;

#500 $finish;

end

initial begin
$monitor(
"Time=%0t PC=%h Instruction=%h ALU_Result=%h WriteBack=%h",
$time,
uut.pc,
uut.instruction,
uut.alu_result,
uut.writeback_data
);
end

endmodule