//////////////////////////////////////////////////////////////////////
// Description: MEM/WB阶段的寄存器
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module mem_wb(
	input wire						clk,
	input wire						rst,

	//来自控制模块的信息
	input wire[5:0]					stall,

	//来自访存阶段的信息	
	input wire[`RegAddrBus]			mem_wd,
	input wire						mem_wreg,
	input wire[`RegBus]				mem_wdata,
	input wire[`RegBus]				mem_hi,
	input wire[`RegBus]				mem_lo,
	input wire						mem_whilo,

	//送到回写阶段的信息
	output reg[`RegAddrBus]			wb_wd,
	output reg						wb_wreg,
	output reg[`RegBus]				wb_wdata,
	output reg[`RegBus]				wb_hi,
	output reg[`RegBus]				wb_lo,
	output reg						wb_whilo
);

	//（1）stall[4] = Stop, stall[5] = NoStop : ‘访存’阶段暂停，
	// ‘回写’阶段继续，所以使用空指令作为下一个周期进入‘回写’阶段的指令
	//（2）stall[4] = NoStop : ‘访存’阶段继续，‘访存’后的指令进入‘回写’阶段
	//（3）stall[4,5] = Stop : 其余情况下，保持‘访存’阶段的寄存器不变
	always @ (posedge clk) begin
		if(rst == `RstEnable) begin
			wb_wd <= `NOPRegAddr;
			wb_wreg <= `WriteDisable;
			wb_wdata <= `ZeroWord;
			wb_hi <= `ZeroWord;
			wb_lo <= `ZeroWord;
			wb_whilo <= `WriteDisable;
		end 
		else if(stall[4] == `Stop && stall[5] == `NoStop)begin
			wb_wd <= `NOPRegAddr;
			wb_wreg <= `WriteDisable;
			wb_wdata <= `ZeroWord;
			wb_hi <= `ZeroWord;
			wb_lo <= `ZeroWord;
			wb_whilo <= `WriteDisable;
		end
		else if(stall[4] == `NoStop)begin
			wb_wd <= mem_wd;
			wb_wreg <= mem_wreg;
			wb_wdata <= mem_wdata;
			wb_hi <= mem_hi;
			wb_lo <= mem_lo;
			wb_whilo <= mem_whilo;
		end //if
	end //always
			

endmodule