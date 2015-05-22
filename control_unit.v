module control_unit(in_buf,in_hz,out_reg_write,out_pc_src,out_and,out_ex,CLOCK,in_rst);

//input
input [15:0] in_buf;
input in_hz,in_rst,CLOCK;

//output
output [1:0]out_reg_write;
output out_pc_src,out_and;
output [15:0] out_ex;

//type
wire [15:0] in_buf;
wire in_hz,in_rst,CLOCK;

reg out_reg_write,out_pc_src,out_and;
//reg [3:0] out_alu;
reg [15:0] out_ex;

always @ (negedge CLOCK)
begin
if(in_rst == 1'b1)
begin
out_reg_write = 2'b00;
out_pc_src = 1'b0;
//out_m8 = 1'b0;
//out_comp = 1'b0;
out_and = 1'b0;
//out_alu = 4'b0000;
out_ex = 16'b0000000000000000;
end
end

always@(posedge CLOCK)
begin
//addition
if(in_buf[15:12] == 4'b0000 && in_buf[3:0] == 4'b0000)
begin
out_reg_write = 2'b00;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'bx;
out_and = 1'bx;
//out_alu = 4'b0000;
out_ex = in_buf[15:0];
end

//subtraction
if(in_buf[15:12] == 4'b0000 && in_buf[3:0] == 4'b0001)
begin
out_reg_write = 2'b00;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'bx;
out_and = 1'bx;
//out_alu = 4'b0001;
out_ex = in_buf[15:0];
end

//and
if(in_buf[15:12] == 4'b0000 && in_buf[3:0] == 4'b0010)
begin
out_reg_write = 2'b00;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'bx;
out_and = 1'bx;
//out_alu = 4'b0010;
out_ex = in_buf[15:0];
end

//or
if(in_buf[15:12] == 4'b0000 && in_buf[3:0] == 4'b0011)
begin
out_reg_write = 2'b00;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'bx;
out_and = 1'bx;
//out_alu = 4'b0011;
out_ex = in_buf[15:0];
end

//signed multiplication
if(in_buf[15:12] == 4'b0000 && in_buf[3:0] == 4'b0100)
begin
out_reg_write = 2'b00;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'bx;
out_and = 1'bx;
//out_alu = 4'b0100;
out_ex = in_buf[15:0];
end

//division
if(in_buf[15:12] == 4'b0000 && in_buf[3:0] == 4'b0101)
begin
out_reg_write = 2'b00;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'bx;
out_and = 1'bx;
//out_alu = 4'b0101;
out_ex = in_buf[15:0];
end

//shift left
if(in_buf[15:12] == 4'b0000 && in_buf[3:0] == 4'b1000)
begin
out_reg_write = 2'b00;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'bx;
out_and = 1'bx;
//out_alu = 4'b0110;
out_ex = in_buf[15:0];
end

//shift right
if(in_buf[15:12] == 4'b0000 && in_buf[3:0] == 4'b1001)
begin
out_reg_write = 2'b00;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'bx;
out_and = 1'bx;
//out_alu = 4'b0111;
out_ex = in_buf[15:0];
end

//rotate left
if(in_buf[15:12] == 4'b0000 && in_buf[3:0] == 4'b1010)
begin
out_reg_write = 2'b00;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'bx;
out_and = 1'bx;
//out_alu = 4'b1000;
out_ex = in_buf[15:0];
end

//rotate right
if(in_buf[15:12] == 4'b0000 && in_buf[3:0] == 4'b1011)
begin
out_reg_write = 2'b00;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'bx;
out_and = 1'bx;
//out_alu = 4'b1001;
out_ex = in_buf[15:0];
end

//lw
if(in_buf[15:12] == 4'b1100)
begin
out_reg_write = 2'b01;
out_pc_src = 1'b0;
//out_m8 = 1'b0;
//out_comp = 1'b0;
out_and = 1'b0;
//out_alu = 4'b1010;
out_ex = in_buf[15:0];
end

//sw
if(in_buf[15:12] == 4'b1000)
begin
out_reg_write = 2'bxx;
out_pc_src = 1'bx;
//out_m8 = 1'bx;
//out_comp = 1'b0;
out_and = 1'b0;
//out_alu = 4'b1011;
out_ex = in_buf[15:0];
end

//branch on less than
if(in_buf[15:12] == 4'b0101 && in_buf[3:0] == 4'b0000)
begin
out_reg_write = 2'b11;
out_pc_src = 1'b1;
//out_m8 = 1'b1;
//out_comp = 1'b1;
out_and = 1'b1;
//out_alu = 4'b1100;
out_ex = in_buf[15:0];
end

//branch on greater than
if(in_buf[15:12] == 4'b0110 && in_buf[3:0] == 4'b0000)
begin
out_reg_write = 2'b11;
out_pc_src = 1'b1;
//out_m8 = 1'b1;
//out_comp = 1'b1;
out_and = 1'b1;
//out_alu = 4'b1101;
out_ex = in_buf[15:0];
end

//branch on equal
if(in_buf[15:12] == 4'b0100 && in_buf[3:0] == 4'b0000)
begin
out_reg_write = 2'b11;
out_pc_src = 1'b1;
//out_m8 = 1'b1;
//out_comp = 1'b1;
out_and = 1'b1;
//out_alu = 4'b1110;
out_ex = in_buf[15:0];
end

//jump
if(in_buf[15:12] == 4'b1011 && in_buf[3:0] == 4'b0000)
begin
out_reg_write = 2'bxx;
out_pc_src = 1'b1;
//out_m8 = 1'b0;
//out_comp = 1'b1;
out_and = 1'b1;
//out_alu = 4'bxxxx;
out_ex = 16'b0000000000000000;
end

//halt
if(in_buf[15:12] == 4'b1111 && in_buf[3:0] == 4'b0000)
begin
out_reg_write = 2'bxx;
out_pc_src = 1'b0;
//out_m8 = 1'b0;
//out_comp = 1'b0;
out_and = 1'b0;
//out_alu = 4'bxxxx;
out_ex = 16'b0000000000000000;
end


end
endmodule
