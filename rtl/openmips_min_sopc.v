//////////////////////////////////////////////////////////////////////
// Description: 基于OpenMIPS处理器的一个简单SOPC，用于验证具备了
//              wishbone总线接口的openmips，该SOPC包含openmips、
//              wb_conmax、GPIO controller、flash controller，uart 
//              controller，以及用来仿真flash的模块flashmem，在其中
//              存储指令，用来仿真外部ram的模块datamem，在其中存储
//              数据，并且具有wishbone总线接口    
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module openmips_min_sopc(
	input wire						clk,
	input wire						rst
);

	//连接指令存储器
	wire[`InstAddrBus] inst_addr;
	wire[`InstBus] inst;
	wire rom_ce;

	//连接数据存储器
	wire mem_we_i;
	wire[`RegBus] mem_addr_i;
	wire[`RegBus] mem_data_i;
	wire[`RegBus] mem_data_o;
	wire[3:0] mem_sel_i;  
	wire mem_ce_i;
	wire[5:0] int_i;
	wire timer_int;

	assign int_i = {5'b00000, timer_int};

 	openmips openmips0(
		.clk(clk),
		.rst(rst),
	
		.rom_data_i(inst),
		.rom_addr_o(inst_addr),
		.rom_ce_o(rom_ce),

		.int_i(int_i),

		.ram_we_o(mem_we_i),
		.ram_addr_o(mem_addr_i),
		.ram_sel_o(mem_sel_i),
		.ram_data_o(mem_data_i),
		.ram_data_i(mem_data_o),
		.ram_ce_o(mem_ce_i),

		.timer_int_o(timer_int)
	);
	
	inst_rom inst_rom0(
		.ce(rom_ce),
		.addr(inst_addr),
		.inst(inst)
	);

	data_ram data_ram0(
		.clk(clk),
		.ce(mem_ce_i),
		.we(mem_we_i),
		.addr(mem_addr_i),
		.sel(mem_sel_i),
		.data_i(mem_data_i),
		.data_o(mem_data_o)
	);

endmodule