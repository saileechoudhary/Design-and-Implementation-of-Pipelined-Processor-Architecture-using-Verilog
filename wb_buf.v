module wb_buf(in_cntrl_ex,in_alu,in_op1_data,out_m5,out_addr_mem,out_data_mem,out_cntrl_m5,out_cntrl_mem_read,out_cntrl_mem_write,CLOCK,in_rst);

//input
input [15:0] in_cntrl_ex,in_alu,in_op1_data;
input CLOCK,in_rst;

//output
output [15:0]out_m5,out_data_mem,out_addr_mem;
output out_cntrl_m5,out_cntrl_mem_read,out_cntrl_mem_write;

//type
wire [15:0] in_cntrl_ex,in_alu,in_op1_data;
wire CLOCK,in_rst;

reg [15:0] out_m5,out_data_mem,out_addr_mem;
reg out_cntrl_m5,out_cntrl_mem_read,out_cntrl_mem_write;

reg [2:0] buf3_mem [15:0];

always @(negedge CLOCK)
begin
if(in_rst)
begin
buf3_mem[0] = 16'b0000000000000000;
buf3_mem[1] = 16'b0000000000000000;
buf3_mem[2] = 16'b0000000000000000;
end

else
if(in_rst == 1'b0)
begin
buf3_mem[0] = in_cntrl_ex[15:0];
buf3_mem[1] = in_alu[15:0];
buf3_mem[2] = in_op1_data[15:0];
end
end

always @(posedge CLOCK)
begin
// For A type instructions, ALU output is forwarded to mux 5.
if (in_cntrl_ex[15:12] == 4'b0000)
begin
out_cntrl_m5 = 1'b1;
out_m5[15:0] = buf3_mem[1]; 
out_cntrl_mem_read = 1'b0;
out_cntrl_mem_write = 1'b0;
out_addr_mem[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_data_mem[15:0] = 16'bxxxxxxxxxxxxxxxx;
end

//for lw instruction, Mux 5 is active with input 0 and on posedge address is read from buffer 3 into data memory 
if(in_cntrl_ex[15:12] == 4'b1100)
begin
out_cntrl_m5 = 1'bx;
out_addr_mem[15:0] <= buf3_mem[1];
out_cntrl_mem_read = 1'b1;
out_cntrl_mem_write = 1'b0;
out_m5[15:0] = 16'bxxxxxxxxxxxxxxxxx;
out_data_mem[15:0] = 16'bxxxxxxxxxxxxxxxx;
end

//for sw instruction, Mux 5 is inactive and on posedge alu input and op1 data is read from buffer
if(in_cntrl_ex[15:12] == 4'b1000)
begin
out_addr_mem[15:0] <= buf3_mem[1];
out_cntrl_m5 = 1'bx;
out_cntrl_mem_read = 1'b0;
out_data_mem[15:0] <= buf3_mem[2];
out_cntrl_mem_write = 1'b1;
out_m5[15:0] = 16'bxxxxxxxxxxxxxxxx;
end

/*if (in_cntrl_ex[15:12] == 4'b0101 || in_cntrl_ex[15:12] == 4'b0110 || in_cntrl_ex[15:12] == 4'b0100 || in_cntrl_ex[15:12] == 4'b1011 || in_cntrl_ex[15:12] == 4'b1111)

begin
out_cntrl_m5 = 1'bx;
out_m5[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_data_mem[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_addr_mem[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_cntrl_mem_read = 1'bx;
out_cntrl_mem_write = 1'bx;
end

//wb for a type
if ( in_cntrl_ex[15:12] == 4'b0000)
begin
out_cntrl_m5 = 1'b1;
out_m5[15:0] = in_alu[15:0];
out_data_mem[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_addr_mem[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_cntrl_mem_read = 1'b0;
out_cntrl_mem_write = 1'b0;
end

//wb for lw
else
if (in_cntrl_ex[15:12] == 4'b1100)
begin
out_cntrl_m5 = 1'b0;
out_m5[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_addr_mem[15:0] = in_alu[15:0];
out_data_mem[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_cntrl_mem_read = 1'b1;
out_cntrl_mem_write = 1'b0;
end

//sw
else
if (in_cntrl_ex[15:12] == 4'b1000)
begin
out_cntrl_m5 = 1'bx;
out_m5[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_addr_mem[15:0] = in_alu[15:0];
out_data_mem[15:0] = in_op1_data[15:0];
out_cntrl_mem_read = 1'b0;
out_cntrl_mem_write = 1'b1;
end
*/
end
endmodule

