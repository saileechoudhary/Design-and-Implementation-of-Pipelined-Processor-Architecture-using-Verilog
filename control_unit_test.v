`include "control_unit.v"

module control_unit_test;

//input 
reg [15:0] in_buf;
reg in_hz,in_rst,CLOCK;

//output
wire out_pc_src,out_and;
wire [1:0] out_reg_write;
wire [15:0] out_ex;
//wire [3:0] out_alu;

control_unit cu(in_buf,in_hz,out_reg_write,out_pc_src,out_and,out_ex,CLOCK,in_rst);

initial
begin
in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
end

initial
begin
in_buf = 16'b0000000100100000;
#20 in_buf = 16'b0000000100100001;
#20 in_buf = 16'b0000001101000010;
#20 in_buf = 16'b0000001101000011;
#20 in_buf = 16'b0000010101100100;
#20 in_buf = 16'b0000000101010101;
#20 in_buf = 16'b0000000000000001;
#20 in_buf = 16'b0000010001001000;
#20 in_buf = 16'b0000010000101001;
#20 in_buf = 16'b0000011000101011;
#20 in_buf = 16'b0000011000111010;
#20 in_buf = 16'b0100011101000000;
#20 in_buf = 16'b0000101100010000;
#20 in_buf = 16'b0101011101010000;
#20 in_buf = 16'b0000101100100000;
#20 in_buf = 16'b0110011100100000;
#20 in_buf = 16'b0000000100010000;
#20 in_buf = 16'b0000000100010000;
#20 in_buf = 16'b1100100010010000;
#20 in_buf = 16'b0000100010000000;
#20 in_buf = 16'b1000100010010010;
#20 in_buf = 16'b1100101010010010;
#20 in_buf = 16'b0000110011000000;
#20 in_buf = 16'b0000110111010001;
#20 in_buf = 16'b0000110011010000;
#20 in_buf = 16'b1110111111111111;
end

initial
begin
CLOCK = 1'b0;
forever #20 CLOCK = ~CLOCK;
end

initial
$monitor ($time," buf input instr = %b  input to ex buf = %b out_reg_write = %b out_pc_src = %b out_and = %b",in_buf[15:0],out_ex[15:0],out_reg_write[1:0],out_pc_src,out_and);

initial
begin
#550
$finish;
end

endmodule
/*
Chronologic VCS simulator copyright 1991-2009
Contains Synopsys proprietary information.
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 08:22 2013
                   0 buf input instr = 0000000100100000  input to ex buf = xxxxxxxxxxxxxxxx out_reg_write = 0x out_pc_src = x out_and = x
                  20 buf input instr = 0000000100100001  input to ex buf = 0000000100100001 out_reg_write = 00 out_pc_src = x out_and = x
                  40 buf input instr = 0000001101000010  input to ex buf = 0000000100100001 out_reg_write = 00 out_pc_src = x out_and = x
                  60 buf input instr = 0000001101000011  input to ex buf = 0000001101000011 out_reg_write = 00 out_pc_src = x out_and = x
                  80 buf input instr = 0000010101100100  input to ex buf = 0000001101000011 out_reg_write = 00 out_pc_src = x out_and = x
                 100 buf input instr = 0000000101010101  input to ex buf = 0000000101010101 out_reg_write = 00 out_pc_src = x out_and = x
                 120 buf input instr = 0000000000000001  input to ex buf = 0000000101010101 out_reg_write = 00 out_pc_src = x out_and = x
                 140 buf input instr = 0000010001001000  input to ex buf = 0000010001001000 out_reg_write = 00 out_pc_src = x out_and = x
                 160 buf input instr = 0000010000101001  input to ex buf = 0000010001001000 out_reg_write = 00 out_pc_src = x out_and = x
                 180 buf input instr = 0000011000101011  input to ex buf = 0000011000101011 out_reg_write = 00 out_pc_src = x out_and = x
                 200 buf input instr = 0000011000111010  input to ex buf = 0000011000101011 out_reg_write = 00 out_pc_src = x out_and = x
                 220 buf input instr = 0100011101000000  input to ex buf = 0100011101000000 out_reg_write = 01 out_pc_src = 1 out_and = 1
                 240 buf input instr = 0000101100010000  input to ex buf = 0100011101000000 out_reg_write = 01 out_pc_src = 1 out_and = 1
                 260 buf input instr = 0101011101010000  input to ex buf = 0101011101010000 out_reg_write = 01 out_pc_src = 1 out_and = 1
                 280 buf input instr = 0000101100100000  input to ex buf = 0101011101010000 out_reg_write = 01 out_pc_src = 1 out_and = 1
                 300 buf input instr = 0110011100100000  input to ex buf = 0110011100100000 out_reg_write = 01 out_pc_src = 1 out_and = 1
                 320 buf input instr = 0000000100010000  input to ex buf = 0110011100100000 out_reg_write = 01 out_pc_src = 1 out_and = 1
                 340 buf input instr = 0000000100010000  input to ex buf = 0000000100010000 out_reg_write = 00 out_pc_src = x out_and = x
                 360 buf input instr = 1100100010010000  input to ex buf = 0000000100010000 out_reg_write = 00 out_pc_src = x out_and = x
                 380 buf input instr = 0000100010000000  input to ex buf = 0000100010000000 out_reg_write = 00 out_pc_src = x out_and = x
                 400 buf input instr = 1000100010010010  input to ex buf = 0000100010000000 out_reg_write = 00 out_pc_src = x out_and = x
                 420 buf input instr = 1100101010010010  input to ex buf = 1100101010010010 out_reg_write = 01 out_pc_src = 0 out_and = 0
                 440 buf input instr = 0000110011000000  input to ex buf = 1100101010010010 out_reg_write = 01 out_pc_src = 0 out_and = 0
                 460 buf input instr = 0000110111010001  input to ex buf = 0000110111010001 out_reg_write = 00 out_pc_src = x out_and = x
                 480 buf input instr = 0000110011010000  input to ex buf = 0000110111010001 out_reg_write = 00 out_pc_src = x out_and = x
                 500 buf input instr = 1110111111111111  input to ex buf = 0000110111010001 out_reg_write = 00 out_pc_src = x out_and = x
$finish called from file "control_unit_test.v", line 89.
$finish at simulation time                  550
           V C S   S i m u l a t i o n   R e p o r t 
Time: 550
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

