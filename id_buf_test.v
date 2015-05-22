`include "id_buf.v"

module id_buf_test;

//input
reg [15:0] in_instr;
reg in_haz;
reg [5:0] in_adder1;

//output
wire [15:0] out_haz,out_cntrl_logic;
wire out_rst;
wire [5:0] out_adder2;
wire [3:0] out_op1_addr,out_op2_addr;
//wire [15:0] out_op1_buf2,out_op2_bf2;
wire [3:0] out_imm_se2;

reg [1:0] buf1[15:0];

id_buf ib(in_instr,in_haz,in_adder1,out_haz,out_cntrl_logic,out_rst,out_adder2,out_op1_addr,out_op2_addr,out_imm_se2);

initial
begin
in_instr[15:0] = 16'b0000010101100100;
#20 in_instr[15:0] = 16'b0000000101010101;
#20 in_instr[15:0] = 16'b0000000000000001;
#20 in_instr[15:0] = 16'b0000010001001000;
#20 in_instr[15:0] = 16'b0000010000101001;
end

initial
begin
in_haz = 1'b0;
#20 in_haz = 1'b0;
#20 in_haz = 1'b0;
#20 in_haz = 1'b0;
#20 in_haz = 1'b1;
end

initial
begin
in_adder1 = 6'b000101;
#20 in_adder1 = 6'b001011;
#20 in_adder1 = 6'b000100;
#20 in_adder1 = 6'b001000;
#20 in_adder1 = 6'b010101;
end

initial
$monitor ($time,"input instr = %b input to adder 2 = %b rst =%b op1 addr= %b op2 addr = %b se = %b",in_instr[15:0],out_adder2[5:0],out_rst,out_op1_addr[3:0],out_op2_addr,out_imm_se2);

initial
begin
#120 
$finish;
end
endmodule

/*
CPU time: .074 seconds to compile + .022 seconds to elab + .280 seconds to link
[cs20518@olympia:36]> simv
Chronologic VCS simulator copyright 1991-2009
Contains Synopsys proprietary information.
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 10:11 2013
                   0input instr = 0000010101100100 input to adder 2 = 000101 rst =0 op1 addr= 0101 op2 addr = 0110 se = 0100
                  20input instr = 0000000101010101 input to adder 2 = 001011 rst =0 op1 addr= 0001 op2 addr = 0101 se = 0101
                  40input instr = 0000000000000001 input to adder 2 = 000100 rst =0 op1 addr= 0000 op2 addr = 0000 se = 0001
                  60input instr = 0000010001001000 input to adder 2 = 001000 rst =0 op1 addr= 0100 op2 addr = 0100 se = 1000
                  80input instr = 0000010000101001 input to adder 2 = 000000 rst =1 op1 addr= 0000 op2 addr = 0000 se = 0000
$finish called from file "id_buf_test.v", line 55.
$finish at simulation time                  120
           V C S   S i m u l a t i o n   R e p o r t 
Time: 120
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

