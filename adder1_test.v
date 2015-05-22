`include "adder1.v"
module adder1_test;
reg x;
wire y;
adder1 add1(x,y);

initial 
begin
x=16'b0010;

#5 y=x+ 16'b00000000000000010;
end

initial
$monitor($time," %b + 2 = %b", x,y);

initial
#10 $finish;
endmodule
