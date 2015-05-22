`include "m2.v"

module mux2_test;

//input 
reg [15:0] in_op1_buff2,in_alu_out_buff3,in_m5_m2;
reg [1:0]in_cntrl_m2;

wire [15:0] out_m2;

m2 m2(in_op1_buff2,in_alu_out_buff3,in_m5_m2,in_cntrl_m2,out_m2);

initial
begin
in_cntrl_m2 = 2'b00;
#20 in_cntrl_m2 = 2'b01;
#20 in_cntrl_m2 = 2'b11;
#20 in_cntrl_m2 = 2'b11;
end

initial
begin
in_op1_buff2 = 16'b0000111101100001;
#20 in_op1_buff2 = 16'b0101111010001101;
#20 in_op1_buff2 = 16'b0000111010101000;
#20 in_op1_buff2 = 16'b0000001100011111;
end

initial
begin
in_alu_out_buff3 = 16'b1111111101010101;
#20 in_alu_out_buff3 = 16'b0100000010001101;
#20 in_alu_out_buff3 = 16'b0000000000000000;
#20 in_alu_out_buff3 = 16'b0000001111111111;
end

initial
begin
in_m5_m2 = 16'b0000111101010101;
#20 in_m5_m2 = 16'b0101111010001101;
#20 in_m5_m2 = 16'b0000111010101000;
#20 in_m5_m2 = 16'b1111111111111111;
end

initial
$monitor ($time,"control signal to m2 = %b input from buffer 2 = %b input from mux5 = %b input from alu operation =%b output from mux 2 =%b",in_cntrl_m2[1:0],in_op1_buff2[15:0],in_m5_m2[15:0],in_alu_out_buff3[15:0],out_m2[15:0]);


initial
#100 $finish;

endmodule
/*
 Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 08:25 2013
                   0control signal to m2 = 00 input from buffer 2 = 0000111101100001 input from mux5 = 0000111101010101 input from alu operation =1111111101010101 output from mux 2 =0000111101010101
                  20control signal to m2 = 01 input from buffer 2 = 0101111010001101 input from mux5 = 0101111010001101 input from alu operation =0100000010001101 output from mux 2 =0100000010001101
                  40control signal to m2 = 11 input from buffer 2 = 0000111010101000 input from mux5 = 0000111010101000 input from alu operation =0000000000000000 output from mux 2 =0000111010101000
                  60control signal to m2 = 11 input from buffer 2 = 0000001100011111 input from mux5 = 1111111111111111 input from alu operation =0000001111111111 output from mux 2 =0000001100011111
$finish called from file "mux2_test.v", line 50.
$finish at simulation time                  100
           V C S   S i m u l a t i o n   R e p o r t 
Time: 100
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

