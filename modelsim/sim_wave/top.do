onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group pc_reg -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/clk
add wave -noupdate -expand -group pc_reg -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/rst
add wave -noupdate -expand -group pc_reg -color Gold -radix binary {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[0]}
add wave -noupdate -expand -group pc_reg -color Cyan -radix binary -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[5]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[4]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[3]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[2]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[1]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[0]} -radix binary}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[5]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[4]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[3]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[2]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[1]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[0]} {-color Cyan -height 15 -radix binary}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall
add wave -noupdate -expand -group pc_reg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/pc
add wave -noupdate -expand -group pc_reg -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/ce
add wave -noupdate -expand -group pc_reg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_inst
add wave -noupdate -expand -group if_id -color Gold -radix binary {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[1]}
add wave -noupdate -expand -group if_id -color Cyan -radix binary -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[5]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[4]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[3]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[2]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[1]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[0]} -radix binary}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[5]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[4]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[3]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[2]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[1]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[0]} {-color Cyan -height 15 -radix binary}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall
add wave -noupdate -expand -group if_id /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/id_pc
add wave -noupdate -expand -group if_id /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/id_inst
add wave -noupdate -group regfile -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/re1
add wave -noupdate -group regfile -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/raddr1
add wave -noupdate -group regfile -color Violet /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/rdata1
add wave -noupdate -group regfile -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/clk
add wave -noupdate -group regfile -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/re2
add wave -noupdate -group regfile -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/raddr2
add wave -noupdate -group regfile -color Violet /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/rdata2
add wave -noupdate -group regfile -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/clk
add wave -noupdate -group regfile /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs
add wave -noupdate -group regfile {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[0]}
add wave -noupdate -group regfile {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[1]}
add wave -noupdate -group regfile {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[2]}
add wave -noupdate -group regfile {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[3]}
add wave -noupdate -group regfile {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[4]}
add wave -noupdate -expand -group id -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/aluop_o
add wave -noupdate -expand -group id -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/alusel_o
add wave -noupdate -expand -group id -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/op
add wave -noupdate -expand -group id -color Violet /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/imm
add wave -noupdate -expand -group id -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/instvalid
add wave -noupdate -expand -group id -color Violet /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/reg1_o
add wave -noupdate -expand -group id -color Violet /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/reg2_o
add wave -noupdate -expand -group id -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/wreg_o
add wave -noupdate -expand -group id -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/wd_o
add wave -noupdate -expand -group id_ex -color Gold -radix binary {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[2]}
add wave -noupdate -expand -group id_ex -color Cyan -radix binary -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[5]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[4]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[3]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[2]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[1]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[0]} -radix binary}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[5]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[4]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[3]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[2]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[1]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[0]} {-color Cyan -height 15 -radix binary}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall
add wave -noupdate -expand -group id_ex -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_aluop
add wave -noupdate -expand -group id_ex -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_alusel
add wave -noupdate -expand -group id_ex -color Violet /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_reg1
add wave -noupdate -expand -group id_ex -color Violet /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_reg2
add wave -noupdate -expand -group id_ex -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_wreg
add wave -noupdate -expand -group id_ex -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_wd
add wave -noupdate -expand -group ex -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wreg_o
add wave -noupdate -expand -group ex -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wd_o
add wave -noupdate -expand -group ex -color Plum /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o
add wave -noupdate -expand -group ex -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/whilo_o
add wave -noupdate -expand -group ex -color {Pale Green} -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o
add wave -noupdate -expand -group ex -color {Pale Green} -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/lo_o
add wave -noupdate -expand -group ex -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/ov_sum
add wave -noupdate -expand -group ex -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/stallreq_for_madd_msub
add wave -noupdate -expand -group ex -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/cnt_o
add wave -noupdate -expand -group ex -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hilo_temp_o
add wave -noupdate -expand -group ex -color Violet -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hilo_temp1
add wave -noupdate -expand -group ex_mem -color Gold -radix binary {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[3]}
add wave -noupdate -expand -group ex_mem -color Cyan -radix binary -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[5]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[4]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[3]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[2]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[1]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[0]} -radix binary}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[5]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[4]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[3]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[2]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[1]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[0]} {-color Cyan -height 15 -radix binary}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall
add wave -noupdate -expand -group ex_mem -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_wreg
add wave -noupdate -expand -group ex_mem -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_wd
add wave -noupdate -expand -group ex_mem -color Plum /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_wdata
add wave -noupdate -expand -group ex_mem -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_whilo
add wave -noupdate -expand -group ex_mem -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_hi
add wave -noupdate -expand -group ex_mem -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_lo
add wave -noupdate -expand -group ex_mem -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/cnt_o
add wave -noupdate -expand -group ex_mem -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/hilo_o
add wave -noupdate -expand -group mem -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/wreg_o
add wave -noupdate -expand -group mem -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/wd_o
add wave -noupdate -expand -group mem -color Plum /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/wdata_o
add wave -noupdate -expand -group mem -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/whilo_o
add wave -noupdate -expand -group mem -color {Pale Green} -radix decimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/hi_o
add wave -noupdate -expand -group mem -color {Pale Green} -radix decimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/lo_o
add wave -noupdate -expand -group mem_wb -color Gold -radix binary {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[4]}
add wave -noupdate -expand -group mem_wb -color Cyan -radix binary -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[5]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[4]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[3]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[2]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[1]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[0]} -radix binary}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[5]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[4]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[3]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[2]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[1]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall[0]} {-color Cyan -height 15 -radix binary}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/stall
add wave -noupdate -expand -group mem_wb -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wreg
add wave -noupdate -expand -group mem_wb -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wd
add wave -noupdate -expand -group mem_wb -color Plum /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wdata
add wave -noupdate -expand -group mem_wb -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_whilo
add wave -noupdate -expand -group mem_wb -color {Pale Green} -radix decimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_hi
add wave -noupdate -expand -group mem_wb -color {Pale Green} -radix decimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_lo
add wave -noupdate -expand -group hilo_reg -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/clk
add wave -noupdate -expand -group hilo_reg -color {Pale Green} -radix decimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/hi_o
add wave -noupdate -expand -group hilo_reg -color {Pale Green} -radix decimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/lo_o
add wave -noupdate -expand -group ctrl /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ctrl0/stallreq_from_id
add wave -noupdate -expand -group ctrl /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ctrl0/stallreq_from_ex
add wave -noupdate -expand -group ctrl -color Cyan -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ctrl0/stall
add wave -noupdate -expand -group regs /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs
add wave -noupdate -expand -group regs {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[0]}
add wave -noupdate -expand -group regs {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[1]}
add wave -noupdate -expand -group regs {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[2]}
add wave -noupdate -expand -group regs {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[3]}
add wave -noupdate -expand -group regs {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[4]}
add wave -noupdate -expand -group regs {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[5]}
add wave -noupdate -expand -group regs {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[6]}
add wave -noupdate -expand -group regs {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[7]}
add wave -noupdate -expand -group regs {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[8]}
add wave -noupdate -expand -group regs {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile1/regs[9]}
add wave -noupdate -expand -group regs -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/hi_o
add wave -noupdate -expand -group regs -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/lo_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {393119 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 164
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1170750 ps}
