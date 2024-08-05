//////////////////////////////////////////////////////////////////////
// Description:实现了CP0中的一些寄存器，具体有：count、compare、status、
//             cause、EPC、config、PrId
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module cp0_reg(
	input wire						clk,
	input wire						rst,
	
	input wire						we_i,
	input wire[4:0]					waddr_i,
	input wire[4:0]					raddr_i,
	input wire[`RegBus]				data_i,
	
	input wire[5:0]					int_i,
	
	output reg[`RegBus]				data_o,
	output reg[`RegBus]				count_o,
	output reg[`RegBus]				compare_o,
	output reg[`RegBus]				status_o,
	output reg[`RegBus]				cause_o,
	output reg[`RegBus]				epc_o,
	output reg[`RegBus]				config_o,
	output reg[`RegBus]				prid_o,
	
	output reg						timer_int_o
);

/****************************************************************
***********        第一段：对 CP0 中寄存器的写操作        *********
*****************************************************************/

	//status寄存器的CU为0001，表示协处理器CP0存在
	//config寄存器的BE为1，表示Big-Endian；MT为00，表示没有MMU
	//prid:制作者是L，对应的是0x48，类型是0x1，基本类型，版本号是1.0
	always @ (posedge clk) begin
		if(rst == `RstEnable) begin
			count_o <= `ZeroWord;
			compare_o <= `ZeroWord;
			status_o <= 32'b00010000000000000000000000000000;
			cause_o <= `ZeroWord;
			epc_o <= `ZeroWord;
			config_o <= 32'b00000000000000001000000000000000;
			prid_o <= 32'b00000000010011000000000100000010;
			timer_int_o <= `InterruptNotAssert;
		end else begin
			count_o <= count_o + 1 ;
			cause_o[15:10] <= int_i;

			if(compare_o != `ZeroWord && compare_o == count_o) begin
				timer_int_o <= `InterruptAssert;
			end
			
			if(we_i == `WriteEnable) begin
				case (waddr_i) 
				`CP0_REG_COUNT: begin
					count_o <= data_i;
				end
				`CP0_REG_COMPARE: begin
					compare_o <= data_i;
					//count_o <= `ZeroWord;
					timer_int_o <= `InterruptNotAssert;
				end
				`CP0_REG_STATUS: begin
					status_o <= data_i;
				end
				`CP0_REG_EPC:	begin
					epc_o <= data_i;
				end
				`CP0_REG_CAUSE:	begin
					//cause寄存器只有IP[1:0]、IV、WP字段是可写的
					cause_o[9:8] <= data_i[9:8];
					cause_o[23] <= data_i[23];
					cause_o[22] <= data_i[22];
				end					
				endcase //case addr_i
			end
		end //if
	end //always

/****************************************************************
***********        第二段：对 CP0 中寄存器的读操作        *********
*****************************************************************/

	always @ (*) begin
		if(rst == `RstEnable) begin
			data_o <= `ZeroWord;
		end else begin
			case (raddr_i) 
			`CP0_REG_COUNT: begin
				data_o <= count_o;
			end
			`CP0_REG_COMPARE: begin
				data_o <= compare_o;
			end
			`CP0_REG_STATUS: begin
				data_o <= status_o;
			end
			`CP0_REG_CAUSE: begin
				data_o <= cause_o;
			end
			`CP0_REG_EPC: begin
				data_o <= epc_o;
			end
			`CP0_REG_PrId: begin
				data_o <= prid_o;
			end
			`CP0_REG_CONFIG: begin
				data_o <= config_o;
			end	
			default: begin
				data_o <= `ZeroWord;
			end			
			endcase //case addr_i			
		end //if
	end //always

endmodule