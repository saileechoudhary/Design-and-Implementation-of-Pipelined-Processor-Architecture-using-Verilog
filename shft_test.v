`include "shft.v"

module shft_test;

//input
reg [5:0]in_se;

//output
wire [5:0] out_adder2;

shft s(in_se,out_adder2);

initial
begin
in_se = 6'b000110;
#20 in_se = 6'b000100;
#20 in_se = 6'b000000;
end


initial
$monitor ($time," input %b shift left output %b",in_se[5:0],out_adder2[5:0]);

initial
begin
#80
$finish;
end

endmodule

/*
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 08:00 2013
                   0 input 000110 shift left output 001100
                  20 input 000100 shift left output 001000
                  40 input 000000 shift left output 000000
$finish called from file "shft_test.v", line 27.
$finish at simulation time                   80
           V C S   S i m u l a t i o n   R e p o r t 
Time: 80
CPU Time:      0.300 seconds;       Data structure size:   0.0Mb

