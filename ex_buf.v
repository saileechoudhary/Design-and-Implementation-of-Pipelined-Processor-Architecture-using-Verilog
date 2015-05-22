module ex_buf(in_se2,in_op1_data,in_op2_data,in_cntrl_ex,out_cntrl_wb,out_op1_m2,out_op2_m3,out_imm_m7,out_ex_haz,out_alu_cntrl,out_cntrl_m7);

//in_op2_addr has immediate value op2
//in_se2 is used only in lw & sw as offset for address calculation

//input
input [15:0] in_se2,in_op1_data,in_op2_data;
//input [3:0] in_op2_addr;
input [15:0] in_cntrl_ex;

//output
output [15:0] out_imm_m7,out_cntrl_wb,out_op1_m2,out_op2_m3,out_ex_haz;
output [3:0] out_alu_cntrl;
output out_cntrl_m7;

//type
wire [15:0] in_se2,in_op1_data,in_op2_data;
//wire [3:0] in_op2_addr;
wire [15:0] in_cntrl_ex;

reg [15:0] out_imm_m7,out_cntrl_wb,out_op1_m2,out_op2_m3,out_ex_haz;
reg [3:0] out_alu_cntrl;
reg out_cntrl_m7;

always @(*)
begin
out_cntrl_wb[15:0] <= in_cntrl_ex[15:0];
out_ex_haz[15:0] <= in_cntrl_ex[15:0];

//addition
if (in_cntrl_ex[15:12] == 4'b0000 && in_cntrl_ex[3:0] == 4'b0000)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= in_op2_data[15:0];
out_imm_m7[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_alu_cntrl[3:0] <= 4'b0000;
out_cntrl_m7 <= 1'b1;
end

//subtraction
else
if (in_cntrl_ex[15:12] == 4'b0000 && in_cntrl_ex[3:0] == 4'b0001)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= in_op2_data[15:0];
out_imm_m7[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_alu_cntrl[3:0] <= 4'b0001;
out_cntrl_m7 <= 1'b1;
end

//bitwise or
else
if (in_cntrl_ex[15:12] == 4'b0000 && in_cntrl_ex[3:0] == 4'b0010)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= in_op2_data[15:0];
out_imm_m7[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_alu_cntrl[3:0] <= 4'b0010;
out_cntrl_m7 <= 1'b1;
end

//bitwise and
else
if (in_cntrl_ex[15:12] == 4'b0000 && in_cntrl_ex[3:0] == 4'b0011)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= in_op2_data[15:0];
out_imm_m7[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_alu_cntrl[3:0] <= 4'b0011;
out_cntrl_m7 <= 1'b1;
end

//signed multiplication
else
if (in_cntrl_ex[15:12] == 4'b0000 && in_cntrl_ex[3:0] == 4'b0100)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= in_op2_data[15:0];
out_imm_m7[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_alu_cntrl[3:0] <= 4'b0100;
out_cntrl_m7 <= 1'b1;
end

//signed divison
else
if (in_cntrl_ex[15:12] == 4'b0000 && in_cntrl_ex[3:0] == 4'b0101)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= in_op2_data[15:0];
out_imm_m7[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_alu_cntrl[3:0] <= 4'b0101;
out_cntrl_m7 <= 1'b1;
end

//shift left
else
if (in_cntrl_ex[15:12] == 4'b0000 && in_cntrl_ex[3:0] == 4'b1000)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_imm_m7[15:0] <= in_se2[15:0];
out_alu_cntrl[3:0] <= 4'b0110;
out_cntrl_m7 <= 1'b0;
end

//shift right
else
if (in_cntrl_ex[15:12] == 4'b0000 && in_cntrl_ex[3:0] == 4'b1001)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_imm_m7[15:0] <= in_se2[15:0];
out_alu_cntrl[3:0] <= 4'b0111;
out_cntrl_m7 <= 1'b0;
end

//rotate left
else
if (in_cntrl_ex[15:12] == 4'b0000 && in_cntrl_ex[3:0] == 4'b1010)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_imm_m7[15:0] <= in_se2[15:0];
out_alu_cntrl[3:0] <= 4'b1000;
out_cntrl_m7 <= 1'b0;
end

//rotate right
else
if (in_cntrl_ex[15:12] == 4'b0000 && in_cntrl_ex[3:0] == 4'b1011)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_imm_m7[15:0] <= in_se2[15:0];
out_alu_cntrl[3:0] <= 4'b1001;
out_cntrl_m7 <= 1'b0;
end

//lw
else
if (in_cntrl_ex[15:12] == 4'b1100 && in_cntrl_ex[3:0] == 4'b0000)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= 16'bxxxxxxxxxxxxxxxx;
out_imm_m7[15:0] <= in_se2[15:0];
out_alu_cntrl[3:0] <= 4'b1010;
out_cntrl_m7 <= 1'b0;
end

//sw
else
if (in_cntrl_ex[15:12] == 4'b1000 && in_cntrl_ex[3:0] == 4'b0000)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] <= in_op2_data[15:0];
out_imm_m7[15:0] <= in_se2[15:0];
out_alu_cntrl[3:0] <= 4'b1011;
out_cntrl_m7 <= 1'b0;
end

//branch on less than
else
if (in_cntrl_ex[15:12] == 4'b0101 && in_cntrl_ex[3:0] == 4'b0000)
begin
out_op1_m2[15:0] <= in_op1_data[15:0];
out_op2_m3[15:0] = in_op2_data[15:0]; //r0 value goes through op2_m3
out_imm_m7[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_alu_cntrl[3:0] = 4'b1100;
out_cntrl_m7 = 1'b1;
end

//branch on greater than
else
if (in_cntrl_ex[15:12] == 4'b0110 && in_cntrl_ex[3:0] == 4'b0000)
begin
out_op1_m2[15:0] = in_op1_data[15:0];
out_op2_m3[15:0] = in_op2_data[15:0];
out_imm_m7[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_alu_cntrl[3:0] = 4'b1101;
out_cntrl_m7 = 1'b1;
end

//branch on equal
else
if (in_cntrl_ex[15:12] == 4'b0100 && in_cntrl_ex[3:0] == 4'b0000)
begin
out_op1_m2[15:0] = in_op1_data[15:0];
out_op2_m3[15:0] = in_op2_data[15:0];
out_imm_m7[15:0] = 16'bxxxxxxxxxxxxxxxx;
out_alu_cntrl[3:0] = 4'b1110;
out_cntrl_m7 = 1'b1;
end

end
endmodule

/*
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
Mon Dec  9 10:11:09 2013
[cs20518@olympia:37]> vi id_buf_test.v
[cs20518@olympia:38]> vcs +v2k ex_buf.v
                         Chronologic VCS (TM)
            Version D-2009.12 -- Mon Dec  9 10:12:16 2013
               Copyright (c) 1991-2009 by Synopsys Inc.
                         ALL RIGHTS RESERVED

This program is proprietary and confidential information of Synopsys Inc.
and may be used and disclosed only as authorized in a license agreement
controlling such use and disclosure.

Parsing design file 'ex_buf.v'
Top Level Modules:
       ex_buf
No TimeScale specified
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module ex_buf because:
	This module or some inlined child module(s) has/have been modified.
if [ -x ../simv ]; then chmod -x ../simv; fi
g++  -o ../simv -melf_i386   5NrI_d.o 5NrIB_d.o SJK4_1_d.o rmapats_mop.o rmapats.o SIM_l.o        /titan/software/synopsys09/vcs/linux/lib/libvirsim.a /titan/software/synopsys09/vcs/linux/lib/librterrorinf.so /titan/software/synopsys09/vcs/linux/lib/libsnpsmalloc.so     /titan/software/synopsys09/vcs/linux/lib/libvcsnew.so     /titan/software/synopsys09/vcs/linux/lib/vcs_save_restore_new.o /titan/software/synopsys09/vcs/linux/lib/ctype-stubs_32.a -ldl  -lc -lm -lpthread -ldl    
../simv up to date
CPU time: .068 seconds to compile + .024 seconds to elab + .280 seconds to link
[cs20518@olympia:39]> vcs +v2k -PP ex_buf_test.v
                         Chronologic VCS (TM)
            Version D-2009.12 -- Mon Dec  9 10:12:27 2013
               Copyright (c) 1991-2009 by Synopsys Inc.
                         ALL RIGHTS RESERVED

This program is proprietary and confidential information of Synopsys Inc.
and may be used and disclosed only as authorized in a license agreement
controlling such use and disclosure.


Warning-[ACC_CLI_ON] ACC/CLI capabilities enabled
  ACC/CLI capabilities have been enabled for the entire design. For faster 
  performance enable module specific capability in pli.tab file

Parsing design file 'ex_buf_test.v'
Parsing included file 'ex_buf.v'.
Back to file 'ex_buf_test.v'.
Top Level Modules:
       ex_buf_test
No TimeScale specified
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module ex_buf_test because:
	This module or some inlined child module(s) has/have been modified.
if [ -x ../simv ]; then chmod -x ../simv; fi
g++  -o ../simv -melf_i386   5NrI_d.o 5NrIB_d.o q6VY_1_d.o rmapats_mop.o rmapats.o SIM_l.o        /titan/software/synopsys09/vcs/linux/lib/libvirsim.a /titan/software/synopsys09/vcs/linux/lib/librterrorinf.so /titan/software/synopsys09/vcs/linux/lib/libsnpsmalloc.so     /titan/software/synopsys09/vcs/linux/lib/libvcsnew.so     /titan/software/synopsys09/vcs/linux/lib/vcs_save_restore_new.o /titan/software/synopsys09/vcs/linux/lib/ctype-stubs_32.a -ldl -lm  -lc -lpthread -ldl    
../simv up to date
C



////////////////////////////
Chronologic VCS simulator copyright 1991-2009
Contains Synopsys proprietary information.
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 10:12 2013
                   0input fromsign extension is= 0000000000001101 o/ptoWB stage is= 0000000000110000 input tomux 2 is = 0000111100001111 input to mux 3 is= 0101010101010101 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                  20input fromsign extension is= 0000111100001111 o/ptoWB stage is= 0000001110100000 input tomux 2 is = 0000111100001111 input to mux 3 is= 0101010101010101 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                  40input fromsign extension is= 0000101010101010 o/ptoWB stage is= 0000000000111100 input tomux 2 is = 0000111100001111 input to mux 3 is= 0101010101010101 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                  60input fromsign extension is= 0000101010101010 o/ptoWB stage is= 0000001110100000 input tomux 2 is = 0000111100001111 input to mux 3 is= 0000011100000000 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                  80input fromsign extension is= 0111100000011111 o/ptoWB stage is= 0000000000111100 input tomux 2 is = 0000111100001111 input to mux 3 is= 0000011100000000 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 100input fromsign extension is= 0001101111000000 o/ptoWB stage is= 0000001110100000 input tomux 2 is = 0000111100001111 input to mux 3 is= 0101010101010101 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 120input fromsign extension is= 0111111101101000 o/ptoWB stage is= 0000000000111100 input tomux 2 is = 0000111100001111 input to mux 3 is= 0101010101010101 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 140input fromsign extension is= 0001000101110101 o/ptoWB stage is= 0000001110100000 input tomux 2 is = 0000111100001111 input to mux 3 is= 0000011100000000 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 160input fromsign extension is= 0001111011111111 o/ptoWB stage is= 0000000000111100 input tomux 2 is = 0000111100001111 input to mux 3 is= 0000011100000000 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 180input fromsign extension is= 1110000111110000 o/ptoWB stage is= 0000001110100000 input tomux 2 is = 0000111100001111 input to mux 3 is= 0101010101010101 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 200input fromsign extension is= 0111101000000000 o/ptoWB stage is= 0000000000111100 input tomux 2 is = 0000111100001111 input to mux 3 is= 0101010101010101 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 220input fromsign extension is= 0000101010101010 o/ptoWB stage is= 0000001110100000 input tomux 2 is = 0000111100001111 input to mux 3 is= 0000011100000000 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 240input fromsign extension is= 0000101010101010 o/ptoWB stage is= 0000000000111100 input tomux 2 is = 0000111100001111 input to mux 3 is= 0000011100000000 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 260input fromsign extension is= 0111100000011111 o/ptoWB stage is= 0000001110100000 input tomux 2 is = 0000111100001111 input to mux 3 is= 0101010101010101 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 280input fromsign extension is= 0001101111000000 o/ptoWB stage is= 0000000000111100 input tomux 2 is = 0000111100001111 input to mux 3 is= 0101010101010101 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 300input fromsign extension is= 0111111101101000 o/ptoWB stage is= 0000001110100000 input tomux 2 is = 0000111100001111 input to mux 3 is= 0000011100000000 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 320input fromsign extension is= 0001000101110101 o/ptoWB stage is= 0000000000111100 input tomux 2 is = 0000111100001111 input to mux 3 is= 0000011100000000 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 340input fromsign extension is= 0001111011111111 o/ptoWB stage is= 0000001110100000 input tomux 2 is = 0000111100001111 input to mux 3 is= 0100000000100001 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 360input fromsign extension is= 1110000111110000 o/ptoWB stage is= 0000000000111100 input tomux 2 is = 0000111100001111 input to mux 3 is= 0100000000100001 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
                 380input fromsign extension is= 0111101000000000 o/ptoWB stage is= 0000000000111100 input tomux 2 is = 0000111100001111 input to mux 3 is= 0100000000100001 input to mux 7 is =xxxxxxxxxxxxxxxx output for alu control is=0000 control to mux 7 is= 1
$finish called from file "ex_buf_test.v", line 115.
$finish at simulation time                  600
           V C S   S i m u l a t i o n   R e p o r t 
Time: 600
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb
*/
