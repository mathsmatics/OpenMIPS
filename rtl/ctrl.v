//////////////////////////////////////////////////////////////////////
// Description: 控制模块，控制流水线的刷新、暂停等
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module ctrl(
	input wire						rst,
	input wire						stallreq_from_id,
	input wire						stallreq_from_ex,
	output reg[5:0]					stall       
);

	// stall[0] 表示取指地址 PC 是否保持不变，为 1 表示保持不变。
	// stall[1] 表示流水线 取指 阶段是否暂停，为 1 表示暂停。
	// stall[2] 表示流水线 译码 阶段是否暂停，为 1 表示暂停。
	// stall[3] 表示流水线 执行 阶段是否暂停，为 1 表示暂停。
	// stall[4] 表示流水线 访存 阶段是否暂停，为 1 表示暂停。
	// stall[5] 表示流水线 回写 阶段是否暂停，为 1 表示暂停。

	always @ (*) begin
		if(rst == `RstEnable) begin
			stall <= 6'b000000;
		end else if(stallreq_from_ex == `Stop) begin
			stall <= 6'b001111;
		end else if(stallreq_from_id == `Stop) begin
			stall <= 6'b000111;
		end else begin
			stall <= 6'b000000;
		end //if
	end //always

endmodule