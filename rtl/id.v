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

	//如果上一条指令是转移指令，那么下一条指令在译码的时候is_in_delayslot为true
	input wire						is_in_delayslot_i,

	//处于执行阶段的指令的一些信息，用于解决load相关
	input wire[`AluOpBus]			ex_aluop_i,

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
	output reg						wreg_o,

	//加载存储指令相关
	output wire[`RegBus]			inst_o,

	//延迟槽
	output reg						next_inst_in_delayslot_o,
	output reg						branch_flag_o,
	output reg[`RegBus]				branch_target_address_o,
	output reg[`RegBus]				link_addr_o,

	output reg						is_in_delayslot_o,
	
	output wire						stallreq
);

	wire[5:0] op = inst_i[31:26];// op
	wire[4:0] op2 = inst_i[10:6];// sa
	wire[5:0] op3 = inst_i[5:0];// func
	wire[4:0] op4 = inst_i[20:16];// rt
	reg[`RegBus] imm;
	reg instvalid;
	wire[`RegBus] pc_plus_8;
	wire[`RegBus] pc_plus_4;
	wire[`RegBus] imm_sll2_signedext; 

	reg stallreq_for_reg1_loadrelate;
	reg stallreq_for_reg2_loadrelate;
	wire pre_inst_is_load;

	assign pc_plus_8 = pc_i + 8;
	assign pc_plus_4 = pc_i + 4;
	assign imm_sll2_signedext = {{14{inst_i[15]}}, inst_i[15:0], 2'b00 };  

	assign stallreq = stallreq_for_reg1_loadrelate | stallreq_for_reg2_loadrelate;
	assign pre_inst_is_load = ( (ex_aluop_i == `EXE_LB_OP) || 
								(ex_aluop_i == `EXE_LBU_OP)||
								(ex_aluop_i == `EXE_LH_OP) ||
								(ex_aluop_i == `EXE_LHU_OP)||
								(ex_aluop_i == `EXE_LW_OP) ||
								(ex_aluop_i == `EXE_LWR_OP)||
								(ex_aluop_i == `EXE_LWL_OP)||
								(ex_aluop_i == `EXE_LL_OP) ||
								(ex_aluop_i == `EXE_SC_OP)) ? 1'b1 : 1'b0;

	assign inst_o = inst_i;

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
			link_addr_o <= `ZeroWord;
			branch_flag_o <= `NotBranch;
			branch_target_address_o <= `ZeroWord;
			next_inst_in_delayslot_o <= `NotInDelaySlot;
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
			link_addr_o <= `ZeroWord;
			branch_flag_o <= `NotBranch;
			branch_target_address_o <= `ZeroWord;
			next_inst_in_delayslot_o <= `NotInDelaySlot;
			
			case (op)// op
			`EXE_SPECIAL_INST: begin
				case (op2)// sa
				5'b00000: begin
					case (op3)// func
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
					`EXE_MFHI: begin //mfhi 指令
						aluop_o <= `EXE_MFHI_OP;
						alusel_o <= `EXE_RES_MOVE;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b0;
						reg2_read_o <= 1'b0;
						instvalid <= `InstValid;
					end
					`EXE_MFLO: begin //mflo 指令
						aluop_o <= `EXE_MFLO_OP;
						alusel_o <= `EXE_RES_MOVE;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b0;
						reg2_read_o <= 1'b0;
						instvalid <= `InstValid;
					end
					`EXE_MTHI: begin //mthi 指令
						aluop_o <= `EXE_MTHI_OP;
						wreg_o <= `WriteDisable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b0;
						instvalid <= `InstValid;
					end
					`EXE_MTLO: begin //mtlo 指令
						aluop_o <= `EXE_MTLO_OP;
						wreg_o <= `WriteDisable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b0;
						instvalid <= `InstValid;
					end
					`EXE_MOVN: begin //movn 指令
						aluop_o <= `EXE_MOVN_OP;
						alusel_o <= `EXE_RES_MOVE;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
						if(reg2_o != `ZeroWord) begin
							wreg_o <= `WriteEnable;
						end else begin
							wreg_o <= `WriteDisable;
						end
					end
					`EXE_MOVZ: begin //movz 指令
						aluop_o <= `EXE_MOVZ_OP;
						alusel_o <= `EXE_RES_MOVE;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
						if(reg2_o == `ZeroWord) begin
							wreg_o <= `WriteEnable;
						end else begin
							wreg_o <= `WriteDisable;
						end
					end
					`EXE_SLT: begin
						aluop_o <= `EXE_SLT_OP;
						alusel_o <= `EXE_RES_ARITHMETIC;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_SLTU: begin
						aluop_o <= `EXE_SLTU_OP;
						alusel_o <= `EXE_RES_ARITHMETIC;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_ADD: begin
						aluop_o <= `EXE_ADD_OP;
						alusel_o <= `EXE_RES_ARITHMETIC;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_ADDU: begin
						aluop_o <= `EXE_ADDU_OP;
						alusel_o <= `EXE_RES_ARITHMETIC;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_SUB: begin
						aluop_o <= `EXE_SUB_OP;
						alusel_o <= `EXE_RES_ARITHMETIC;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_SUBU: begin
						aluop_o <= `EXE_SUBU_OP;
						alusel_o <= `EXE_RES_ARITHMETIC;
						wreg_o <= `WriteEnable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_MULT: begin
						aluop_o <= `EXE_MULT_OP;
						wreg_o <= `WriteDisable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_MULTU: begin
						aluop_o <= `EXE_MULTU_OP;
						wreg_o <= `WriteDisable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_DIV: begin
						aluop_o <= `EXE_DIV_OP;
						wreg_o <= `WriteDisable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_DIVU: begin
						aluop_o <= `EXE_DIVU_OP;
						wreg_o <= `WriteDisable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						instvalid <= `InstValid;
					end
					`EXE_JR: begin
						aluop_o <= `EXE_JR_OP;
						alusel_o <= `EXE_RES_JUMP_BRANCH;
						wreg_o <= `WriteDisable;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b0;
						instvalid <= `InstValid;
						link_addr_o <= `ZeroWord;
						branch_flag_o <= `Branch;
						branch_target_address_o <= reg1_o;
						next_inst_in_delayslot_o <= `InDelaySlot;
					end
					`EXE_JALR: begin
						aluop_o <= `EXE_JALR_OP;
						alusel_o <= `EXE_RES_JUMP_BRANCH;
						wreg_o <= `WriteEnable;
						wd_o <= inst_i[15:11];// rd
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b0;
						instvalid <= `InstValid;
						link_addr_o <= pc_plus_8;
						branch_flag_o <= `Branch;
						branch_target_address_o <= reg1_o;
						next_inst_in_delayslot_o <= `InDelaySlot;
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
				wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				imm <= {16'h0, inst_i[15:0]};
				instvalid <= `InstValid;
			end
			`EXE_ANDI: begin //andi 指令
				aluop_o <= `EXE_AND_OP;
				alusel_o <= `EXE_RES_LOGIC;
				wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				imm <= {16'h0, inst_i[15:0]};
				instvalid <= `InstValid;
			end
			`EXE_XORI: begin //xori 指令
				aluop_o <= `EXE_XOR_OP;
				alusel_o <= `EXE_RES_LOGIC;
				wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				imm <= {16'h0, inst_i[15:0]};
				instvalid <= `InstValid;
			end
			`EXE_LUI: begin //lui 指令
				aluop_o <= `EXE_OR_OP;
				alusel_o <= `EXE_RES_LOGIC;
				wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				imm <= {inst_i[15:0], 16'h0};
				instvalid <= `InstValid;
			end
			`EXE_SLTI: begin
				aluop_o <= `EXE_SLT_OP;
				alusel_o <= `EXE_RES_ARITHMETIC;
				wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				imm <= {{16{inst_i[15]}}, inst_i[15:0]};
				instvalid <= `InstValid;
			end
			`EXE_SLTIU: begin
				aluop_o <= `EXE_SLTU_OP;
				alusel_o <= `EXE_RES_ARITHMETIC;
				wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				imm <= {{16{inst_i[15]}}, inst_i[15:0]};
				instvalid <= `InstValid;
			end
			`EXE_ADDI: begin
				aluop_o <= `EXE_ADDI_OP;
				alusel_o <= `EXE_RES_ARITHMETIC;
				wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				imm <= {{16{inst_i[15]}}, inst_i[15:0]};
				instvalid <= `InstValid;
			end
			`EXE_ADDIU: begin
				aluop_o <= `EXE_ADDIU_OP;
				alusel_o <= `EXE_RES_ARITHMETIC;
				wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				imm <= {{16{inst_i[15]}}, inst_i[15:0]};
				instvalid <= `InstValid;
			end

			`EXE_J: begin
				aluop_o <= `EXE_J_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH;
				wreg_o <= `WriteDisable;
				reg1_read_o <= 1'b0;
				reg2_read_o <= 1'b0;
				instvalid <= `InstValid;
				link_addr_o <= `ZeroWord;
				branch_flag_o <= `Branch;
				branch_target_address_o <= {pc_plus_4[31:28], inst_i[25:0], 2'b00};
				next_inst_in_delayslot_o <= `InDelaySlot;
			end
			`EXE_JAL: begin
				aluop_o <= `EXE_JAL_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH;
				wreg_o <= `WriteEnable;
				wd_o <= 5'b11111;
				reg1_read_o <= 1'b0;
				reg2_read_o <= 1'b0;
				instvalid <= `InstValid;
				link_addr_o <= pc_plus_8;
				branch_flag_o <= `Branch;
				branch_target_address_o <= {pc_plus_4[31:28], inst_i[25:0], 2'b00};
				next_inst_in_delayslot_o <= `InDelaySlot;
			end
			`EXE_BEQ: begin
				aluop_o <= `EXE_BEQ_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH;
				wreg_o <= `WriteDisable;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				instvalid <= `InstValid;
				if(reg1_o == reg2_o) begin
					branch_flag_o <= `Branch;
					branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
					next_inst_in_delayslot_o <= `InDelaySlot;
				end
			end
			`EXE_BGTZ: begin
				aluop_o <= `EXE_BGTZ_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH;
				wreg_o <= `WriteDisable;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				instvalid <= `InstValid;
				if((reg1_o[31] == 1'b0) && (reg1_o != `ZeroWord)) begin
					branch_flag_o <= `Branch;
					branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
					next_inst_in_delayslot_o <= `InDelaySlot;
				end
			end
			`EXE_BLEZ: begin
				aluop_o <= `EXE_BLEZ_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH;
				wreg_o <= `WriteDisable;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				instvalid <= `InstValid;
				if((reg1_o[31] == 1'b1) || (reg1_o == `ZeroWord)) begin
					branch_flag_o <= `Branch;
					branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
					next_inst_in_delayslot_o <= `InDelaySlot;
				end
			end
			`EXE_BNE: begin
				aluop_o <= `EXE_BLEZ_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				instvalid <= `InstValid;
				if(reg1_o != reg2_o) begin
					branch_flag_o <= `Branch;
					branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
					next_inst_in_delayslot_o <= `InDelaySlot;
				end
			end

			`EXE_LB: begin
				aluop_o <= `EXE_LB_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				instvalid <= `InstValid;
			end
			`EXE_LBU: begin
				aluop_o <= `EXE_LBU_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				instvalid <= `InstValid;
			end
			`EXE_LH: begin
				aluop_o <= `EXE_LH_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				instvalid <= `InstValid;
			end
			`EXE_LHU: begin
				aluop_o <= `EXE_LHU_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				instvalid <= `InstValid;
			end
			`EXE_LW: begin
				aluop_o <= `EXE_LW_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				instvalid <= `InstValid;
			end
			`EXE_LL: begin
				aluop_o <= `EXE_LL_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;//imm
				instvalid <= `InstValid;
			end
			`EXE_LWL: begin
				aluop_o <= `EXE_LWL_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				instvalid <= `InstValid;
			end
			`EXE_LWR: begin
				aluop_o <= `EXE_LWR_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];// rt
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				instvalid <= `InstValid;
			end
			`EXE_SB: begin
				aluop_o <= `EXE_SB_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteDisable;
		  		reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				instvalid <= `InstValid;
			end
			`EXE_SH: begin
				aluop_o <= `EXE_SH_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteDisable;
		  		reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				instvalid <= `InstValid;
			end
			`EXE_SW: begin
				aluop_o <= `EXE_SW_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteDisable;
		  		reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				instvalid <= `InstValid;
			end
			`EXE_SWL: begin
				aluop_o <= `EXE_SWL_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteDisable;
		  		reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				instvalid <= `InstValid;
			end
			`EXE_SWR: begin
				aluop_o <= `EXE_SWR_OP;
		  		alusel_o <= `EXE_RES_LOAD_STORE;
		  		wreg_o <= `WriteDisable;
		  		reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				instvalid <= `InstValid;
			end
			`EXE_LL: begin
				aluop_o <= `EXE_LL_OP;
				alusel_o <= `EXE_RES_LOAD_STORE;
				wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				instvalid <= `InstValid;
			end
			`EXE_SC: begin
				aluop_o <= `EXE_SC_OP;
				alusel_o <= `EXE_RES_LOAD_STORE;
				wreg_o <= `WriteEnable;
				wd_o <= inst_i[20:16];
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				instvalid <= `InstValid;
			end		

			`EXE_SPECIAL2_INST: begin
				case (op3)// func
				`EXE_CLZ: begin
					aluop_o <= `EXE_CLZ_OP;
					alusel_o <= `EXE_RES_ARITHMETIC;
					wreg_o <= `WriteEnable;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b0;
					instvalid <= `InstValid;
				end
				`EXE_CLO: begin
					aluop_o <= `EXE_CLO_OP;
					alusel_o <= `EXE_RES_ARITHMETIC;
					wreg_o <= `WriteEnable;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b0;
					instvalid <= `InstValid;
				end
				`EXE_MUL: begin
					aluop_o <= `EXE_MUL_OP;
					alusel_o <= `EXE_RES_MUL;
					wreg_o <= `WriteEnable;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b1;
					instvalid <= `InstValid;
				end
				`EXE_MADD: begin
					aluop_o <= `EXE_MADD_OP;
					alusel_o <= `EXE_RES_MUL;
					wreg_o <= `WriteDisable;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b1;  			
					instvalid <= `InstValid;
				end
				`EXE_MADDU: begin
					aluop_o <= `EXE_MADDU_OP;
					alusel_o <= `EXE_RES_MUL;
					wreg_o <= `WriteDisable;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b1;  			
					instvalid <= `InstValid;
				end
				`EXE_MSUB: begin
					aluop_o <= `EXE_MSUB_OP;
					alusel_o <= `EXE_RES_MUL;
					wreg_o <= `WriteDisable;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b1;  			
					instvalid <= `InstValid;
				end
				`EXE_MSUBU: begin
					aluop_o <= `EXE_MSUBU_OP;
					alusel_o <= `EXE_RES_MUL;
					wreg_o <= `WriteDisable;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b1;  			
					instvalid <= `InstValid;
				end			
				default: begin
				end
				endcase //EXE_SPECIAL_INST2 case
			end

			`EXE_REGIMM_INST: begin
				case (op4)
				`EXE_BGEZ: begin
					aluop_o <= `EXE_BGEZ_OP;
					alusel_o <= `EXE_RES_JUMP_BRANCH;
					wreg_o <= `WriteDisable;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b0;
					instvalid <= `InstValid;
					if(reg1_o[31] == 1'b0) begin
						branch_flag_o <= `Branch;
						branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
						next_inst_in_delayslot_o <= `InDelaySlot;
					end
				end
				`EXE_BGEZAL: begin
					aluop_o <= `EXE_BGEZAL_OP;
					alusel_o <= `EXE_RES_JUMP_BRANCH;
					wreg_o <= `WriteEnable;
					wd_o <= 5'b11111;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b0;
					instvalid <= `InstValid;
					link_addr_o <= pc_plus_8;
					if(reg1_o[31] == 1'b0) begin
						branch_flag_o <= `Branch;
						branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
						next_inst_in_delayslot_o <= `InDelaySlot;
					end
				end
				`EXE_BLTZ: begin
					wreg_o <= `WriteDisable;
					aluop_o <= `EXE_BGEZAL_OP;
					alusel_o <= `EXE_RES_JUMP_BRANCH;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b0;
					instvalid <= `InstValid;
					if(reg1_o[31] == 1'b1) begin
						branch_flag_o <= `Branch;
						branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
						next_inst_in_delayslot_o <= `InDelaySlot;
					end
				end
				`EXE_BLTZAL: begin
					aluop_o <= `EXE_BGEZAL_OP;
					alusel_o <= `EXE_RES_JUMP_BRANCH;
					wreg_o <= `WriteEnable;
					wd_o <= 5'b11111;
					reg1_read_o <= 1'b1;
					reg2_read_o <= 1'b0;
					instvalid <= `InstValid;
					link_addr_o <= pc_plus_8;
					if(reg1_o[31] == 1'b1) begin
						branch_flag_o <= `Branch;
						branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
						next_inst_in_delayslot_o <= `InDelaySlot;
					end
				end
				default: begin
				end
				endcase
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
		stallreq_for_reg1_loadrelate <= `NoStop;
		reg1_o <= `ZeroWord;
		if(rst == `RstEnable) begin
			reg1_o <= `ZeroWord;
		end else if((pre_inst_is_load == 1'b1)
					&& (reg1_read_o == 1'b1)
					&& (ex_wd_i == reg1_addr_o)) begin
			stallreq_for_reg1_loadrelate <= `Stop;
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
		stallreq_for_reg2_loadrelate <= `NoStop;
		reg2_o <= `ZeroWord;
		if(rst == `RstEnable) begin
			reg2_o <= `ZeroWord;
		end else if((pre_inst_is_load == 1'b1)
					&& (reg2_read_o == 1'b1)
					&& (ex_wd_i == reg2_addr_o)) begin
			stallreq_for_reg2_loadrelate <= `Stop;
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

	always @ (*) begin
		if(rst == `RstEnable) begin
			is_in_delayslot_o <= `NotInDelaySlot;
		end else begin
			is_in_delayslot_o <= is_in_delayslot_i;
		end
	end

endmodule