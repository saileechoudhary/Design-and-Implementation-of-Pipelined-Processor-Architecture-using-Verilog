module memory_module(in_mem_addr,in_mem_data,out_mem_data,CLOCK,in_rst,cntrl_mem_read,cntrl_mem_write);

//input
input [15:0] in_mem_addr,in_mem_data;
input cntrl_mem_read,cntrl_mem_write,CLOCK,in_rst;

//output
output [15:0] out_mem_data;

//
wire [15:0] in_mem_addr,in_mem_data;
wire cntrl_mem_read,cntrl_mem_write,CLOCK,in_rst;

reg [15:0] out_mem_data;

reg [6:0] data_mem [15:0];
reg [3:0] i;

always @(negedge CLOCK)

begin
	if(in_rst)
	begin
	data_mem[0]= 16'h1234;
	for (i=1;i<16;i=i+1)
		begin
		data_mem[i] <= 16'b0;
		end
	end

	else
		begin
		//sw
		if(cntrl_mem_write == 1'b1 && cntrl_mem_read == 1'b0)
	       	begin
		data_mem[in_mem_addr] <= in_mem_data;
		out_mem_data = 16'bx;
		end
end
end
always @ (posedge CLOCK)
		//read for lw
		begin
		if(cntrl_mem_write == 1'b0 && cntrl_mem_read == 1'b1)
		begin
                out_mem_data <= data_mem[in_mem_addr];
	//	data_mem[in_mem_addr] <=
		end
end
endmodule

