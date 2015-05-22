//

module adder2(in_buf1_adder1,in_shft,in_and,out_m6);

//input
input [5:0]in_buf1_adder1,in_shft;
input in_and;

//output
output [5:0]out_m6;

//type
wire [5:0] in_buf1_adder1,in_shft;
wire in_and;

reg [5:0] out_m6;

always @ (*)
begin
if( in_and == 1'b1)
begin
out_m6[5:0] = in_buf1_adder1[5:0] + in_shft[5:0];
end
else
if(in_and == 1'b0)
begin
out_m6[5:0] = 6'b000000;
end

end
endmodule
