//////////////////////////////////////////////////////////////////////
// Description: IF/ID阶段的寄存器
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module if_id(
	input wire						clk,
	input wire						rst,
	
	//来自控制模块的信息
	input wire[5:0]					stall,

	input wire[`InstAddrBus]		if_pc,
	input wire[`InstBus]			if_inst,
	output reg[`InstAddrBus]		id_pc,
	output reg[`InstBus]			id_inst
);

	//（1）stall[1] = Stop, stall[2] =  NoStop : ‘取指’阶段暂停，
	// ‘译码’阶段继续，所以使用空指令作为下一个周期进入‘译码’阶段的指令
	//（2）stall[1] = NoStop : ‘取指’阶段继续，取得的指令进入‘译码’阶段
	//（3）stall[1,2] = Stop : 保持‘译码’阶段的寄存器 id_pc、id_inst 不变
	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			id_pc <= `ZeroWord;
			// id_inst <= `ZeroWord;
			id_inst <= ~(`ZeroWord);//better for debug
		end 
		else if(stall[1] == `Stop && stall[2] == `NoStop)begin
			id_pc <= `ZeroWord;
			id_inst <= `ZeroWord;
		end
		else if(stall[1] == `NoStop)begin
			id_pc <= if_pc;
			id_inst <= if_inst;
		end //if
	end //always

endmodule