module InstrMem#(
parameter ADDR_BITS = 10,
parameter DATA_FILE = "imem.hex"
)(
input logic [31:0] addr,
output logic [31:0] instruction
);
localparam DEPTH = 2**ADDR_BITS;
logic [31:0] mem [0:DEPTH-1];
initial begin
$readmemh(DATA_FILE, mem);
end
assign instruction = mem[addr[ADDR_BITS+1:2]];
endmodule


