onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group if_id -label rst /openmips_min_sopc_tb/openmips_min_sopc0/rst
add wave -noupdate -group if_id -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -group if_id -label if_pc -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_pc
add wave -noupdate -group if_id -label if_inst -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_inst
add wave -noupdate -group if_id -label id_inst -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/id_inst
add wave -noupdate -group if_id -label id_alusel /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_alusel
add wave -noupdate -group if_id -label id_aluop /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_aluop
add wave -noupdate -group if_id -label id_reg1 -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_reg1
add wave -noupdate -group if_id -label id_reg2 -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_reg2
add wave -noupdate -group if_id -label regs -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[0]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[1]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[2]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[3]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[4]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[5]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[6]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[7]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[8]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[9]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[10]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[11]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[12]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[13]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[14]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[15]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[16]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[17]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[18]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[19]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[20]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[21]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[22]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[23]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[24]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[25]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[26]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[27]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[28]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[29]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[30]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[31]} -radix hexadecimal}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[0]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[1]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[2]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[3]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[4]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[5]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[6]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[7]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[8]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[9]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[10]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[11]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[12]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[13]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[14]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[15]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[16]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[17]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[18]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[19]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[20]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[21]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[22]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[23]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[24]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[25]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[26]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[27]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[28]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[29]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[30]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[31]} {-height 15 -radix hexadecimal}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs
add wave -noupdate -expand -group ex_cp0 -color Magenta -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group ex_cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/cp0_reg_we_o
add wave -noupdate -expand -group ex_cp0 -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/cp0_reg_write_addr_o
add wave -noupdate -expand -group ex_cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/cp0_reg_data_o
add wave -noupdate -expand -group ex_cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/cp0_reg_read_addr_o
add wave -noupdate -expand -group ex_reg -label ex_wreg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/ex_wreg
add wave -noupdate -expand -group ex_reg -label ex_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/ex_wdata
add wave -noupdate -expand -group ex_reg -label ex_wd /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/ex_wd
add wave -noupdate -expand -group mem_cp0 -color Magenta -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group mem_cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/cp0_reg_we_o
add wave -noupdate -expand -group mem_cp0 -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/cp0_reg_write_addr_o
add wave -noupdate -expand -group mem_cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/cp0_reg_data_o
add wave -noupdate -expand -group mem_reg -label mem_wreg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wreg
add wave -noupdate -expand -group mem_reg -label mem_wd /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wd
add wave -noupdate -expand -group mem_reg -label mem_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wdata
add wave -noupdate -color Magenta -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group cp0 -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/we_i
add wave -noupdate -expand -group cp0 -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/waddr_i
add wave -noupdate -expand -group cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/data_i
add wave -noupdate -expand -group cp0 -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/raddr_i
add wave -noupdate -expand -group cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/data_o
add wave -noupdate -expand -group cp0 -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/int_i
add wave -noupdate -expand -group cp0 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/timer_int_o
add wave -noupdate -expand -group regfile1 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/waddr
add wave -noupdate -expand -group regfile1 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/wdata
add wave -noupdate -expand -group regfile1 /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/we
add wave -noupdate -expand -group regfile1 -label {regfile1/regs[1]} -radix hexadecimal {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[1]}
add wave -noupdate -expand -group regfile1 -label {regfile1/regs[2]} -radix hexadecimal {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[2]}
add wave -noupdate -expand -group cp0_out /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/count_o
add wave -noupdate -expand -group cp0_out /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/compare_o
add wave -noupdate -expand -group cp0_out /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/status_o
add wave -noupdate -expand -group cp0_out /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/cause_o
add wave -noupdate -expand -group cp0_out /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/epc_o
add wave -noupdate -expand -group cp0_out /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/prid_o
add wave -noupdate -expand -group cp0_out /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/cp0_reg0/config_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {262220 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 159
configure wave -valuecolwidth 40
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
WaveRestoreZoom {133582 ps} {427580 ps}
