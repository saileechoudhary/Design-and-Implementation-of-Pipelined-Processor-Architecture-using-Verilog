module m2(in_op1_buff2,in_alu_out_buff3,in_m5_m2,in_cntrl_m2,out_m2);


input [15:0] in_op1_buff2,in_alu_out_buff3,in_m5_m2;
input [1:0] in_cntrl_m2;

//output
output [15:0] out_m2;

//type
wire [15:0] in_op1_buff2,in_alu_out_buff3,in_m5_m2;
wire [1:0] in_cntrl_m2;

reg [15:0] out_m2;

always @(*)
begin 
       case(in_cntrl_m2)
        2'b11:out_m2[15:0] = in_op1_buff2[15:0];
        2'b01:out_m2[15:0] = in_alu_out_buff3[15:0];
        2'b00:out_m2[15:0] = in_m5_m2[15:0];
          endcase 
          end
          endmodule

