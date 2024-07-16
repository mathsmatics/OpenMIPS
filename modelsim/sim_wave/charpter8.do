onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label rst /openmips_min_sopc_tb/openmips_min_sopc0/rst
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -color Magenta /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/branch_flag_i
add wave -noupdate -color Magenta /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/branch_target_address_i
add wave -noupdate -label if_pc -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_pc
add wave -noupdate -label if_inst -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_inst
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -label id_inst -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/id_inst
add wave -noupdate -label id_alusel /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_alusel
add wave -noupdate -label id_aluop /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_aluop
add wave -noupdate -label id_reg1 -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_reg1
add wave -noupdate -label id_reg2 -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_reg2
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/is_in_delayslot_i
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/link_addr_o
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/next_inst_in_delayslot_o
add wave -noupdate -color Magenta /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/branch_flag_o
add wave -noupdate -color Magenta /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/branch_target_address_o
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/is_in_delayslot_o
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -label ex_wreg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/ex_wreg
add wave -noupdate -label ex_wd /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_wd
add wave -noupdate -label ex_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/ex_wdata
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -label mem_wreg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wreg
add wave -noupdate -label mem_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wdata
add wave -noupdate -label mem_wd /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wd
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -label wb_wreg -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wreg
add wave -noupdate -label wb_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wdata
add wave -noupdate -label wb_wd -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wd
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -radix hexadecimal {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[1]}
add wave -noupdate -radix hexadecimal {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[2]}
add wave -noupdate -radix hexadecimal {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[31]}
add wave -noupdate -label hilo_reg0/hi_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/hi_o
add wave -noupdate -label hilo_reg0/lo_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/lo_o
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/annul_i
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/opdata1_i
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/opdata2_i
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/start_i
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/ready_o
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/state
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/result_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1538341 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 178
configure wave -valuecolwidth 90
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1375113 ps} {1679140 ps}
