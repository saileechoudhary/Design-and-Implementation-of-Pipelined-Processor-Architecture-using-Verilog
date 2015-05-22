//Program counter

module pc(m_in,h_in,pc_out,flush_out);

//input
input [5:0] m_in;
input h_in;

//output
output [5:0] pc_out;
output flush_out;

wire [5:0] m_in;
wire h_in;
reg [5:0] pc_out;
reg flush;
reg flush_out;	

always @(*)
begin
if(h_in == 1'b0)
begin
pc_out[5:0] = m_in[5:0];
flush = 1'b0;
end
else
//hazard detected h_in = 1
if (h_in == 1'b1)
begin
pc_out[5:0] = 6'b000000;
flush = 1'b1;
end
flush_out <= flush;
end
endmodule
