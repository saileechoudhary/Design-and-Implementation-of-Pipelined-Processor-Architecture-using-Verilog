`include "forwarding.v"
`include "m2.v"
`include "mux3.v"

module fwd_mux;
//input

reg [3:0] in_op1_buf2,in_op2_buf2;
reg [15:0] in_cntrl_wb;

//output
wire [1:0] out_cntrl_m2,out_cntrl_m3;
reg CLOCK,in_rst;

//m2
//input 
reg [15:0] in_op1_buff2,in_alu_out_buff3,in_m5_m2;
reg [1:0] in_cntrl_m2;

wire [15:0] out_m2;

//m3
reg [15:0] in_op2_buff2,in_alu_outt_buf3,in_m5_m3;
reg [1:0] in_cntrl_m3;

wire [15:0] out_m3;
reg [15:0] m52,aluout;
wire [1:0] cm2,cm3;

forwarding f(.in_op1_buf2(in_op1_buf2),.in_op2_buf2(in_op2_buf2),.in_cntrl_wb(in_cntrl_wb),.out_cntrl_m2(cm2),.out_cntrl_m3(cm3),.CLOCK(CLOCK),.in_rst(in_rst));

m2 mux2(.in_op1_buff2(in_op1_buff2),.in_alu_out_buff3(aluout),.in_m5_m2(m52),.in_cntrl_m2(cm2),.out_m2(out_m2));

mux3 m3(.in_op2_buff2(in_op2_buff2),.in_alu_outt_buf3(aluout),.in_m5_m3(m52),.in_cntrl_m3(cm3),.out_m3(out_m3));

initial
begin
in_rst= 1'b1;
#20 in_rst=1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
end

initial
begin
in_op1_buf2[3:0] = 4'b0010;
#20 in_op1_buf2[3:0] = 4'b0110;
#20 in_op1_buf2[3:0] = 4'b0001;
#20 in_op1_buf2[3:0] = 4'b0001;
end

initial
begin
in_op2_buf2[3:0] = 4'b0011;
#20 in_op2_buf2[3:0] = 4'b0100;
#20 in_op2_buf2[3:0] = 4'b1000;
#20 in_op2_buf2[3:0] = 4'b0010;
end

initial
begin
in_cntrl_wb[15:0] = 16'b0000001000100000;
#20 in_cntrl_wb[15:0] = 16'b0000010001000001;
#20 in_cntrl_wb[15:0] = 16'b1100000100000000;
#20 in_cntrl_wb[15:0] = 16'b0000000100100000;
end


initial
begin
in_op1_buff2[15:0] = 16'b0010101010101001;
#20 in_op1_buff2[15:0] = 16'b0001010101111111;
#20 in_op1_buff2[15:0] = 16'b0001111100000000;
#20 in_op1_buff2[15:0] = 16'b0000000000000000;
end

initial
begin
in_op2_buff2[15:0] = 16'b00001101101010101;
#20 in_op2_buff2[15:0] = 16'b0011001111111111;
#20 in_op2_buff2[15:0] = 16'b0001111110000000;
#20 in_op2_buff2[15:0] = 16'b0000101010101010;
end

initial
begin
m52[15:0] = 16'b0111111100111111;
#20 m52[15:0] = 16'b1100111100000000;
#20 m52[15:0] = 16'b0111001010100000;
#20 m52[15:0] = 16'b0001010101001001;
end

initial
begin
aluout[15:0] = 16'b0000111111000000;
#20 aluout[15:0] = 16'b0000111111111111;
#20 aluout[15:0] = 16'b0001010101010100;
#20 aluout[15:0] = 16'b0000111111100000;
end


initial
begin
CLOCK = 1'b0;
forever #20 CLOCK = ~CLOCK;
end

initial
$monitor($time,"op1 input =%b op2 input=%b op1 data= %b op2 data= %b in_cntrl wb = %b alu out = %b mux 5 output =%b mux 2 output = %b mux3 output =%b cm2 = %b cm3 = %b",in_op1_buf2[3:0],in_op2_buf2[3:0],in_op1_buff2[15:0],in_op2_buff2[15:0],in_cntrl_wb[15:0],aluout[15:0],m52[15:0],out_m2[15:0],out_m3[15:0],cm2[1:0],cm3[1:0]);


initial
#500 $finish;

endmodule

/*
Chronologic VCS simulator copyright 1991-2009
Contains Synopsys proprietary information.
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 10:24 2013
                   0op1 input =0010 op2 input=0011 op1 data= 0010101010101001 op2 data= 0001101101010101 in_cntrl wb = 0000001000100000 alu out = 0000111111000000 mux 5 output =0111111100111111 mux 2 output = xxxxxxxxxxxxxxxx mux3 output =xxxxxxxxxxxxxxxx cm2 = xx cm3 = xx
                  20op1 input =0110 op2 input=0100 op1 data= 0001010101111111 op2 data= 0011001111111111 in_cntrl wb = 0000010001000001 alu out = 0000111111111111 mux 5 output =1100111100000000 mux 2 output = 0001010101111111 mux3 output =0000111111111111 cm2 = 11 cm3 = 01
                  40op1 input =0001 op2 input=1000 op1 data= 0001111100000000 op2 data= 0001111110000000 in_cntrl wb = 1100000100000000 alu out = 0001010101010100 mux 5 output =0111001010100000 mux 2 output = 0001111100000000 mux3 output =0001010101010100 cm2 = 11 cm3 = 01
                  60op1 input =0001 op2 input=0010 op1 data= 0000000000000000 op2 data= 0000101010101010 in_cntrl wb = 0000000100100000 alu out = 0000111111100000 mux 5 output =0001010101001001 mux 2 output = 0000111111100000 mux3 output =0000111111100000 cm2 = 01 cm3 = xx
$finish called from file "fwd_mux.v", line 113.
$finish at simulation time                  500
           V C S   S i m u l a t i o n   R e p o r t 
Time: 500
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

