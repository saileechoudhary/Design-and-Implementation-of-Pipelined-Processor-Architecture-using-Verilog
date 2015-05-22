`include "ex_buf.v"

module ex_buf_test;

//input
reg [15:0] in_se2,in_op1_data,in_op2_data,in_cntrl_ex;

//output
wire [15:0] out_cntrl_wb,out_op1_m2,out_op2_m3,out_imm_m7,out_ex_haz;
wire out_cntrl_m7;
wire [3:0] out_alu_cntrl;

ex_buf eb(in_se2,in_op1_data,in_op2_data,in_cntrl_ex,out_cntrl_wb,out_op1_m2,out_op2_m3,out_imm_m7,out_ex_haz,out_alu_cntrl,out_cntrl_m7);

initial
begin
in_se2 = 16'b0000000000001101;
#20 in_se2 = 16'b0000111100001111;
#20 in_se2 = 16'b0000101010101010;
#20 in_se2 = 16'b0000101010101010;
#20 in_se2 = 16'b0111100000011111;
#20 in_se2 = 16'b0001101111000000;
#20 in_se2 = 16'b0111111101101000;
#20 in_se2 = 16'b0001000101110101;
#20 in_se2 = 16'b0001111011111111;
#20 in_se2 = 16'b1110000111110000;
#20 in_se2 = 16'b0111101000000000;
#20 in_se2 = 16'b0000101010101010;
#20 in_se2 = 16'b0000101010101010;
#20 in_se2 = 16'b0111100000011111;
#20 in_se2 = 16'b0001101111000000;
#20 in_se2 = 16'b0111111101101000;
#20 in_se2 = 16'b0001000101110101;
#20 in_se2 = 16'b0001111011111111;
#20 in_se2 = 16'b1110000111110000;
#20 in_se2 = 16'b0111101000000000;
end

initial 
begin
in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
#20 in_op1_data = 16'b0000111100001111;
end

initial
begin
in_op2_data = 16'b0101010101010101;
#20 in_op2_data = 16'b0101010101010101;
#20 in_op2_data = 16'b0100000000100001;
#20 in_op2_data = 16'b0000011100000000;
#20 in_op2_data = 16'b0000000000110000;
#20 in_op2_data = 16'b0101010101010101;
#20 in_op2_data = 16'b0100000000100001;
#20 in_op2_data = 16'b0000011100000000;
#20 in_op2_data = 16'b0000000000110000;
#20 in_op2_data = 16'b0101010101010101;
#20 in_op2_data = 16'b0100000000100001;
#20 in_op2_data = 16'b0000011100000000;
#20 in_op2_data = 16'b0000000000110000;
#20 in_op2_data = 16'b0101010101010101;
#20 in_op2_data = 16'b0100000000100001;
#20 in_op2_data = 16'b0000011100000000;
#20 in_op2_data = 16'b0000000000110000;
#20 in_op2_data = 16'b0100000000100001;
#20 in_op2_data = 16'b0000011100000000;
#20 in_op2_data = 16'b0000000000110000;
end

initial
begin
in_cntrl_ex = 16'b0000000000110000;
#20 in_cntrl_ex = 16'b000001110100000;
#20 in_cntrl_ex = 16'b000000000111100;
#20 in_cntrl_ex = 16'b000001110100000;
#20 in_cntrl_ex = 16'b000000000111100;
#20 in_cntrl_ex = 16'b000001110100000;
#20 in_cntrl_ex = 16'b000000000111100;
#20 in_cntrl_ex = 16'b000001110100000;
#20 in_cntrl_ex = 16'b000000000111100;
#20 in_cntrl_ex = 16'b000001110100000;
#20 in_cntrl_ex = 16'b000000000111100;
#20 in_cntrl_ex = 16'b000001110100000;
#20 in_cntrl_ex = 16'b000000000111100;
#20 in_cntrl_ex = 16'b000001110100000;
#20 in_cntrl_ex = 16'b000000000111100;
#20 in_cntrl_ex = 16'b000001110100000;
#20 in_cntrl_ex = 16'b000000000111100;
#20 in_cntrl_ex = 16'b000001110100000;
#20 in_cntrl_ex = 16'b000000000111100;
#20 in_cntrl_ex = 16'b000000000111100;
end

initial 
$monitor ($time,"input fromsign extension is= %b o/ptoWB stage is= %b input tomux 2 is = %b input to mux 3 is= %b input to mux 7 is =%b output for alu control is=%b control to mux 7 is= %b", in_se2[15:0], out_cntrl_wb[15:0], out_op1_m2[15:0], out_op2_m3[15:0], out_imm_m7[15:0], out_alu_cntrl[3:0], out_cntrl_m7);

initial
#600 $finish;

endmodule
