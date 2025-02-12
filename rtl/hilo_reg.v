//////////////////////////////////////////////////////////////////////
// Description: 保存乘法结果的HI、LO寄存器
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module hilo_reg(
	input wire						clk,
	input wire						rst,
	
	//写端口
	input wire						we,
	input wire[`RegBus]				hi_i,
	input wire[`RegBus]				lo_i,
	
	//读端口
	output reg[`RegBus]				hi_o,
	output reg[`RegBus]				lo_o
);

	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			hi_o <= `ZeroWord;
			lo_o <= `ZeroWord;
		end else if((we == `WriteEnable)) begin
			hi_o <= hi_i;
			lo_o <= lo_i;
		end
	end

endmodule