`include "sign_extend.v"

module sign_extend_test;

//input
reg [3:0] in_buf;

//output
wire [5:0] out_shft;

sign_extend se(in_buf,out_shft);

initial
begin
in_buf = 4'b0010;
#20 in_buf = 4'b0100;
#20 in_buf = 4'b1110;
end

initial
$monitor ($time,"input  %b sign extended output %b",in_buf[3:0],out_shft[5:0]);

initial
begin
#60 $finish;
end
endmodule

/* output
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 07:57 2013
                   0input  0010 sign extended output 000010
                  20input  0100 sign extended output 000100
                  40input  1110 sign extended output 001110
$finish called from file "sign_extend_test.v", line 25.
$finish at simulation time                   60
           V C S   S i m u l a t i o n   R e p o r t 
Time: 60
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

