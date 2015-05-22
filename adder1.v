//Adder 1 for calculating address of next instruction
module adder1(pc_val,add1_out);

input [5:0] pc_val;

//output
output reg [5:0]add1_out;
always @(*)
begin
add1_out[5:0]=pc_val[5:0] + 6'b000010;
end
endmodule

