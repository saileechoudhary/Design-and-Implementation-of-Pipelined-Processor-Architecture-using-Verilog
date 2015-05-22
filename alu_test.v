//Test bench for ALU

`include "alu.v"
module alu_test;

//Inputs
reg [15:0] in1_m2,in2_m7;
reg [3:0] func_c;
reg [1:0] in_fc;

//Output
wire [15:0] op,out_r0;
wire out_flag, out_oflw;

alu a1(func_c,in_fc,in1_m2,in2_m7,out_r0,op,out_flag,out_oflw);

initial
begin
in_fc = 2'b00;
#20 in_fc = 2'b00;
#20 in_fc = 2'b00;
end

initial
begin
func_c= 4'b0101;
#20 func_c = 4'b0101;
#20 func_c = 4'b0100;
end


initial
begin

in1_m2= 16'b1000000000010100;
#20 in1_m2= 16'b0000000000010100;
#20 in1_m2 =16'b1000000000001011;
end

initial
begin
in2_m7= 16'b0000000000001001;
#20 in2_m7= 16'b0000000000010000;
#20 in2_m7= 16'b0000000000001000;
end

initial 
$monitor($time,"in_fc = %b function code = %b input from mux2 =%b input from mux7 =%b output = %b out_r0= %b out_flag = %b out_overflow = %b",in_fc[1:0],func_c[3:0],in1_m2[15:0],in2_m7[15:0],op[15:0],out_r0[15:0],out_flag,out_oflw);

initial 
#80 $finish;
endmodule
/* output

Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 08:35 2013
                   0in_fc = 00 function code = 0101 input from mux2 =1000000000010100 input from mux7 =0000000000001001 output = 1000000000000010 out_r0= 0000000000000010 out_flag = 0 out_overflow = 0
                  20in_fc = 00 function code = 0101 input from mux2 =0000000000010100 input from mux7 =0000000000010000 output = 0000000000000001 out_r0= 0000000000000100 out_flag = 0 out_overflow = 0
                  40in_fc = 00 function code = 0100 input from mux2 =1000000000001011 input from mux7 =0000000000001000 output = 1000000001011000 out_r0= xxxxxxxxxxxxxxxx out_flag = 0 out_overflow = 1
$finish called from file "alu_test.v", line 51.
$finish at simulation time                   80
           V C S   S i m u l a t i o n   R e p o r t 
Time: 80
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

