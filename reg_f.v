module reg_f(in_op1_addr,in_op2_addr,in_r0,in_rst,in_data,CLOCK,in_cntrl_regwrite,out_op1_data,out_op2_data);

//input
input [3:0]in_op1_addr,in_op2_addr;
input [15:0] in_r0,in_data;
input in_rst,CLOCK;
input [1:0]in_cntrl_regwrite;

//output
output [15:0] out_op1_data,out_op2_data;

//type
wire [3:0] in_op1_addr,in_op2_addr;
wire [15:0] in_r0,in_data;
wire in_rst,CLOCK;
wire [1:0] in_cntrl_regwrite;

reg [15:0] out_op1_data,out_op2_data;


reg [15:0] reg_mem[15:0];

always @ (negedge CLOCK)
begin
if(in_rst)
	begin
	reg_mem[0] = 16'b0000000000000000;
	reg_mem[1] = 16'b0000111100000000;
	reg_mem[2] = 16'b0000000001010000;
	reg_mem[3] = 16'b1111111100001111;
	reg_mem[4] = 16'b1111000011111111;
	reg_mem[5] = 16'b0000000001000000;
	reg_mem[6] = 16'b0000000000100100;
	reg_mem[7] = 16'b0000000011111111;
	reg_mem[8] = 16'b1010101010101010;
	reg_mem[9] = 16'b0000000000000000;
	reg_mem[10] = 16'b0000000000000000;
	reg_mem[11] = 16'b0000000000000000;
	reg_mem[12] = 16'b1111111111111111;
	reg_mem[13] = 16'b0000000000000010;
	reg_mem[14] = 16'b0000000000000000;
	reg_mem[15] = 16'b0000000000000000;
	end
/*else
	// register write  for lw 
	if(in_cntrl_regwrite == 2'b01)
	begin
	reg_mem[in_op1_addr] <= in_data[15:0];
	end
	//for r0 division
	else 
	if(in_cntrl_regwrite == 2'b10)
	begin
	reg_mem[0] <= in_r0[15:0];
	end
*/	
end

always @(posedge CLOCK)
begin
	// A type read reg file write in buffer
	if (in_cntrl_regwrite == 2'b00)
	begin
	out_op1_data <= reg_mem[in_op1_addr];
	out_op2_data <= reg_mem[in_op2_addr];
	end
	else //branch op1 and r0 comparison
	if (in_cntrl_regwrite == 2'b11)
	begin
	out_op1_data <= reg_mem[in_op1_addr];
	out_op2_data <= reg_mem[0];
	end
	else //lw & sw
	if (in_cntrl_regwrite == 2'b01)
	begin
	out_op1_data <= reg_mem[in_op2_addr];
	out_op2_data <= reg_mem[in_op1_addr];
	end
	else
	if (in_cntrl_regwrite == 2'b10)
	begin
	out_op1_data <= reg_mem[in_op1_addr];
	out_op2_data <= reg_mem[in_op2_addr];
	end
end
endmodule
