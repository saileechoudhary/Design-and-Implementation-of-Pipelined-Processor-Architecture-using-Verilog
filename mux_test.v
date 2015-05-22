`include "mux.v"
module mux_test;

//input
reg cntrl_m7;
reg [15:0] in_imm_buf,in_m3;

//output
wire [15:0] out_alu;

mux7 m7(cntrl_m7,in_imm_buf,in_m3,out_alu);

initial
begin
cntrl_m7 = 1'b1;
#20 cntrl_m7 = 1'b0;
#20 cntrl_m7 = 1'b1;
end

initial
begin
in_imm_buf = 16'b0010000011110000;
#20 in_imm_buf = 16'b1000100010001000;
#20 in_imm_buf = 16'b0001010101010000;
end

initial
begin
in_m3 = 16'b0000000011111111;
#20 in_m3 = 16'b0101010101010101;
#20 in_m3 = 16'b0001111100000000;
end
   
initial
$monitor ($time,"control to m7 = %b immediate value = %b value from m3 = %b output from m7 = %b",cntrl_m7,in_imm_buf[15:0],in_m3[15:0],out_alu[15:0]);

initial
#80 $finish;

endmodule

/*
Contains Synopsys proprietary information.
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 08:30 2013
                   0control to m7 = 1 immediate value = 0010000011110000 value from m3 = 0000000011111111 output from m7 = 0010000011110000
                  20control to m7 = 0 immediate value = 1000100010001000 value from m3 = 0101010101010101 output from m7 = 0101010101010101
                  40control to m7 = 1 immediate value = 0001010101010000 value from m3 = 0001111100000000 output from m7 = 0001010101010000
$finish called from file "mux_test.v", line 38.
$finish at simulation time                   80
           V C S   S i m u l a t i o n   R e p o r t 
Time: 80
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

