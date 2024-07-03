//////////////////////////////////////////////////////////////////////
// Description: 译码阶段
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module id(
	input wire						rst,
	input wire[`InstAddrBus]		pc_i,
	input wire[`InstBus]			inst_i,

	input wire[`RegBus]				reg1_data_i,
	input wire[`RegBus]				reg2_data_i,

	//处于执行阶段的指令要写入的目的寄存器信息
	input wire						ex_wreg_i,
	input wire[`RegBus]				ex_wdata_i,
	input wire[`RegAddrBus]			ex_wd_i,
	
	//处于访存阶段的指令要写入的目的寄存器信息
	input wire						mem_wreg_i,
	input wire[`RegBus]				mem_wdata_i,
	input wire[`RegAddrBus]			mem_wd_i,

	//送到regfile的信息
	output reg						reg1_read_o,
	output reg						reg2_read_o,
	output reg[`RegAddrBus]			reg1_addr_o,
	output reg[`RegAddrBus]			reg2_addr_o,      
	
	//送到执行阶段的信息
	output reg[`AluOpBus]			aluop_o,
	output reg[`AluSelBus]			alusel_o,
	output reg[`RegBus]				reg1_o,
	output reg[`RegBus]				reg2_o,
	output reg[`RegAddrBus]			wd_o,
	output reg						wreg_o
);

	wire[5:0] op = inst_i[31:26];// 指令码
	wire[4:0] op2 = inst_i[10:6];// sa
	wire[5:0] op3 = inst_i[5:0];// 功能码
	wire[4:0] op4 = inst_i[20:16];// rt
	reg[`RegBus] imm;
	reg instvalid;

	always @ (*) begin
		if (rst == `RstEnable) begin
			aluop_o <= `EXE_NOP_OP;
			alusel_o <= `EXE_RES_NOP;
			wd_o <= `NOPRegAddr;
			wreg_o <= `WriteDisable;
			reg1_read_o <= 1'b0;
			reg2_read_o <= 1'b0;
			reg1_addr_o <= `NOPRegAddr;
			reg2_addr_o <= `NOPRegAddr;
			imm <= 32'h0;
			instvalid <= `InstInvalid;
	  	end else begin
			aluop_o <= `EXE_NOP_OP;
			alusel_o <= `EXE_RES_NOP;
			wd_o <= inst_i[15:11];// rd
			wreg_o <= `WriteDisable;
			reg1_read_o <= 1'b0;
			reg2_read_o <= 1'b0;
			reg1_addr_o <= inst_i[25:21];// rs
			reg2_addr_o <= inst_i[20:16];// rt
			imm <= `ZeroWord;
			instvalid <= `InstInvalid;
			
			case (op)
			`EXE_SPECIAL_INST: begin
				case (op2)
				5'b00000: begin
					case (op3)
					`EXE_OR: begin //or 指令
						aluop_o <= `EXE_OR_OP;
						alusel_o <= `EXE_RES_LOGIC;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_AND: begin //and 指令
						aluop_o <= `EXE_AND_OP;
						alusel_o <= `EXE_RES_LOGIC;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_XOR: begin //xor 指令
						aluop_o <= `EXE_XOR_OP;
						alusel_o <= `EXE_RES_LOGIC;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_NOR: begin //nor 指令
						aluop_o <= `EXE_NOR_OP;
						alusel_o <= `EXE_RES_LOGIC;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_SLLV: begin //sllv 指令
						aluop_o <= `EXE_SLL_OP;
						alusel_o <= `EXE_RES_SHIFT;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end 
					`EXE_SRLV: begin //srlv 指令
						aluop_o <= `EXE_SRL_OP;
						alusel_o <= `EXE_RES_SHIFT;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_SRAV: begin //srav 指令
						aluop_o <= `EXE_SRA_OP;
						alusel_o <= `EXE_RES_SHIFT;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_SYNC: begin //sync 指令 ?
						aluop_o <= `EXE_NOP_OP;
						alusel_o <= `EXE_RES_NOP;
						wreg_o <= `WriteDisable;
						reg1_read_o <= 1'b0;
						reg2_read_o <= 1'b1;// ?
						instvalid <= `InstValid;
					end
					default: begin
					end
					endcase
				end
				default: begin
				end
				endcase	
			end

			`EXE_ORI: begin //ori 指令
				aluop_o <= `EXE_OR_OP;
				alusel_o <= `EXE_RES_LOGIC;
				wd_o <= inst_i[20:16];// rt
				wreg_o <= `WriteEnable;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {16'h0, inst_i[15:0]};
				instvalid <= `InstValid;
			end
			`EXE_ANDI: begin //andi 指令
				aluop_o <= `EXE_AND_OP;
				alusel_o <= `EXE_RES_LOGIC;
				wd_o <= inst_i[20:16];// rt
				wreg_o <= `WriteEnable;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {16'h0, inst_i[15:0]};
				instvalid <= `InstValid;
			end
			`EXE_XORI: begin //xori 指令
				aluop_o <= `EXE_XOR_OP;
				alusel_o <= `EXE_RES_LOGIC;
				wd_o <= inst_i[20:16];// rt
				wreg_o <= `WriteEnable;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {16'h0, inst_i[15:0]};
				instvalid <= `InstValid;
			end
			`EXE_LUI: begin //lui 指令
				aluop_o <= `EXE_OR_OP;
				alusel_o <= `EXE_RES_LOGIC;
				wd_o <= inst_i[20:16];// rt
				wreg_o <= `WriteEnable;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {inst_i[15:0], 16'h0};
				instvalid <= `InstValid;
			end
			`EXE_PREF: begin //pref 指令 ?
				aluop_o <= `EXE_NOP_OP;
				alusel_o <= `EXE_RES_NOP;
				wreg_o <= `WriteDisable;
				reg1_read_o <= 1'b0;
				reg2_read_o <= 1'b0;
				instvalid <= `InstValid;
			end
			default: begin
			end
			endcase //case op

			if (inst_i[31:21] == 11'b00000000000) begin
				if (op3 == `EXE_SLL) begin //sll 指令
					aluop_o <= `EXE_SLL_OP;
					alusel_o <= `EXE_RES_SHIFT;
					wd_o <= inst_i[15:11];// rd
					wreg_o <= `WriteEnable;
					reg1_read_o <= 1'b0;
					reg2_read_o <= 1'b1;
					imm[4:0] <= inst_i[10:6];// sa
					instvalid <= `InstValid;
				end else if (op3 == `EXE_SRL) begin //srl 指令
					aluop_o <= `EXE_SRL_OP;
					alusel_o <= `EXE_RES_SHIFT;
					wd_o <= inst_i[15:11];// rd
					wreg_o <= `WriteEnable;
					reg1_read_o <= 1'b0;
					reg2_read_o <= 1'b1;
					imm[4:0] <= inst_i[10:6];// sa
					instvalid <= `InstValid;
				end else if (op3 == `EXE_SRA) begin //sra 指令
					aluop_o <= `EXE_SRA_OP;
					alusel_o <= `EXE_RES_SHIFT;
					wd_o <= inst_i[15:11];// rd
					wreg_o <= `WriteEnable;
					reg1_read_o <= 1'b0;
					reg2_read_o <= 1'b1;
					imm[4:0] <= inst_i[10:6];// sa
					instvalid <= `InstValid;
				end
			end

		end	//if
	end	//always
	

	always @ (*) begin
		if(rst == `RstEnable) begin
			reg1_o <= `ZeroWord;
		end else if((reg1_read_o == 1'b1) 
					&& (ex_wreg_i == 1'b1) 
					&& (ex_wd_i == reg1_addr_o)) begin
			reg1_o <= ex_wdata_i;
		end else if((reg1_read_o == 1'b1) 
					&& (mem_wreg_i == 1'b1) 
					&& (mem_wd_i == reg1_addr_o)) begin
			reg1_o <= mem_wdata_i;
		end else if(reg1_read_o == 1'b1) begin
			reg1_o <= reg1_data_i;
		end else if(reg1_read_o == 1'b0) begin
			reg1_o <= imm;
		end else begin
			reg1_o <= `ZeroWord;
		end
	end
	
	always @ (*) begin
		if(rst == `RstEnable) begin
			reg2_o <= `ZeroWord;
		end else if((reg2_read_o == 1'b1) && (ex_wreg_i == 1'b1) 
								&& (ex_wd_i == reg2_addr_o)) begin
			reg2_o <= ex_wdata_i;
		end else if((reg2_read_o == 1'b1) && (mem_wreg_i == 1'b1) 
								&& (mem_wd_i == reg2_addr_o)) begin
			reg2_o <= mem_wdata_i;
		end else if(reg2_read_o == 1'b1) begin
			reg2_o <= reg2_data_i;
		end else if(reg2_read_o == 1'b0) begin
			reg2_o <= imm;
		end else begin
			reg2_o <= `ZeroWord;
		end
	end

endmodule