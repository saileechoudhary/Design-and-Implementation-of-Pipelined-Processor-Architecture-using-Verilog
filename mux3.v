module mux3(in_op2_buff2,in_alu_outt_buf3,in_m5_m3,in_cntrl_m3,out_m3);

//input
input [15:0] in_op2_buff2,in_alu_outt_buf3,in_m5_m3;
input [1:0] in_cntrl_m3;

//output
output [15:0] out_m3;

//type
wire [15:0] in_op2_buff2,in_alu_outt_buf3,in_m5_m3;
wire [1:0] in_cntrl_m3;

reg [15:0] out_m3;

always @(*)
begin 
        case(in_cntrl_m3)
        2'b11:out_m3[15:0] = in_op2_buff2[15:0];
	2'b01:out_m3[15:0] = in_alu_outt_buf3[15:0];
        2'b00:out_m3[15:0] = in_m5_m3[15:0];
endcase 
end
endmodule
