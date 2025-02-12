onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label rst /openmips_min_sopc_tb/openmips_min_sopc0/rst
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -color Magenta {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[0]}
add wave -noupdate -label if_pc -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_pc
add wave -noupdate -label hilo_reg0/hi_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/hi_o
add wave -noupdate -label hilo_reg0/lo_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/lo_o
add wave -noupdate -label if_inst -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_inst
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -color Magenta {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[1]}
add wave -noupdate -label id_inst -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/id_inst
add wave -noupdate -label id_alusel /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_alusel
add wave -noupdate -label id_aluop /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_aluop
add wave -noupdate -label id_reg1 -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_reg1
add wave -noupdate -label id_reg2 -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_reg2
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -color Magenta {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[2]}
add wave -noupdate -label ex_wreg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/ex_wreg
add wave -noupdate -label ex_wd /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_wd
add wave -noupdate -label ex_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/ex_wdata
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -color Magenta {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[3]}
add wave -noupdate -label mem_wreg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wreg
add wave -noupdate -label mem_wd /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wd
add wave -noupdate -label mem_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wdata
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -color Magenta {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[4]}
add wave -noupdate -label wb_wreg -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wreg
add wave -noupdate -label wb_wd -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wd
add wave -noupdate -label wb_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wdata
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -color Magenta {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[5]}
add wave -noupdate -radix hexadecimal {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[2]}
add wave -noupdate -radix hexadecimal {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[3]}
add wave -noupdate -label hilo_reg0/hi_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/hi_o
add wave -noupdate -label hilo_reg0/lo_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/lo_o
add wave -noupdate -label regs -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[0]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[1]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[2]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[3]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[4]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[5]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[6]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[7]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[8]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[9]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[10]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[11]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[12]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[13]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[14]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[15]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[16]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[17]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[18]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[19]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[20]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[21]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[22]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[23]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[24]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[25]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[26]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[27]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[28]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[29]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[30]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[31]} -radix hexadecimal}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[0]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[1]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[2]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[3]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[4]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[5]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[6]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[7]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[8]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[9]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[10]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[11]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[12]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[13]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[14]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[15]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[16]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[17]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[18]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[19]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[20]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[21]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[22]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[23]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[24]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[25]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[26]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[27]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[28]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[29]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[30]} {-height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[31]} {-height 15 -radix hexadecimal}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs
add wave -noupdate -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/signed_div_i
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/opdata1_i
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/opdata2_i
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/start_i
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/annul_i
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/cnt
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/result_o
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/ready_o
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/dividend
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/divisor
add wave -noupdate /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1044380 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 127
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
WaveRestoreZoom {0 ps} {3149830 ps}
