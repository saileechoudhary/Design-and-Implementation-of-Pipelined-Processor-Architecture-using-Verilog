// mux 6 selects address for next instruction from the two inputs from adder1
// and adder2 respectively 
module mux6(in_adder1,in_adder2,out_pc,cntrl_pc_src);

//input
input [5:0] in_adder1,in_adder2;
input cntrl_pc_src;

//output
output [5:0] out_pc;

//type
wire [5:0] in_adder1,in_adder2;
wire cntrl_pc_src;

reg [5:0] out_pc;

always @(*)
begin
//if PCsrc = 0 then address calculated by adder 1 is taken 
if(cntrl_pc_src == 1'b0)
begin
out_pc[5:0] = in_adder1[5:0];
end
else //if PCsrc=1 then address calcuated by adder 2 is considered 
if(cntrl_pc_src == 1'b1)
begin
out_pc[5:0] = in_adder2[5:0];
end
end
endmodule
