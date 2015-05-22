`include "m5.v"

module m5_test;

reg [15:0] in_buf3,in_data_mem;
reg in_cntrl_wb_buf;

wire [15:0] out_reg;

m5 m(in_buf3,in_data_mem,in_cntrl_wb_buf,out_reg);

initial
begin
in_cntrl_wb_buf = 1'b0;
#20 in_cntrl_wb_buf = 1'b0;
#20 in_cntrl_wb_buf = 1'b1;
#20 in_cntrl_wb_buf = 1'b0;
end

initial
begin
in_data_mem = 16'b0000111100001111;
#20 in_data_mem = 16'b0001110101010101;
#20 in_data_mem = 16'b0011010111101101;
#20 in_data_mem = 16'b0000011111100000;
end

initial
begin
in_buf3 = 16'b0001010111110011;
#20 in_buf3 = 16'b0011001100110011;
#20 in_buf3 = 16'b0001010111100000;
#20 in_buf3 = 16'b0001111000001111;
end

initial
$monitor ($time,"cntrl = %b in_buf 3 data = %b in_data_mem = %b output of m5 =%b",in_cntrl_wb_buf,in_buf3[15:0],in_data_mem[15:0],out_reg[15:0]);

initial
#90 $finish;

endmodule
/*
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 08:40 2013
                   0cntrl = 0 in_buf 3 data = 0001010111110011 in_data_mem = 0000111100001111 output of m5 =0001010111110011
                  20cntrl = 0 in_buf 3 data = 0011001100110011 in_data_mem = 0001110101010101 output of m5 =0011001100110011
                  40cntrl = 1 in_buf 3 data = 0001010111100000 in_data_mem = 0011010111101101 output of m5 =0011010111101101
                  60cntrl = 0 in_buf 3 data = 0001111000001111 in_data_mem = 0000011111100000 output of m5 =0001111000001111
$finish called from file "m5_test.v", line 40.
$finish at simulation time                   90
           V C S   S i m u l a t i o n   R e p o r t 
Time: 90
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

