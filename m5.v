module m5(in_buf3,in_data_mem,in_cntrl_wb_buf,out_reg);

//input
input [15:0]in_buf3,in_data_mem;
input in_cntrl_wb_buf;

//output
output [15:0] out_reg;

//type
wire [15:0] in_buf3,in_data_mem;
wire in_cntrl_wb_buf;

reg [15:0] out_reg;

always@(*)
begin
case(in_cntrl_wb_buf)
1'b0: out_reg[15:0] = in_buf3[15:0];
1'b1: out_reg[15:0] = in_data_mem[15:0]; 
endcase
end
endmodule
