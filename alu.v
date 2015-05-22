// ALU for performing all A type operations,
// address calculation for B type instructions,
// comparison for C type instructions,
// indicating flag for jump instruction.


module alu(func_c,in_fc,in1_m2,in2_m7,out_r0,op,out_flag,out_oflw);
//Input
input[3:0]func_c;
input [15:0] in1_m2,in2_m7;
input [1:0] in_fc;

//Output
output [15:0] op,out_r0;
output out_flag, out_oflw; 			//set if branch taken 

//type
wire [3:0] func_c;
wire [15:0] in1_m2,in2_m7;
wire [1:0] in_fc;

reg out_flag, out_oflw;
reg [15:0] op,out_r0;

always @(*)
begin
if(in_fc == 2'b00)		// in_fc == 2'b00 for A type instructions
begin 
case (func_c)
//addition
4'b0000:begin
	op[15:0] = in1_m2[15:0]+in2_m7[15:0];
	out_r0[15:0] = 16'bxxxxxxxxxxxxxxxx;
	out_flag = 1'b0;
	if(in2_m7[15] == 1'b1 && in1_m2[15] == 1'b1)
        begin
	out_oflw = 1'b1;
	op[15:0] = 16'bxxxxxxxxxxxxxxxx;
	end
	end

//subtraction
4'b0001:begin
	op[15:0] = in1_m2[15:0]-in2_m7[15:0];
	out_r0[15:0] = 16'bxxxxxxxxxxxxxxxx;
        out_flag = 1'b0;
        if(in2_m7 > in1_m2)
	begin
	op[15:0] = 16'bxxxxxxxxxxxxxxxx;
	out_oflw = 1'b1; 
	end
	end
//bitwise AND
4'b0010:begin
	op[15:0] = in1_m2[15:0] & in2_m7[15:0];
	out_r0[15:0] = 16'bxxxxxxxxxxxxxxxx;
        out_flag = 1'b0;
	out_oflw = 1'b0;
	end

//bitwise or
4'b0011:begin
	op[15:0]  = in1_m2[15:0] | in2_m7[15:0];
	out_r0[15:0] = 16'bxxxxxxxxxxxxxxxx;
        out_flag = 1'b0;
	out_oflw = 1'b0;
	end

//signed multiplication
4'b0100:begin
	op[14:0] = in1_m2[14:0] * in2_m7[14:0];
	op[15] = in1_m2[15]^in2_m7[15];			//XOR 16th bit of both inputs to find sign of output
	out_r0[15:0] = 16'bxxxxxxxxxxxxxxxx;
        out_flag = 1'b0;
	out_oflw = 1'b1;
	end

//signed division
4'b0101:begin
        op[14:0] = in1_m2[14:0] / in2_m7[14:0];
        op[15] = in1_m2[15]^in2_m7[15];			//XOR 16th bit of both inputs to find sign of output
        out_r0[14:0] = in1_m2[14:0] % in2_m7[14:0];	//to get remainder in r0 register
	out_r0[15] = 1'b0;
        out_flag = 1'b0;
	out_oflw = 1'b0;
        end

//shift left
4'b1000:begin
	op[15:0]=in1_m2[15:0]<<in2_m7[15:0];
        out_r0[15:0] = 16'bxxxxxxxxxxxxxxxx;
        out_flag = 1'b0;
	out_oflw = 1'b0;
	end

//shift right
4'b1001:begin
	op[15:0]=in1_m2[15:0]>>in2_m7[15:0];
	out_r0[15:0] = 16'bxxxxxxxxxxxxxxxx;
        out_flag = 1'b0;
	out_oflw = 1'b0;
	end
endcase
end

//lw sw
else 
if(in_fc == 2'b01)			// in_fc = 2'b01 for B type instructions
begin
case(func_c)
4'b0000:begin
	op[15:0] = in1_m2[15:0] + in2_m7[15:0]; //address calculation for lw
	out_r0[15:0] = 16'bxxxxxxxxxxxxxxxx;
        out_flag = 1'b0;
	out_oflw = 1'b0;
	end
4'b0001:begin
	op[15:0] = in1_m2[15:0] + in2_m7[15:0]; //address calculation for sw 
	out_r0[15:0] = 16'bxxxxxxxxxxxxxxxx;
        out_flag = 1'b0;
	out_oflw = 1'b0;
	end
endcase
end

//branch
else
if(in_fc == 2'b10)			//in_fc = 2'b10 for C type instructions and jump
begin
case(func_c)

//branch on less than
4'b0000: begin
	if(in1_m2<in2_m7)
	begin
	out_flag = 1'b1;
	out_oflw = 1'b0;
	op[15:0] = 16'bxxxxxxxxxxxxxxxx;
	end
	end
//branch on greater than
4'b0001:begin
	if(in1_m2>in2_m7)
	begin
	out_flag = 1'b1;
	out_oflw = 1'b0;
	op[15:0] = 16'bxxxxxxxxxxxxxxxx;
	end
	end
//branch on equal
4'b0010:begin
	if(in1_m2 == in2_m7)
	begin
	out_flag = 1'b1;
	out_oflw = 1'b0;
	op[15:0]= 16'bxxxxxxxxxxxxxxxx;
	end
	end
//jump :No arithmetic operation for jump. Only input to and gate is given(out_flag is set).
4'b0011:begin
	op[15:0] = 16'bxxxxxxxxxxxxxxxx;
	out_flag = 1'b1;
	out_oflw = 1'b0;
	end
endcase
end
end
endmodule

