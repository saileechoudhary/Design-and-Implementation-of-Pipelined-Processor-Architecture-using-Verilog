//Test bench for PC

`include "pc.v"

module pc_test;

//inputs
reg [5:0] m_in;
reg h_in;
reg flush;

//output
wire [5:0] pc_out;
wire flush_out;

pc pc1(m_in,h_in,pc_out,flush_out);
initial
begin
h_in = 1'b1;
#20 h_in = 1'b0;
#20 h_in = 1'b1;
end

initial
begin
m_in = 6'b000101;
#20 m_in = 6'b000001;
#20 m_in = 6'b001001;
end

initial
begin
flush = 1'b0;
#20 flush = 1'b1;
#20 flush = 1'b1;
end

initial
$monitor($time,"h_in = %b m_in = %b pc_out=%b flush_out %b",h_in,m_in[5:0],pc_out[5:0], flush_out);


initial
#40 $finish;

endmodule


//Output for PC:
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 07:09 2013
                   0h_in = 1 m_in = 000101 pc_out=000000 flush_out 1
                  20h_in = 0 m_in = 000001 pc_out=000001 flush_out 0
$finish called from file "pc_test.v", line 43.
$finish at simulation time                   40
           V C S   S i m u l a t i o n   R e p o r t 
Time: 40
CPU Time:      0.310 seconds;       Data structure size:   0.0Mb

