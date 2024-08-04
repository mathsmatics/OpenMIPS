//////////////////////////////////////////////////////////////////////
// Description: ID/EX阶段的寄存器
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module id_ex(
	input wire						clk,
	input wire						rst,
	
	//来自控制模块的信息
	input wire[5:0]					stall,

	//从译码阶段传递的信息
	input wire[`AluOpBus]			id_aluop,
	input wire[`AluSelBus]			id_alusel,
	input wire[`RegBus]				id_reg1,
	input wire[`RegBus]				id_reg2,
	input wire[`RegAddrBus]			id_wd,
	input wire						id_wreg,
	input wire[`RegBus]				id_link_address,
	input wire						id_is_in_delayslot,
	input wire						next_inst_in_delayslot_i,	
	input wire[`RegBus]				id_inst,
	
	//传递到执行阶段的信息
	output reg[`AluOpBus]			ex_aluop,
	output reg[`AluSelBus]			ex_alusel,
	output reg[`RegBus]				ex_reg1,
	output reg[`RegBus]				ex_reg2,
	output reg[`RegAddrBus]			ex_wd,
	output reg						ex_wreg,
	output reg[`RegBus]				ex_link_address,
	output reg						ex_is_in_delayslot,
	output reg						is_in_delayslot_o,
	output reg[`RegBus]				ex_inst
);

	//（1）stall[2] = Stop, stall[3] = NoStop : ‘译码’阶段暂停，
	// ‘执行’阶段继续，所以使用空指令作为下一个周期进入‘执行’阶段的指令
	//（2）stall[2] = NoStop : ‘译码’阶段继续，‘译码’后的指令进入‘执行’阶段
	//（3）stall[2,3] = Stop : 其余情况下，保持‘执行’阶段的寄存器不变
	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			ex_aluop <= `EXE_NOP_OP;
			ex_alusel <= `EXE_RES_NOP;
			ex_reg1 <= `ZeroWord;
			ex_reg2 <= `ZeroWord;
			ex_wd <= `NOPRegAddr;
			ex_wreg <= `WriteDisable;
			ex_link_address <= `ZeroWord;
			ex_is_in_delayslot <= `NotInDelaySlot;
			is_in_delayslot_o <= `NotInDelaySlot;
			ex_inst <= `ZeroWord;
		end 
		else if(stall[2] == `Stop && stall[3] == `NoStop)begin
			ex_aluop <= `EXE_NOP_OP;
			ex_alusel <= `EXE_RES_NOP;
			ex_reg1 <= `ZeroWord;
			ex_reg2 <= `ZeroWord;
			ex_wd <= `NOPRegAddr;
			ex_wreg <= `WriteDisable;
			ex_link_address <= `ZeroWord;
	    	ex_is_in_delayslot <= `NotInDelaySlot;
			ex_inst <= `ZeroWord;
		end
		else if(stall[2] == `NoStop)begin		
			ex_aluop <= id_aluop;
			ex_alusel <= id_alusel;
			ex_reg1 <= id_reg1;
			ex_reg2 <= id_reg2;
			ex_wd <= id_wd;
			ex_wreg <= id_wreg;
			ex_link_address <= id_link_address;
			ex_is_in_delayslot <= id_is_in_delayslot;
	    	is_in_delayslot_o <= next_inst_in_delayslot_i;
			ex_inst <= id_inst;
		end //if
	end //always
	
endmodule