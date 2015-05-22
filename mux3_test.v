`include "mux3.v"

module mux3_test;

//input 
reg [15:0] in_op2_buf2,in_alu_out_buf3,in_m5_m3;
reg [1:0]in_cntrl_m3;

wire [15:0] out_m3;

mux3 m3(in_op2_buf2,in_alu_out_buf3,in_m5_m3,in_cntrl_m3,out_m3);

initial
begin
in_cntrl_m3 = 2'b00;
#20 in_cntrl_m3 = 2'b01;
#20 in_cntrl_m3 = 2'b11;
#20 in_cntrl_m3 = 2'b11;
end

initial
begin
in_op2_buf2 = 16'b0000111101100001;
#20 in_op2_buf2 = 16'b0101111010001101;
#20 in_op2_buf2 = 16'b0000111010101000;
#20 in_op2_buf2 = 16'b0000001100011111;
end

initial
begin
in_alu_out_buf3 = 16'b1111111101010101;
#20 in_alu_out_buf3 = 16'b0100000010001101;
#20 in_alu_out_buf3 = 16'b0000000000000000;
#20 in_alu_out_buf3 = 16'b0000001111111111;
end

initial
begin
in_m5_m3 = 16'b0000111101010101;
#20 in_m5_m3 = 16'b0101111010001101;
#20 in_m5_m3 = 16'b0000111010101000;
#20 in_m5_m3 = 16'b1111111111111111;
end

initial
$monitor ($time,"control signal to m3 = %b input from buffer 2 = %b input from mux5 = %b input from alu operation =%b output from mux 3 =%b",in_cntrl_m3[1:0],in_op2_buf2[15:0],in_m5_m3[15:0],in_alu_out_buf3[15:0],out_m3[15:0]);


initial
#100 $finish;

endmodule
                                                                                              
/*
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 08:27 2013
                   0control signal to m3 = 00 input from buffer 2 = 0000111101100001 input from mux5 = 0000111101010101 input from alu operation =1111111101010101 output from mux 3 =0000111101010101
                  20control signal to m3 = 01 input from buffer 2 = 0101111010001101 input from mux5 = 0101111010001101 input from alu operation =0100000010001101 output from mux 3 =0100000010001101
                  40control signal to m3 = 11 input from buffer 2 = 0000111010101000 input from mux5 = 0000111010101000 input from alu operation =0000000000000000 output from mux 3 =0000111010101000
                  60control signal to m3 = 11 input from buffer 2 = 0000001100011111 input from mux5 = 1111111111111111 input from alu operation =0000001111111111 output from mux 3 =0000001100011111
$finish called from file "mux3_test.v", line 50.
$finish at simulation time                  100
           V C S   S i m u l a t i o n   R e p o r t 
Time: 100
CPU Time:      0.300 seconds;       Data structure size:   0.0Mb

