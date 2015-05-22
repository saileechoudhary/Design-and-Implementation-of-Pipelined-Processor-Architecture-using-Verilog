module shft(in_se,out_adder2);

//input
input [5:0] in_se;

//output
output [5:0] out_adder2;

//type
wire [5:0] in_se;

reg [5:0] out_adder2;

always @ (*)
begin
out_adder2[5:0] = in_se[5:0] << 1'b1;
end
endmodule
