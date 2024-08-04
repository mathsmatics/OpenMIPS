onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group if -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group if -label rst /openmips_min_sopc_tb/openmips_min_sopc0/rst
add wave -noupdate -expand -group if -label if_pc -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_pc
add wave -noupdate -expand -group if -label if_inst -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_inst
add wave -noupdate -expand -group id -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group id -label id_inst -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/id_inst
add wave -noupdate -expand -group id -label id_aluop /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_aluop
add wave -noupdate -expand -group id -label id_alusel /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_alusel
add wave -noupdate -expand -group id -label id_reg1 -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_reg1
add wave -noupdate -expand -group id -label id_reg2 -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_reg2
add wave -noupdate -expand -group ex -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group ex -label ex_wreg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/ex_wreg
add wave -noupdate -expand -group ex -label ex_wd /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_wd
add wave -noupdate -expand -group ex -label ex_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/ex_wdata
add wave -noupdate -expand -group mem -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group mem -label mem_wreg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wreg
add wave -noupdate -expand -group mem -label mem_wd /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wd
add wave -noupdate -expand -group mem -label mem_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/mem_wdata
add wave -noupdate -expand -group ram -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group ram /openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/ce
add wave -noupdate -expand -group ram /openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/we
add wave -noupdate -expand -group ram -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/sel
add wave -noupdate -expand -group ram /openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/addr
add wave -noupdate -expand -group ram /openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_i
add wave -noupdate -expand -group wb -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group wb -label wb_wreg -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wreg
add wave -noupdate -expand -group wb -label wb_wd -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wd
add wave -noupdate -expand -group wb -label wb_wdata -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wdata
add wave -noupdate -expand -group reg -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group reg -label hilo_reg0/hi_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/hi_o
add wave -noupdate -expand -group reg -label hilo_reg0/lo_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/lo_o
add wave -noupdate -expand -group reg -radix hexadecimal {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[1]}
add wave -noupdate -expand -group reg -radix hexadecimal {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[3]}
add wave -noupdate -expand -group ram_ -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem3[0]}
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem2[0]}
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem1[0]}
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem0[0]}
add wave -noupdate -expand -group ram_ -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem3[1]}
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem2[1]}
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem1[1]}
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem0[1]}
add wave -noupdate -expand -group ram_ -color Yellow -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem3[2]}
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem2[2]}
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem1[2]}
add wave -noupdate -expand -group ram_ {/openmips_min_sopc_tb/openmips_min_sopc0/data_ram0/data_mem0[2]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {671202 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 127
configure wave -valuecolwidth 59
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
WaveRestoreZoom {480513 ps} {899901 ps}
