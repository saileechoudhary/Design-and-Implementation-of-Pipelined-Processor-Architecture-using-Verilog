`include "alu_cntrl.v"

module alu_cntrl_test;
//input
reg [3:0]in_func;

wire [1:0] out_fc2;
wire [3:0] out_fc4;

alu_cntrl a(in_func,out_fc2,out_fc4);

initial
begin
in_func = 4'b0000;
#10 in_func = 4'b0001;
#10 in_func = 4'b0010;
#10 in_func = 4'b0011;
#10 in_func = 4'b0100;
#10 in_func = 4'b0101;
#10 in_func = 4'b0110;
#10 in_func = 4'b0111;
#10 in_func = 4'b1000;
#10 in_func = 4'b1001;
#10 in_func = 4'b1010;
#10 in_func = 4'b1011;
#10 in_func = 4'b1100;
#10 in_func = 4'b1101;
#10 in_func = 4'b1110;
end

initial
$monitor ($time,"input function code is %b out_fc2 = %b out_fc4 = %b",in_func[3:0],out_fc2[1:0],out_fc4[3:0]);

initial
#150 $finish;

endmodule
/* 
Contains Synopsys proprietary information.
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 08:38 2013
                   0input function code is 0000 out_fc2 = 00 out_fc4 = 0000
                  10input function code is 0001 out_fc2 = 00 out_fc4 = 0001
                  20input function code is 0010 out_fc2 = 00 out_fc4 = 0010
                  30input function code is 0011 out_fc2 = 00 out_fc4 = 0011
                  40input function code is 0100 out_fc2 = 00 out_fc4 = 0100
                  50input function code is 0101 out_fc2 = 00 out_fc4 = 0101
                  60input function code is 0110 out_fc2 = 00 out_fc4 = 1000
                  70input function code is 0111 out_fc2 = 00 out_fc4 = 1001
                  80input function code is 1000 out_fc2 = 00 out_fc4 = 1010
                  90input function code is 1001 out_fc2 = 00 out_fc4 = 1011
                 100input function code is 1010 out_fc2 = 01 out_fc4 = 0000
                 110input function code is 1011 out_fc2 = 01 out_fc4 = 0001
                 120input function code is 1100 out_fc2 = 10 out_fc4 = 0000
                 130input function code is 1101 out_fc2 = 10 out_fc4 = 0001
                 140input function code is 1110 out_fc2 = 10 out_fc4 = 0010
$finish called from file "alu_cntrl_test.v", line 35.
$finish at simulation time                  150
           V C S   S i m u l a t i o n   R e p o r t 
Time: 150
CPU Time:      0.300 seconds;       Data structure size:   0.0Mb

