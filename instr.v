//Instruction memory

module instr(in_pc,in_rst,out_instrn,CLOCK);

//input 
input [5:0] in_pc;
input in_rst,CLOCK;

//output
output [15:0] out_instrn;

//type
wire in_rst,CLOCK;
wire [5:0] in_pc;
reg [15:0] out_instrn;

reg [63:0] instr_mem[15:0];

always@(negedge CLOCK)
begin
//Reseting all values
if(in_rst)
begin
instr_mem[0] <= 16'b0000000100100000;
instr_mem[2] <= 16'b0000000100100001;
instr_mem[4] <= 16'b0000001101000010;
instr_mem[6] <= 16'b0000001101000011;
instr_mem[8] <= 16'b0000010101100100;
instr_mem[10] <= 16'b0000000101010101;
instr_mem[12] <= 16'b0000000000000001;
instr_mem[14] <= 16'b0000010001001000;
instr_mem[16] <= 16'b0000010001001001;
instr_mem[18] <= 16'b0000010100101011;
instr_mem[20] <= 16'b0000010100111010;
instr_mem[22] <= 16'b0100011101000000;
instr_mem[24] <= 16'b0000101100010000;
instr_mem[26] <= 16'b0101011101010000;
instr_mem[28] <= 16'b0000101100100000;
instr_mem[30] <= 16'b0110011100100000;
instr_mem[34] <= 16'b0000000100010000;
instr_mem[36] <= 16'b1100100010010000;
instr_mem[38] <= 16'b0000100010000000;
instr_mem[40] <= 16'b1000100010010010;
instr_mem[42] <= 16'b1100101010010010;
instr_mem[44] <= 16'b0000110011000000;
instr_mem[46] <= 16'b0000110111010000;
instr_mem[48] <= 16'b0000110011010000;
instr_mem[50] <= 16'b1110111111111111;
instr_mem[52] <= 16'b0000000000000000;
instr_mem[54] <= 16'b0000000000000000;
instr_mem[56] <= 16'b0000000000000000;
instr_mem[58] <= 16'b0000000000000000;
instr_mem[60] <= 16'b0000000000000000;
instr_mem[62] <= 16'b0000000000000000;
instr_mem[64] <= 16'b0000000000000000;
end
end

always @(posedge CLOCK)
begin
out_instrn[15:0] = instr_mem[in_pc];
end


endmodule
