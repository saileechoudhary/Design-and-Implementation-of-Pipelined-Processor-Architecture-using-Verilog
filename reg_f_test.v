`include "reg_f.v"

module reg_f_test;

//input
reg [3:0] in_op1_addr,in_op2_addr;
reg [15:0] in_r0,in_data;
reg in_rst,CLOCK;
reg [1:0]in_cntrl_regwrite;

//output
wire [15:0] out_op1_data,out_op2_data;

reg [15:0] reg_mem[15:0];
reg_f reg1(in_op1_addr,in_op2_addr,in_r0,in_rst,in_data,CLOCK, in_cntrl_regwrite,out_op1_data,out_op2_data);

initial
begin
in_rst = 1'b1;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
#20 in_rst = 1'b0;
end

initial
begin
in_op1_addr = 4'b0110;
#20 in_op1_addr = 4'b0100;
#20 in_op1_addr = 4'b0100;
#20 in_op1_addr = 4'b0100;
end

initial
begin
in_cntrl_regwrite = 2'b00;
#20 in_cntrl_regwrite = 2'b01;
#20 in_cntrl_regwrite = 2'b10;
#20 in_cntrl_regwrite = 2'b11;
end

initial
begin
in_op2_addr = 4'b0000;
#20 in_op2_addr = 4'b0010;
#20 in_op2_addr = 4'b0110;
#20 in_op2_addr = 4'b1100;
end

initial
begin
in_r0 = 16'b0000000000000000;
#20 in_r0 = 16'b0000000000001111;
#20 in_r0 = 16'b1111000000000000;
#20 in_r0 = 16'b0000000010101011;
end

initial
begin
in_data = 16'b0000000000000011;
#20 in_data = 16'b0000000011001100;
#20 in_data = 16'b0000000000001111;
#20 in_data = 16'b0000000100010000;
end

initial 
begin
CLOCK =1'b0;
forever #10 CLOCK = ~ CLOCK;
end

initial 
$monitor ($time," op1 Addr %b op2 addr %b rst %b reg_write %b r0 %b input data %b op1 data %b op2 data %b data in mem %b content of r0 %b",in_op1_addr[3:0],in_op2_addr[3:0],in_rst,in_cntrl_regwrite[1:0],in_r0[15:0],in_data[15:0],out_op1_data[15:0],out_op2_data[15:0],reg_mem[in_op1_addr],reg_mem[0]);

initial
begin
#200 $finish;
end
endmodule

/* output

Here, writing in reg file takes place in case of lw,a type and division which will take place on posedge of write back. Therefore data in mem = 16'bx and r0 = 16'bx

 Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 07:37 2013
                   0 op1 Addr 0110 op2 addr 0000 rst 1 reg_write 00 r0 0000000000000000 input data 0000000000000011 op1 data xxxxxxxxxxxxxxxx op2 data xxxxxxxxxxxxxxxx data in mem xxxxxxxxxxxxxxxx content of r0 xxxxxxxxxxxxxxxx
                  10 op1 Addr 0110 op2 addr 0000 rst 1 reg_write 00 r0 0000000000000000 input data 0000000000000011 op1 data 0000000000100100 op2 data 0000000000000000 data in mem xxxxxxxxxxxxxxxx content of r0 xxxxxxxxxxxxxxxx
                  20 op1 Addr 0100 op2 addr 0010 rst 0 reg_write 01 r0 0000000000001111 input data 0000000011001100 op1 data 0000000000100100 op2 data 0000000000000000 data in mem xxxxxxxxxxxxxxxx content of r0 xxxxxxxxxxxxxxxx
                  30 op1 Addr 0100 op2 addr 0010 rst 0 reg_write 01 r0 0000000000001111 input data 0000000011001100 op1 data 0000000001010000 op2 data 1111000011111111 data in mem xxxxxxxxxxxxxxxx content of r0 xxxxxxxxxxxxxxxx
                  40 op1 Addr 0100 op2 addr 0110 rst 0 reg_write 10 r0 1111000000000000 input data 0000000000001111 op1 data 0000000001010000 op2 data 1111000011111111 data in mem xxxxxxxxxxxxxxxx content of r0 xxxxxxxxxxxxxxxx
                  50 op1 Addr 0100 op2 addr 0110 rst 0 reg_write 10 r0 1111000000000000 input data 0000000000001111 op1 data 1111000011111111 op2 data 0000000000100100 data in mem xxxxxxxxxxxxxxxx content of r0 xxxxxxxxxxxxxxxx
                  60 op1 Addr 0100 op2 addr 1100 rst 0 reg_write 11 r0 0000000010101011 input data 0000000100010000 op1 data 1111000011111111 op2 data 0000000000100100 data in mem xxxxxxxxxxxxxxxx content of r0 xxxxxxxxxxxxxxxx
                  70 op1 Addr 0100 op2 addr 1100 rst 0 reg_write 11 r0 0000000010101011 input data 0000000100010000 op1 data 1111000011111111 op2 data 0000000000000000 data in mem xxxxxxxxxxxxxxxx content of r0 xxxxxxxxxxxxxxxx
$finish called from file "reg_f_test.v", line 76.
$finish at simulation time                  200
           V C S   S i m u l a t i o n   R e p o r t 
Time: 200
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb
*/
