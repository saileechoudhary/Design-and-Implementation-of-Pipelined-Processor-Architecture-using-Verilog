module id_buf(in_instr,in_haz,in_adder1,out_haz,out_cntrl_logic,out_rst,out_adder2,out_op1_addr,out_op2_addr,out_imm_se2);

//input
input [15:0] in_instr;
input in_haz;
input [5:0] in_adder1;

//output
output [15:0] out_haz,out_cntrl_logic;
output out_rst;
output [5:0] out_adder2;
output [3:0]out_op1_addr,out_op2_addr;
output [3:0] out_imm_se2;
//output [15:0] out_op1_buf2,out_op2_buf2;

reg [1:0] buf1[15:0];

//type
wire [15:0] in_instr;
wire in_haz;
wire [5:0] in_adder1;

reg [15:0] out_haz,out_cntrl_logic;
reg out_rst;
reg [5:0] out_adder2;
reg [3:0]out_op1_addr,out_op2_addr;
reg [3:0] out_imm_se2;
//reg [15:0] out_op1_buf2,out_op2_buf2;

always @(*)
begin
if( in_haz == 1'b1)
begin
out_haz[15:0] = 16'b0000000000000000;
out_cntrl_logic[15:0] = 16'b0000000000000000;
out_adder2[5:0] = 6'b000000 ;
out_op1_addr[3:0] = 4'b0000;
out_op2_addr[3:0] = 4'b0000;
//out_m1[3:0] = 4'b0000;
out_rst = 1'b1;
out_imm_se2[3:0] = 4'b0000; 
//out_op1_buf2[15:0] = 16'b0000000000000000;
//out_op2_buf2[15:0] = 16'b0000000000000000;
end

else

if (in_haz == 1'b0)
begin
out_haz[15:0] = in_instr[15:0];			//16 bit instr to hazard detection 
out_cntrl_logic[15:0] = in_instr[15:0];		//16 bit instr to control unit
out_adder2[5:0] = in_adder1[5:0];		//output of adder1 to adder2


//a type
//if ( in_instr[15:12] ==4'b0000 && (in_instr[3:0] == 4'b0000 || in_instr[3:0] == 4'b0001 || in_instr[3:0] == 4'b0010 || in_instr[3:0] == 4'b0011 || in_instr[3:0] == 4'b0100 || in_instr[3:0] == 4'b0101 || in_instr[3:0] == 4'b1000 || in_instr[3:0] == 4'b1001 || in_instr[3:0] == 4'b1010 || in_instr[3:0] == 4'b1011))
//begin 
out_op1_addr[3:0] = in_instr[11:8];		
out_op2_addr[3:0] = in_instr[7:4];
//out_m1[3:0] = 4'bxxxx;
out_rst = 1'b0;
out_imm_se2[3:0] = in_instr[3:0];
//out_op1_buf2[15:0] = in_instr[11:8];
//out_op2_buf2[15:0] = in_instr[7:4];
//end

//b type
//else 
//if ( in_instr[15:12] == 4'b1100 || in_instr[15:12] == 4'b1000 )
//begin
//out_op1_addr[3:0] = in_instr[11:8];             
//out_op2_addr[3:0] = in_instr[3:0];
//out_m1[3:0] = in_instr[7:4];
//out_rst = 1'b0;
//out_imm_se2[3:0] = 4'bxxxx;
//out_op1_buf2[3:0] = in_instr[11:8];
//out_op2_buf2[3:0] = in_instr[7:4];
//end
end
end
endmodule





