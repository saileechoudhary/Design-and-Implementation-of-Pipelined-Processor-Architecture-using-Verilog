module sign_extend2(in_buf,out_m8);

//input
input [3:0] in_buf;

//output
output [15:0] out_m8;

//type
wire [3:0] in_buf;

reg [15:0] out_m8;

always @ (*)
begin
out_m8[3:0] = in_buf[3:0]; 
out_m8[15:4] = 12'b000000000000;
end
endmodule


