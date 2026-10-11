module DataMem #(
parameter ADDR_BITS = 10,
parameter DATA_FILE = "dmem.txt"
)(
input logic clk,
input logic mem_write,
input logic [31:0] addr,
input logic [31:0] write_data,
output logic [31:0] read_data
);
localparam DEPTH = 2**ADDR_BITS;
logic [31:0] mem [0:DEPTH-1];
initial begin
$readmemh(DATA_FILE, mem);
end
always_ff @(posedge clk) 
begin
if(mem_write)
mem[addr[ADDR_BITS+1:2]] <= write_data;
end
assign read_data = mem[addr[ADDR_BITS+1:2]];
endmodule
