module mux7(cntrl_m7,in_m3,in_imm_buf,out_alu);

//Inputs
input wire [15:0] in_m3,in_imm_buf;
input wire cntrl_m7;

//output
output reg [15:0] out_alu;

always @(*)
begin
case(cntrl_m7)
1'b0: out_alu[15:0]=in_imm_buf[15:0];
1'b1: out_alu[15:0]=in_m3[15:0];
endcase
end
endmodule
