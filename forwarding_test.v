`include "forwarding.v"

module forward_test;

//input
reg [3:0] in_op1_buf2,in_op2_buf2;
reg [15:0] in_alu_out_buf3,in_cntrl_wb;
reg CLOCK,in_rst;

//output
wire [1:0]out_cntrl_m2,out_cntrl_m3;

forwarding fw(in_op1_buf2,in_op2_buf2,in_alu_out_buf3,in_cntrl_wb,out_cntrl_m2,out_cntrl_m3,CLOCK,in_rst);

initial
begin
in_rst = 1'b1;
#20 in_rst =1'b1;
#20 in_rst =1'b1;
end

initial
begin
in_op1_buf2 = 4'b0101;
#20 in_op1_buf2 = 4'b0000;
#20 in_op1_buf2 = 4'b0001;
end

initial
begin
in_op2_buf2 = 4'b0100;
#20 in_op2_buf2 = 4'b0101;
#20 in_op2_buf2 = 4'b0000;
end

initial
begin
in_cntrl_wb = 16'b0000010001100100;
#20 in_cntrl_wb = 16'b0000010001010101;
#20 in_cntrl_wb = 16'b1100000100100000;
end


initial
begin
CLOCK = 1'b0;
forever #10 CLOCK = ~CLOCK;
end

initial
$monitor($time,"in_cntrl_wb = %b,in_op1_buf2 = %b,in_op2_buf2 = %b, out_cntrl_m2 = %b,out_cntrl_m3 =%b",in_cntrl_wb[15:0],in_op1_buf2[3:0],in_op2_buf2[3:0],out_cntrl_m2[1:0],out_cntrl_m3[1:0]);


initial
#80 $finish;


endmodule
/*
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 08:31 2013
                   0in_cntrl_wb = 0000010001100100,in_op1_buf2 = 0101,in_op2_buf2 = 0100, out_cntrl_m2 = xx,out_cntrl_m3 =xx
                  10in_cntrl_wb = 0000010001100100,in_op1_buf2 = 0101,in_op2_buf2 = 0100, out_cntrl_m2 = 11,out_cntrl_m3 =01
                  20in_cntrl_wb = 0000010001010101,in_op1_buf2 = 0000,in_op2_buf2 = 0101, out_cntrl_m2 = xx,out_cntrl_m3 =xx
                  30in_cntrl_wb = 0000010001010101,in_op1_buf2 = 0000,in_op2_buf2 = 0101, out_cntrl_m2 = 11,out_cntrl_m3 =xx
                  40in_cntrl_wb = 1100000100100000,in_op1_buf2 = 0001,in_op2_buf2 = 0000, out_cntrl_m2 = xx,out_cntrl_m3 =xx
                  50in_cntrl_wb = 1100000100100000,in_op1_buf2 = 0001,in_op2_buf2 = 0000, out_cntrl_m2 = 00,out_cntrl_m3 =11
                  60in_cntrl_wb = 1100000100100000,in_op1_buf2 = 0001,in_op2_buf2 = 0000, out_cntrl_m2 = xx,out_cntrl_m3 =xx
                  70in_cntrl_wb = 1100000100100000,in_op1_buf2 = 0001,in_op2_buf2 = 0000, out_cntrl_m2 = 00,out_cntrl_m3 =11
$finish called from file "forwarding_test.v", line 55.
$finish at simulation time                   80
           V C S   S i m u l a t i o n   R e p o r t 
Time: 80
CPU Time:      0.320 seconds;       Data structure size:   0.0Mb

