module forwarding(in_op1_buf2,in_op2_buf2,in_alu_out_buf3,in_cntrl_wb,out_cntrl_m2,out_cntrl_m3,CLOCK,in_rst);

//input
input [3:0] in_op1_buf2,in_op2_buf2;
input [15:0] in_alu_out_buf3,in_cntrl_wb;
input CLOCK,in_rst;

//output 
output [1:0] out_cntrl_m2,out_cntrl_m3;

//type
wire [3:0] in_op1_buf2,in_op2_buf2;
wire [15:0] in_alu_out_buf3,in_cntrl_wb;
wire CLOCK,in_rst;

reg [1:0] out_cntrl_m2,out_cntrl_m3;

always @(negedge CLOCK)
begin
if(in_rst)
begin
out_cntrl_m2[1:0] = 2'bxx;
out_cntrl_m3[1:0] = 2'bxx;
end
end

always @(posedge CLOCK)
begin
//if(in_cntrl_wb[15:12] == 4'b0000)
//begin
if(in_cntrl_wb[11:8] == in_op1_buf2[3:0])
	begin
	out_cntrl_m2[1] = 1'b0;		//if op1 in wb stage is same as op2 in ex stage then forward value from wb stage to op1 of ex stage
	if(in_cntrl_wb[15:12] == 4'b0000)
	out_cntrl_m2[0] = 1'b1;
	else
	if(in_cntrl_wb[15:12] == 4'b1100)
	out_cntrl_m2[0] = 1'b0;
	out_cntrl_m3[1:0] = 2'bxx;
	end
else
if(in_cntrl_wb[11:8] != in_op1_buf2[3:0])
	begin
	out_cntrl_m2[1:0] = 2'b11;
	end


if(in_cntrl_wb[11:8] == in_op2_buf2[3:0])
	begin
	out_cntrl_m3[1] = 1'b0;		//if op1 in wb stage is same as op2 in ex stage then forward value from wb stage to op2 of ex stage
	if(in_cntrl_wb[15:12] == 4'b0000)
	out_cntrl_m3[0] = 1'b1;
	else
	if(in_cntrl_wb[15:12] == 4'b1100)
	out_cntrl_m3[0] = 1'b0;
	end
else
if(in_cntrl_wb[7:4] != in_op2_buf2[3:0])
	out_cntrl_m3[1:0] =2'b11;

end
endmodule
