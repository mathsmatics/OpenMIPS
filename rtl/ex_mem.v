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

	//为实现加载、访存指令而添加
	input wire[`AluOpBus]			ex_aluop,
	input wire[`RegBus]				ex_mem_addr,
	input wire[`RegBus]				ex_reg2,

	// 乘累加/减增加的输入接口
	input wire[`DoubleRegBus]		hilo_i,
	input wire[1:0]					cnt_i,

	//CP0接口
	input wire						ex_cp0_reg_we,
	input wire[4:0]					ex_cp0_reg_write_addr,
	input wire[`RegBus]				ex_cp0_reg_data,

	//送到访存阶段的信息
	output reg[`RegAddrBus]			mem_wd,
	output reg						mem_wreg,
	output reg[`RegBus]				mem_wdata,
	output reg[`RegBus]				mem_hi,
	output reg[`RegBus]				mem_lo,
	output reg						mem_whilo,

	//为实现加载、访存指令而添加
	output reg[`AluOpBus]			mem_aluop,
	output reg[`RegBus]				mem_mem_addr,
	output reg[`RegBus]				mem_reg2,

	//CP0接口
	output reg						mem_cp0_reg_we,
	output reg[4:0]					mem_cp0_reg_write_addr,
	output reg[`RegBus]				mem_cp0_reg_data,

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
			cnt_o <= 2'b00;
			mem_aluop <= `EXE_NOP_OP;
			mem_mem_addr <= `ZeroWord;
			mem_reg2 <= `ZeroWord;
			mem_cp0_reg_we <= `WriteDisable;
			mem_cp0_reg_write_addr <= 5'b00000;
			mem_cp0_reg_data <= `ZeroWord;
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
  			mem_aluop <= `EXE_NOP_OP;
			mem_mem_addr <= `ZeroWord;
			mem_reg2 <= `ZeroWord;
			mem_cp0_reg_we <= `WriteDisable;
			mem_cp0_reg_write_addr <= 5'b00000;
			mem_cp0_reg_data <= `ZeroWord;
		end
		else if(stall[3] == `NoStop)begin
			mem_wd <= ex_wd;
			mem_wreg <= ex_wreg;
			mem_wdata <= ex_wdata;
			mem_hi <= ex_hi;
			mem_lo <= ex_lo;
			mem_whilo <= ex_whilo;
			hilo_o <= {`ZeroWord,`ZeroWord};
			cnt_o <= 2'b00;
  			mem_aluop <= ex_aluop;
			mem_mem_addr <= ex_mem_addr;
			mem_reg2 <= ex_reg2;
			mem_cp0_reg_we <= ex_cp0_reg_we;
			mem_cp0_reg_write_addr <= ex_cp0_reg_write_addr;
			mem_cp0_reg_data <= ex_cp0_reg_data;
		end
		else begin // why ?
			hilo_o <= hilo_i;
			cnt_o <= cnt_i;
		end //if
	end //always

endmodule