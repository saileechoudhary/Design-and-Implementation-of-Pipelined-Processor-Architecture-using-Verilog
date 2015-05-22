module and1(in_cntrl,in_comp,out_and);

//input
input in_cntrl,in_comp;

//output
output out_and;

wire in_cntrl,in_comp;
reg out_and;

always @(*)
begin
out_and = in_cntrl & in_comp;
end
endmodule

