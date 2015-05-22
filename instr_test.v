//Test bench for Instruction Memory

`include "instr.v"

module instr_test;

//input 
reg [5:0] in_pc;
reg in_rst,CLOCK;

//output
wire [15:0] out_instrn;

reg [63:0] instr_mem[15:0];
instr i(in_pc,in_rst,out_instrn,CLOCK);


initial
begin
in_rst = 1'b1;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
end

initial 
begin
in_pc = 6'b000010;
#20 in_pc = 6'b001000;
#20 in_pc = 6'b000110;
end


initial
begin
CLOCK = 1'b0;
forever #20 CLOCK = ~CLOCK;
end

initial
$monitor ($time,"Flush input =%b pc input = %b output= %b",in_rst,in_pc[5:0],out_instrn[15:0]);

initial
begin
#150
$finish;
end
endmodule

//output
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 07:19 2013
                   0Flush input =1 pc input = 000010 output= xxxxxxxxxxxxxxxx
                  20Flush input =0 pc input = 001000 output= 0000010101100100
                  40Flush input =0 pc input = 000110 output= 0000010101100100
                  60Flush input =0 pc input = 000110 output= 0000001101000011
$finish called from file "instr_test.v", line 45.
$finish at simulation time                  150
           V C S   S i m u l a t i o n   R e p o r t 
Time: 150
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

