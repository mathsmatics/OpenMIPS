//////////////////////////////////////////////////////////////////////
// Description: EX/MEM阶段的寄存器
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module ex_mem(
	input wire						clk,
	input wire						rst,

	//来自控制模块的信息
	input wire[5:0]					stall,

	//来自执行阶段的信息	
	input wire[`RegAddrBus]			ex_wd,
	input wire						ex_wreg,
	input wire[`RegBus]				ex_wdata,
	input wire[`RegBus]				ex_hi,
	input wire[`RegBus]				ex_lo,
	input wire						ex_whilo,

	// 乘累加/减增加的输入接口
	input wire[`DoubleRegBus]		hilo_i,
	input wire[1:0]					cnt_i,

	//送到访存阶段的信息
	output reg[`RegAddrBus]			mem_wd,
	output reg						mem_wreg,
	output reg[`RegBus]				mem_wdata,
	output reg[`RegBus]				mem_hi,
	output reg[`RegBus]				mem_lo,
	output reg						mem_whilo,

	// 乘累加/减增加的输出接口
	output reg[`DoubleRegBus]		hilo_o,
	output reg[1:0]					cnt_o
);

	//（1）stall[3] = Stop, stall[4] = NoStop : ‘执行’阶段暂停，
	// ‘访存’阶段继续，所以使用空指令作为下一个周期进入‘访存’阶段的指令
	//（2）stall[3] = NoStop : ‘执行’阶段继续，‘执行’后的指令进入‘访存’阶段
	//（3）stall[3,4] = Stop : 其余情况下，保持‘执行’阶段的寄存器不变
	always @ (posedge clk) begin
		if(rst == `RstEnable) begin
			mem_wd <= `NOPRegAddr;
			mem_wreg <= `WriteDisable;
			mem_wdata <= `ZeroWord;
			mem_hi <= `ZeroWord;
			mem_lo <= `ZeroWord;
			mem_whilo <= `WriteDisable;
			hilo_o <= {`ZeroWord,`ZeroWord};
			cnt_o <= 2'b0;
		end
		else if(stall[3] == `Stop && stall[4] == `NoStop)begin
			mem_wd <= `NOPRegAddr;
			mem_wreg <= `WriteDisable;
			mem_wdata <= `ZeroWord;
			mem_hi <= `ZeroWord;
			mem_lo <= `ZeroWord;
			mem_whilo <= `WriteDisable;
			hilo_o <= hilo_i;
			cnt_o <= cnt_i;
		end
		else if(stall[3] == `NoStop)begin
			mem_wd <= ex_wd;
			mem_wreg <= ex_wreg;
			mem_wdata <= ex_wdata;
			mem_hi <= ex_hi;
			mem_lo <= ex_lo;
			mem_whilo <= ex_whilo;
			hilo_o <= {`ZeroWord,`ZeroWord};
			cnt_o <= 2'b0;
		end
		else begin // why ?
			hilo_o <= hilo_i;
			cnt_o <= cnt_i;
		end //if
	end //always

endmodule