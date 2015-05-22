`include "sign_extend2.v"

module sign_extend2_test;

//input
reg [3:0] in_buf;

//output
wire [15:0] out_m8;

sign_extend2 se2(in_buf,out_m8);

initial
begin
in_buf[3:0] = 4'b0101;
#20 in_buf [3:0] = 4'b1011;
#20 in_buf [3:0] = 4'b0001;
end

initial
$monitor($time,"input from buffer %b output from sign extend %b",in_buf[3:0],out_m8[15:0]);

initial
begin
#80
$finish;
end
endmodule
/* output
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 07:47 2013
                   0input from buffer 0101 output from sign extend 0000000000000101
                  20input from buffer 1011 output from sign extend 0000000000001011
                  40input from buffer 0001 output from sign extend 0000000000000001
$finish called from file "sign_extend2_test.v", line 26.
$finish at simulation time                   80
           V C S   S i m u l a t i o n   R e p o r t 
Time: 80
CPU Time:      0.300 seconds;       Data structure size:   0.0Mb
                                      
