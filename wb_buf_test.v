`include "wb_buf.v"

module wb_buf_test;

//input
reg [15:0] in_cntrl_ex,in_alu,in_op1_data;
reg CLOCK,in_rst;

//output
wire [15:0] out_m5,out_addr_mem,out_data_mem;
wire out_cntrl_m5,out_cntrl_mem_read,out_cntrl_mem_write;

wb_buf wb(in_cntrl_ex,in_alu,in_op1_data,out_m5,out_addr_mem,out_data_mem,out_cntrl_m5,out_cntrl_mem_read,out_cntrl_mem_write,CLOCK,in_rst);


initial
begin
in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
end

initial
begin
in_cntrl_ex[15:0] = 16'b0000000100100000; //add r1,r2
#20 in_cntrl_ex[15:0] = 16'b0000010001001000; //sal r4,4
#20 in_cntrl_ex[15:0] = 16'b1000100010010010; //sw r8,2(r9)
#20 in_cntrl_ex[15:0] = 16'b1100101010010010; //lw r10,2(r9)
#20 in_cntrl_ex[15:0] = 16'b0100011101000000; //beq r7,4
end

initial
begin
in_alu[15:0] = 16'b0000111101010000;
#20 in_alu[15:0] = 16'b0000111111110000;
#20 in_alu[15:0] = 16'b0000000000000010;
#20 in_alu[15:0] = 16'b0000000000000010;
#20 in_alu[15:0] = 16'bxxxxxxxxxxxxxxxx;
end

initial
begin
in_op1_data[15:0] = 16'b0000000000000000;
#20 in_op1_data[15:0] = 16'b0001111100001111;
#20 in_op1_data[15:0] = 16'b0001110011010100;
#20 in_op1_data[15:0] = 16'b0000011010101010;
#20 in_op1_data[15:0] = 16'b0000000111111000;
end

initial
begin
CLOCK = 1'b0;
forever #10 CLOCK = ~CLOCK;
end

initial
$monitor ($time," in_cntrl_ex = %b in_alu =%b in_op1_data= %b out_m5 = %b out_addr_mem = =%b out_data_mem = %b out_cntrl_m5 = %b out_cntrl_mem-read =%b out_cntrl_mem_write =%b",in_cntrl_ex[15:0],in_alu[15:0],in_op1_data[15:0],out_m5[15:0],out_addr_mem[15:0],out_data_mem[15:0],out_cntrl_m5,out_cntrl_mem_read,out_cntrl_mem_write);

initial
#300 $finish;

endmodule

/*
Chronologic VCS simulator copyright 1991-2009
Contains Synopsys proprietary information.
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 10:16 2013
                   0 in_cntrl_ex = 0000000100100000 in_alu =0000111101010000 in_op1_data= 0000000000000000 out_m5 = xxxxxxxxxxxxxxxx out_addr_mem = =xxxxxxxxxxxxxxxx out_data_mem = xxxxxxxxxxxxxxxx out_cntrl_m5 = x out_cntrl_mem-read =x out_cntrl_mem_write =x
                  10 in_cntrl_ex = 0000000100100000 in_alu =0000111101010000 in_op1_data= 0000000000000000 out_m5 = 0000000000000000 out_addr_mem = =xxxxxxxxxxxxxxxx out_data_mem = xxxxxxxxxxxxxxxx out_cntrl_m5 = 1 out_cntrl_mem-read =0 out_cntrl_mem_write =0
                  20 in_cntrl_ex = 0000010001001000 in_alu =0000111111110000 in_op1_data= 0001111100001111 out_m5 = 0000000000000000 out_addr_mem = =xxxxxxxxxxxxxxxx out_data_mem = xxxxxxxxxxxxxxxx out_cntrl_m5 = 1 out_cntrl_mem-read =0 out_cntrl_mem_write =0
                  40 in_cntrl_ex = 1000100010010010 in_alu =0000000000000010 in_op1_data= 0001110011010100 out_m5 = 0000000000000000 out_addr_mem = =xxxxxxxxxxxxxxxx out_data_mem = xxxxxxxxxxxxxxxx out_cntrl_m5 = 1 out_cntrl_mem-read =0 out_cntrl_mem_write =0
                  50 in_cntrl_ex = 1000100010010010 in_alu =0000000000000010 in_op1_data= 0001110011010100 out_m5 = xxxxxxxxxxxxxxxx out_addr_mem = =0000000000000010 out_data_mem = 0000000000000100 out_cntrl_m5 = x out_cntrl_mem-read =0 out_cntrl_mem_write =1
                  60 in_cntrl_ex = 1100101010010010 in_alu =0000000000000010 in_op1_data= 0000011010101010 out_m5 = xxxxxxxxxxxxxxxx out_addr_mem = =0000000000000010 out_data_mem = 0000000000000100 out_cntrl_m5 = x out_cntrl_mem-read =0 out_cntrl_mem_write =1
                  70 in_cntrl_ex = 1100101010010010 in_alu =0000000000000010 in_op1_data= 0000011010101010 out_m5 = xxxxxxxxxxxxxxxx out_addr_mem = =0000000000000010 out_data_mem = xxxxxxxxxxxxxxxx out_cntrl_m5 = x out_cntrl_mem-read =1 out_cntrl_mem_write =0
                  80 in_cntrl_ex = 0100011101000000 in_alu =xxxxxxxxxxxxxxxx in_op1_data= 0000000111111000 out_m5 = xxxxxxxxxxxxxxxx out_addr_mem = =0000000000000010 out_data_mem = xxxxxxxxxxxxxxxx out_cntrl_m5 = x out_cntrl_mem-read =1 out_cntrl_mem_write =0
$finish called from file "wb_buf_test.v", line 62.
$finish at simulation time                  300
           V C S   S i m u l a t i o n   R e p o r t 
Time: 300
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

