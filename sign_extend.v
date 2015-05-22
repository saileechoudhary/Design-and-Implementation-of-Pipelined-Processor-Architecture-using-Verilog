module sign_extend(in_buf,out_shft);

//input
input [3:0] in_buf;

//output
output [5:0] out_shft;

//type
wire [3:0] in_buf;

reg [5:0] out_shft;

always @ (*)
begin
out_shft[3:0] = in_buf[3:0];
 out_shft[5:4] = 2'b00;
end
endmodule

