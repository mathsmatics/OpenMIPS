//////////////////////////////////////////////////////////////////////
// Description: 访存阶段
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module mem(
	input wire						rst,

	//来自执行阶段的信息	
	input wire[`RegAddrBus]			wd_i,
	input wire						wreg_i,
	input wire[`RegBus]				wdata_i,
	input wire[`RegBus]				hi_i,
	input wire[`RegBus]				lo_i,
	input wire						whilo_i,

	//为实现加载、访存指令而添加
	input wire[`AluOpBus]			aluop_i,
	input wire[`RegBus]				mem_addr_i,
	input wire[`RegBus]				reg2_i,
	
	//来自memory的信息
	input wire[`RegBus]				mem_data_i,

	//LLbit_i是LLbit寄存器的值
	input wire						LLbit_i,
	//但不一定是最新值，回写阶段可能要写LLbit，所以还要进一步判断
	input wire						wb_LLbit_we_i,
	input wire						wb_LLbit_value_i,

	//协处理器CP0的写信号
	input wire						cp0_reg_we_i,
	input wire[4:0]					cp0_reg_write_addr_i,
	input wire[`RegBus]				cp0_reg_data_i,

	//送到回写阶段的信息
	output reg[`RegAddrBus]			wd_o,
	output reg						wreg_o,
	output reg[`RegBus]				wdata_o,
	output reg[`RegBus]				hi_o,
	output reg[`RegBus]				lo_o,

	output reg						whilo_o,

	//送到memory的信息
	output reg[`RegBus]				mem_addr_o,
	output wire						mem_we_o,
	output reg[3:0]					mem_sel_o,
	output reg[`RegBus]				mem_data_o,
	output reg						mem_ce_o,
	
	//送到LLbit的信息
	output reg						LLbit_we_o,
	output reg						LLbit_value_o,
	
	//协处理器CP0的写信号
	output reg						cp0_reg_we_o,
	output reg[4:0]					cp0_reg_write_addr_o,
	output reg[`RegBus]				cp0_reg_data_o
);

	reg mem_we;
	wire[`RegBus] zero32;

	assign mem_we_o = mem_we;
	assign zero32 = `ZeroWord;

	reg LLbit;

	//获取最新的LLbit的值
	always @ (*) begin
		if(rst == `RstEnable) begin
			LLbit <= 1'b0;
		end else begin
			if(wb_LLbit_we_i == 1'b1) begin
				LLbit <= wb_LLbit_value_i;
			end else begin
				LLbit <= LLbit_i;
			end
		end
	end

	always @ (*) begin
		if(rst == `RstEnable) begin
			wd_o <= `NOPRegAddr;
			wreg_o <= `WriteDisable;
			wdata_o <= `ZeroWord;
			hi_o <= `ZeroWord;
			lo_o <= `ZeroWord;
			whilo_o <= `WriteDisable;

			mem_ce_o <= `ChipDisable;
			mem_we <= `WriteDisable;
			mem_addr_o <= `ZeroWord;
			mem_sel_o <= 4'b0000;
			mem_data_o <= `ZeroWord;

			LLbit_we_o <= 1'b0;
			LLbit_value_o <= 1'b0;
			
			cp0_reg_we_o <= `WriteDisable;
			cp0_reg_write_addr_o <= 5'b00000;
			cp0_reg_data_o <= `ZeroWord;
		end 
		else begin
			wd_o <= wd_i;
			wreg_o <= wreg_i;
			wdata_o <= wdata_i;
			hi_o <= hi_i;
			lo_o <= lo_i;
			whilo_o <= whilo_i;

			mem_ce_o <= `ChipDisable;
			mem_we <= `WriteDisable;
			mem_addr_o <= `ZeroWord;
			mem_sel_o <= 4'b1111;
			mem_data_o <= `ZeroWord;

			LLbit_we_o <= 1'b0;
			LLbit_value_o <= 1'b0;
			
			cp0_reg_we_o <= cp0_reg_we_i;
			cp0_reg_write_addr_o <= cp0_reg_write_addr_i;
			cp0_reg_data_o <= cp0_reg_data_i;
			case (aluop_i)
			`EXE_LB_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteDisable;
				mem_addr_o <= mem_addr_i;
				case (mem_addr_i[1:0])
					2'b00: begin
						mem_sel_o <= 4'b1000;
						wdata_o <= {{24{mem_data_i[31]}},mem_data_i[31:24]};
					end
					2'b01: begin
						mem_sel_o <= 4'b0100;
						wdata_o <= {{24{mem_data_i[23]}},mem_data_i[23:16]};
					end
					2'b10: begin
						mem_sel_o <= 4'b0010;
						wdata_o <= {{24{mem_data_i[15]}},mem_data_i[15:8]};
					end
					2'b11: begin
						mem_sel_o <= 4'b0001;
						wdata_o <= {{24{mem_data_i[7]}},mem_data_i[7:0]};
					end
					default: begin
						wdata_o <= `ZeroWord;
					end
				endcase
			end
			`EXE_LBU_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteDisable;
				mem_addr_o <= mem_addr_i;
				case (mem_addr_i[1:0])
					2'b00: begin
						mem_sel_o <= 4'b1000;
						wdata_o <= {{24{1'b0}},mem_data_i[31:24]};
					end
					2'b01: begin
						mem_sel_o <= 4'b0100;
						wdata_o <= {{24{1'b0}},mem_data_i[23:16]};
					end
					2'b10: begin
						mem_sel_o <= 4'b0010;
						wdata_o <= {{24{1'b0}},mem_data_i[15:8]};
					end
					2'b11: begin
						mem_sel_o <= 4'b0001;
						wdata_o <= {{24{1'b0}},mem_data_i[7:0]};
					end
					default: begin
						wdata_o <= `ZeroWord;
					end
				endcase				
			end
			`EXE_LH_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteDisable;
				mem_addr_o <= mem_addr_i;
				case (mem_addr_i[1:0])
					2'b00: begin
						mem_sel_o <= 4'b1100;
						wdata_o <= {{16{mem_data_i[31]}},mem_data_i[31:16]};
					end
					2'b10: begin
						mem_sel_o <= 4'b0011;
						wdata_o <= {{16{mem_data_i[15]}},mem_data_i[15:0]};
					end
					default: begin
						wdata_o <= `ZeroWord;
					end
				endcase					
			end
			`EXE_LHU_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteDisable;
				mem_addr_o <= mem_addr_i;
				case (mem_addr_i[1:0])
					2'b00: begin
						mem_sel_o <= 4'b1100;
						wdata_o <= {{16{1'b0}},mem_data_i[31:16]};
					end
					2'b10: begin
						mem_sel_o <= 4'b0011;
						wdata_o <= {{16{1'b0}},mem_data_i[15:0]};
					end
					default: begin
						wdata_o <= `ZeroWord;
					end
				endcase				
			end
			`EXE_LW_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteDisable;
				mem_addr_o <= mem_addr_i;
				mem_sel_o <= 4'b1111;
				wdata_o <= mem_data_i;
			end
			`EXE_LWL_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteDisable;
				mem_addr_o <= {mem_addr_i[31:2], 2'b00};
				mem_sel_o <= 4'b1111;
				case (mem_addr_i[1:0])
					2'b00: begin
						wdata_o <= mem_data_i[31:0];
					end
					2'b01: begin
						wdata_o <= {mem_data_i[23:0],reg2_i[7:0]};
					end
					2'b10: begin
						wdata_o <= {mem_data_i[15:0],reg2_i[15:0]};
					end
					2'b11: begin
						wdata_o <= {mem_data_i[7:0],reg2_i[23:0]};
					end
					default: begin
						wdata_o <= `ZeroWord;
					end
				endcase				
			end
			`EXE_LWR_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteDisable;
				mem_addr_o <= {mem_addr_i[31:2], 2'b00};
				mem_sel_o <= 4'b1111;
				case (mem_addr_i[1:0])
					2'b00: begin
						wdata_o <= {reg2_i[31:8],mem_data_i[31:24]};
					end
					2'b01: begin
						wdata_o <= {reg2_i[31:16],mem_data_i[31:16]};
					end
					2'b10: begin
						wdata_o <= {reg2_i[31:24],mem_data_i[31:8]};
					end
					2'b11: begin
						wdata_o <= mem_data_i;
					end
					default: begin
						wdata_o <= `ZeroWord;
					end
				endcase					
			end
			`EXE_SB_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteEnable;
				mem_addr_o <= mem_addr_i;
				mem_data_o <= {reg2_i[7:0],reg2_i[7:0],reg2_i[7:0],reg2_i[7:0]};
				case (mem_addr_i[1:0])
					2'b00: begin
						mem_sel_o <= 4'b1000;
					end
					2'b01: begin
						mem_sel_o <= 4'b0100;
					end
					2'b10: begin
						mem_sel_o <= 4'b0010;
					end
					2'b11: begin
						mem_sel_o <= 4'b0001;
					end
					default: begin
						mem_sel_o <= 4'b0000;
					end
				endcase				
			end
			`EXE_SH_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteEnable;
				mem_addr_o <= mem_addr_i;
				mem_data_o <= {reg2_i[15:0],reg2_i[15:0]};
				case (mem_addr_i[1:0])
					2'b00: begin
						mem_sel_o <= 4'b1100;
					end
					2'b10: begin
						mem_sel_o <= 4'b0011;
					end
					default: begin
						mem_sel_o <= 4'b0000;
					end
				endcase						
			end
			`EXE_SW_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteEnable;
				mem_addr_o <= mem_addr_i;
				mem_data_o <= reg2_i;
				mem_sel_o <= 4'b1111;
			end
			`EXE_SWL_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteEnable;
				mem_addr_o <= {mem_addr_i[31:2], 2'b00};
				case (mem_addr_i[1:0])
					2'b00: begin						  
						mem_sel_o <= 4'b1111;
						mem_data_o <= reg2_i;
					end
					2'b01: begin
						mem_sel_o <= 4'b0111;
						mem_data_o <= {zero32[7:0],reg2_i[31:8]};
					end
					2'b10: begin
						mem_sel_o <= 4'b0011;
						mem_data_o <= {zero32[15:0],reg2_i[31:16]};
					end
					2'b11: begin
						mem_sel_o <= 4'b0001;
						mem_data_o <= {zero32[23:0],reg2_i[31:24]};
					end
					default: begin
						mem_sel_o <= 4'b0000;
					end
				endcase							
			end
			`EXE_SWR_OP: begin
				mem_ce_o <= `ChipEnable;
				mem_we <= `WriteEnable;
				mem_addr_o <= {mem_addr_i[31:2], 2'b00};
				case (mem_addr_i[1:0])
					2'b00: begin						  
						mem_sel_o <= 4'b1000;
						mem_data_o <= {reg2_i[7:0],zero32[23:0]};
					end
					2'b01: begin
						mem_sel_o <= 4'b1100;
						mem_data_o <= {reg2_i[15:0],zero32[15:0]};
					end
					2'b10: begin
						mem_sel_o <= 4'b1110;
						mem_data_o <= {reg2_i[23:0],zero32[7:0]};
					end
					2'b11: begin
						mem_sel_o <= 4'b1111;
						mem_data_o <= reg2_i[31:0];
					end
					default: begin
						mem_sel_o <= 4'b0000;
					end
				endcase											
			end

			`EXE_LL_OP: begin
		  		mem_ce_o <= `ChipEnable;
				mem_we <= `WriteDisable;
				mem_addr_o <= mem_addr_i;
		  		mem_sel_o <= 4'b1111;
		  		LLbit_we_o <= 1'b1;
		  		LLbit_value_o <= 1'b1;
				wdata_o <= mem_data_i;
			end
			`EXE_SC_OP: begin
				if(LLbit == 1'b1) begin
					mem_ce_o <= `ChipEnable;
					mem_we <= `WriteEnable;
					mem_addr_o <= mem_addr_i;
					mem_data_o <= reg2_i;
					mem_sel_o <= 4'b1111;
					LLbit_we_o <= 1'b1;
					LLbit_value_o <= 1'b0;
					wdata_o <= 32'b1;
				end else begin
					wdata_o <= 32'b0;
				end
			end

			default: begin
			end
			endcase
		end //if
	end //always

endmodule