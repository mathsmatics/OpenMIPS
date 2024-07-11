//////////////////////////////////////////////////////////////////////
// Description: 指令指针寄存器PC
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module pc_reg(
	input wire						clk,
	input wire						rst,
	
	//来自控制模块的信息
	input wire [5:0]				stall,

	output reg [`InstAddrBus]		pc,
	output reg						ce
);

	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			ce <= `ChipDisable;
		end else begin
			ce <= `ChipEnable;
		end
	end

	// 当 stall[0]为 NoStop 时，pc 加 4，否则，保持 pc 不变
	always @ (posedge clk) begin
		if (ce == `ChipDisable) begin
			pc <= 32'h00000000;
		end else if(stall[0] == `NoStop) begin
	 		pc <= pc + 4'h4;
		end
	end

endmodule