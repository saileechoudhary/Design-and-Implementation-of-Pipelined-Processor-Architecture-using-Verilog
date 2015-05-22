`include "sign_extend.v"
`include "shft.v"
`include "and1.v"
`include "adder2.v"
`include "mux6.v"
`include "adder1.v"
`include "pc.v"
`include "id_buf.v"
`include "instr.v"

module se_shft;

//sign extend
reg [3:0] in_buf;
wire [5:0] out_shft;

//shift left
reg [5:0] in_se;
wire [5:0] out_adder2;

//and
reg in_cntrl,in_comp;
wire out_and;

//adder2
reg[5:0] in_buf1_adder1,in_shft;
reg in_and;
wire [5:0] out_m6; 

//mux 6
reg[5:0] in_adder1,in_adder2;
reg cntrl_pc_src;

wire[5:0] out_pc;

//adder 1
reg [5:0] pc_val;
wire [5:0] add1_out; 

//pc
reg [5:0] m_in;
reg h_in;
wire [5:0] pc_out;
wire flush_out;

//instr
reg [5:0] in_pc;
reg in_rst;
wire [15:0] out_instrn;
wire CLOCK;

//id_buf
reg [15:0] in_instr;
reg in_haz;
wire [15:0]out_cntrl_logic;
wire out_rst;
wire [5:0] out_adder2;
wire [3:0] out_op1_addr,out_op2_addr,out_imm_se2;

wire [5:0] shft,out,inm6,add1,pc,imem;
wire a;
wire [15:0] ibuf1;


sign_extend se(.in_buf(in_buf),.out_shft(shft));

shft s(.in_se(shft),.out_adder2(out));

and1 abc(.in_cntrl(in_cntrl),.in_comp(in_comp),.out_and(a));

adder2 a2(.in_buf1_adder1(in_buf1_adder1),.in_shft(out),.in_and(a),.out_m6(inm6));

mux6 m(.in_adder1(add1),.in_adder2(inm6),.out_pc(pc),.cntrl_pc_src(cntrl_pc_src));

adder1 a1(.pc_val(imem),.add1_out(add1));
 
pc p(.m_in(pc),.h_in(h_in),.pc_out(imem),.flush_out(flush_out));

instr i(.in_pc(imem),.in_rst(in_rst),.out_instrn(ibuf1),.CLOCK(CLOCK));

id_buf i1(.in_instr(ibuf1),.in_haz(in_haz),.in_adder1(add1),.out_haz(out_haz),.out_cntrl_logic(ibuf1),.out_adder2(add1),.out_op1_addr(out_op1_addr),.out_op2_addr(out_op2_addr),.out_imm_se2(out_imm_se2));

initial
begin
in_buf = 4'b0010;
#20 in_buf = 4'b1001;
#20 in_buf = 4'b1110;
end

initial
$monitor ($time,"input from buffer 1 is %b input to shift unit is %b output of shift left unit is %b",in_buf[3:0],shft[5:0],out_adder2[5:0]);

initial
#100 $finish;

endmodule
/*
Chronologic VCS simulator copyright 1991-2009
Contains Synopsys proprietary information.
Compiler version D-2009.12; Runtime version D-2009.12;  Dec  9 08:52 2013
                   0input from buffer 1 is 0010 input to shift unit is 000010 output of shift left unit is 000100
                  20input from buffer 1 is 1001 input to shift unit is 001001 output of shift left unit is 010010
                  40input from buffer 1 is 1110 input to shift unit is 001110 output of shift left unit is 011100
$finish called from file "se_shft.v", line 31.
$finish at simulation time                  100
           V C S   S i m u l a t i o n   R e p o r t 
Time: 100
CPU Time:      0.300 seconds;    
Mon Dec 
*/
