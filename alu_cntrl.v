module alu_cntrl(in_func,out_fc2,out_fc4);

//input
input [3:0] in_func;

//output
output [1:0] out_fc2;
output [3:0] out_fc4;

//type
wire [3:0] in_func;

reg [1:0] out_fc2;
reg [3:0] out_fc4;

always@(*)
begin
case( in_func)
//addition
4'b0000:
begin
out_fc2 = 2'b00;
out_fc4 = 4'b0000;
end

//subtraction
4'b0001:
begin
out_fc2 = 2'b00;
out_fc4 = 4'b0001;
end

// bitwise and
4'b0010:
begin
out_fc2 = 2'b00;
out_fc4 = 4'b0010;
end

// bitwise or
4'b0011:
begin
out_fc2 = 2'b00;
out_fc4 = 4'b0011;
end

// signed multiplication
4'b0100:
begin
out_fc2 = 2'b00;
out_fc4 = 4'b0100;
end

//signed division
4'b0101:
begin
out_fc2 = 2'b00;
out_fc4 = 4'b0101;
end

//shift left
4'b0110:
begin
out_fc2 = 2'b00;
out_fc4 = 4'b1000;
end

//shift right
4'b0111:
begin
out_fc2 = 2'b00;
out_fc4 = 4'b1001;
end

//rotate left
4'b1000:
begin
out_fc2 = 2'b00;
out_fc4 = 4'b1010;
end

//rotate right
4'b1001:
begin
out_fc2 = 2'b00;
out_fc4 = 4'b1011;
end

//load
4'b1010:
begin
out_fc2 = 2'b01;
out_fc4 = 4'b0000;
end

//store
4'b1011:
begin
out_fc2 = 2'b01;
out_fc4 = 4'b0001;
end

//branch on less than
4'b1100:
begin
out_fc2 = 2'b10;
out_fc4 = 4'b0000;
end

//branch on greater than
4'b1101:
begin
out_fc2 = 2'b10;
out_fc4 = 4'b0001;
end

//branch on equal
4'b1110:
begin
out_fc2 = 2'b10;
out_fc4 = 4'b0010;
end

endcase
end
endmodule

