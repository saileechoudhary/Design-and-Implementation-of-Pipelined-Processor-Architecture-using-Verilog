`include "memory_module.v"

module memory_module_test;

//input
reg [15:0] in_mem_addr,in_mem_data;
reg CLOCK,in_rst,cntrl_mem_read,cntrl_mem_write;

//output
wire [15:0] out_mem_data;

wire [6:0] data_mem [15:0];

memory_module mm(in_mem_addr,in_mem_data,out_mem_data,CLOCK,in_rst,cntrl_mem_read,cntrl_mem_write);

initial
begin
 cntrl_mem_write= 1'b1;
#20 cntrl_mem_write = 1'b0;
#20 cntrl_mem_write = 1'b0;
end

initial
begin
in_mem_addr = 16'b0000000110011010;
#20 in_mem_addr = 16'b0000000000000100;
#20 in_mem_addr = 16'b0000000000000100;
end

initial
begin
cntrl_mem_read = 1'b0;
#20 cntrl_mem_read = 1'b1;
#20 cntrl_mem_read = 1'b1;
end

initial
begin
in_mem_data = 16'b0000000000000100;
#20 in_mem_data = 16'b0000001111111000;
#20 in_mem_data = 16'b0000000000000100;
end
 
initial
begin
in_rst = 1'b1;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
end

initial
begin
CLOCK = 1'b0;
forever #10 CLOCK = ~CLOCK;
end

initial
$monitor ($time,"%b mem_addr  %b mem_data  %b cntrl %b output",in_mem_addr[15:0],in_mem_data[15:0],cntrl_mem_write,out_mem_data[15:0]);

initial
begin
#200 $finish;

end
endmodule 

/*
Chronologic VCS simulator copyright 1991-2009
Contains Synopsys proprietary information.
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 10:17 2013


Error-[OUTMEM] The tool has just run out of memory:
Memory allocated = 2916 MB, Request size = 65536 bytes.
 
