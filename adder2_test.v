`include "adder2.v"

module adder2_test;

//input
reg [5:0]in_buf1_adder1,in_shft;
reg in_and;

//output
wire [5:0] out_m6;

adder2 a(in_buf1_adder1,in_shft,in_and,out_m6);

initial
begin
in_buf1_adder1 = 6'b001100;
#20 in_buf1_adder1 = 6'b000000;
#20 in_buf1_adder1 = 6'b001000;
end

initial
begin
in_shft= 6'b001100;
#20 in_shft = 6'b000110;
#20 in_shft = 6'b001010;
end

initial
begin
in_and = 1'b1;
#20 in_and = 1'b0;
#20 in_and = 1'b1;
end

initial
$monitor ($time,"input from buffer is %b shft input is %b and gate input is %b output is %b",in_buf1_adder1[5:0],in_shft[5:0],in_and,out_m6[5:0]);

initial
begin
#80
$finish;
end
endmodule

/*output
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 07:32 2013
                   0input from buffer is 001100 shft input is 001100 and gate input is 1 output is 011000
                  20input from buffer is 000000 shft input is 000110 and gate input is 0 output is 000000
                  40input from buffer is 001000 shft input is 001010 and gate input is 1 output is 010010
$finish called from file "adder2_test.v", line 41.
$finish at simulation time                   80
           V C S   S i m u l a t i o n   R e p o r t 
Time: 80
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb
*/
