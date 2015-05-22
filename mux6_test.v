//Test bench for mux 6
`include "mux6.v"

module mux6_test;

//input
reg [4:0] in_adder1,in_adder2;
reg cntrl_pc_src;

//output
wire [4:0] out_pc;

mux6 m6(in_adder1,in_adder2,out_pc,cntrl_pc_src);

initial
begin
cntrl_pc_src= 1'b0;
#20 cntrl_pc_src = 1'b1;
#20 cntrl_pc_src = 1'b0;
end

initial
begin
in_adder1 = 5'b01000;
#20 in_adder1 = 5'b00100;
#20 in_adder1 = 5'b00010;
end

initial
begin
in_adder2 = 5'b00110;
#20 in_adder2 = 5'b01010;
#20 in_adder2 = 5'b00000;
end

initial
$monitor ($time,"cntrl_pc_src = %b in_adder1 = %b in_adder2 = %b output = %b",cntrl_pc_src,in_adder1[4:0],in_adder2[4:0],out_pc[4:0]);

initial
begin
#80
$finish;
end

endmodule
//output
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 07:31 2013
                   0cntrl_pc_src = 0 in_adder1 = 01000 in_adder2 = 00110 output = 01000
                  20cntrl_pc_src = 1 in_adder1 = 00100 in_adder2 = 01010 output = 01010
                  40cntrl_pc_src = 0 in_adder1 = 00010 in_adder2 = 00000 output = 00010
$finish called from file "mux6_test.v", line 42.
$finish at simulation time                   80
           V C S   S i m u l a t i o n   R e p o r t 
Time: 80
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

