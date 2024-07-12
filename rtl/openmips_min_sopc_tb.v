//////////////////////////////////////////////////////////////////////
// Description: openmips_min_sopcµÄtestbench
//////////////////////////////////////////////////////////////////////

`include "defines.v"
`timescale 1ns/1ps

module openmips_min_sopc_tb();

	parameter PEROID = 20;

	reg     CLOCK_50;
	reg     rst;
		
	initial begin
		CLOCK_50 = 1'b0;
		forever #(PEROID/2) CLOCK_50 = ~CLOCK_50;
	end

	initial begin
		rst = `RstEnable;
		#115 rst = `RstDisable;
		#(PEROID*200) $stop;
	end

	openmips_min_sopc openmips_min_sopc0(
		.clk(CLOCK_50),
		.rst(rst)
	);

endmodule