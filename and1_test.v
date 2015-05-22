`include "and1.v"

module and1_test;

//input
reg in_cntrl,in_comp;
wire out_and;

and1 a1(in_cntrl,in_comp,out_and);

initial
begin
in_cntrl = 1'b0;
#20 in_cntrl = 1'b0;
#20 in_cntrl = 1'b1;
#20 in_cntrl = 1'b1;
end

initial
begin
in_comp = 1'b0;
#20 in_comp = 1'b1;
#20 in_comp = 1'b0;
#20 in_comp = 1'b1;
end

initial
$monitor ($time," control is %b comparator input is %b and gate ouput is %b",in_cntrl,in_comp,out_and);

initial
#100
$finish;

endmodule

/* output:
 Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 07:34 2013
                   0 control is 0 comparator input is 0 and gate ouput is 0
                  20 control is 0 comparator input is 1 and gate ouput is 0
                  40 control is 1 comparator input is 0 and gate ouput is 0
                  60 control is 1 comparator input is 1 and gate ouput is 1
$finish called from file "and1_test.v", line 32.
$finish at simulation time                  100
           V C S   S i m u l a t i o n   R e p o r t 
Time: 100
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb
*/
