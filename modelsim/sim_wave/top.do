onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group pc_reg -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/clk
add wave -noupdate -expand -group pc_reg -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/rst
add wave -noupdate -expand -group pc_reg -color Gold -radix binary {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[0]}
add wave -noupdate -expand -group pc_reg -color Gold /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/branch_flag_i
add wave -noupdate -expand -group pc_reg -color Magenta /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/branch_target_address_i
add wave -noupdate -expand -group pc_reg -color Cyan -radix binary -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[5]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[4]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[3]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[2]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[1]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[0]} -radix binary}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[5]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[4]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[3]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[2]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[1]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall[0]} {-color Cyan -height 15 -radix binary}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/stall
add wave -noupdate -expand -group pc_reg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/pc
add wave -noupdate -expand -group pc_reg -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/pc_reg0/ce
add wave -noupdate -expand -group pc_reg /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_inst
add wave -noupdate -group if_id -color Gold -radix binary {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[1]}
add wave -noupdate -group if_id -color Cyan -radix binary -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[5]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[4]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[3]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[2]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[1]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[0]} -radix binary}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[5]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[4]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[3]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[2]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[1]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall[0]} {-color Cyan -height 15 -radix binary}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/stall
add wave -noupdate -group if_id /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/id_pc
add wave -noupdate -group if_id /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/id_inst
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
add wave -noupdate -expand -group id -color Khaki /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/is_in_delayslot_i
add wave -noupdate -expand -group id -color Magenta /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/link_addr_o
add wave -noupdate -expand -group id -color Khaki /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/next_inst_in_delayslot_o
add wave -noupdate -expand -group id -color Khaki /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/branch_flag_o
add wave -noupdate -expand -group id -color Magenta /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/branch_target_address_o
add wave -noupdate -expand -group id -color Khaki /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/is_in_delayslot_o
add wave -noupdate -group id_ex -color Gold -radix binary {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[2]}
add wave -noupdate -group id_ex -color Cyan -radix binary -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[5]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[4]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[3]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[2]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[1]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[0]} -radix binary}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[5]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[4]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[3]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[2]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[1]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall[0]} {-color Cyan -height 15 -radix binary}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/stall
add wave -noupdate -group id_ex -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_aluop
add wave -noupdate -group id_ex -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_alusel
add wave -noupdate -group id_ex -color Violet /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_reg1
add wave -noupdate -group id_ex -color Violet /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_reg2
add wave -noupdate -group id_ex -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_wreg
add wave -noupdate -group id_ex -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_wd
add wave -noupdate -expand -group ex /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/is_in_delayslot_i
add wave -noupdate -expand -group ex /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/link_address_i
add wave -noupdate -expand -group ex -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wreg_o
add wave -noupdate -expand -group ex -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wd_o
add wave -noupdate -expand -group ex -color Plum /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o
add wave -noupdate -expand -group ex -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/whilo_o
add wave -noupdate -expand -group ex -color {Pale Green} -radix hexadecimal -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[31]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[30]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[29]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[28]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[27]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[26]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[25]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[24]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[23]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[22]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[21]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[20]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[19]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[18]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[17]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[16]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[15]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[14]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[13]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[12]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[11]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[10]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[9]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[8]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[7]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[6]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[5]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[4]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[3]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[2]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[1]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[0]} -radix hexadecimal}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[31]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[30]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[29]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[28]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[27]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[26]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[25]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[24]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[23]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[22]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[21]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[20]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[19]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[18]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[17]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[16]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[15]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[14]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[13]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[12]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[11]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[10]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[9]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[8]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[7]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[6]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[5]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[4]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[3]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[2]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[1]} {-color {Pale Green} -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o[0]} {-color {Pale Green} -height 15 -radix hexadecimal}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hi_o
add wave -noupdate -expand -group ex -color {Pale Green} -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/lo_o
add wave -noupdate -expand -group ex -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/ov_sum
add wave -noupdate -expand -group ex -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/stallreq_for_madd_msub
add wave -noupdate -expand -group ex -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/cnt_o
add wave -noupdate -expand -group ex -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hilo_temp_o
add wave -noupdate -expand -group ex -color Violet -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/hilo_temp1
add wave -noupdate -group ex_mem -color Gold -radix binary {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[3]}
add wave -noupdate -group ex_mem -color Cyan -radix binary -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[5]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[4]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[3]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[2]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[1]} -radix binary} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[0]} -radix binary}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[5]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[4]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[3]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[2]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[1]} {-color Cyan -height 15 -radix binary} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall[0]} {-color Cyan -height 15 -radix binary}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/stall
add wave -noupdate -group ex_mem -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_wreg
add wave -noupdate -group ex_mem -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_wd
add wave -noupdate -group ex_mem -color Plum /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_wdata
add wave -noupdate -group ex_mem -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_whilo
add wave -noupdate -group ex_mem -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_hi
add wave -noupdate -group ex_mem -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/mem_lo
add wave -noupdate -group ex_mem -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/cnt_o
add wave -noupdate -group ex_mem -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex_mem0/hilo_o
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
add wave -noupdate -expand -group hilo_reg -color {Pale Green} -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/hi_o
add wave -noupdate -expand -group hilo_reg -color {Pale Green} -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/lo_o
add wave -noupdate -expand -group ctrl /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ctrl0/stallreq_from_id
add wave -noupdate -expand -group ctrl /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ctrl0/stallreq_from_ex
add wave -noupdate -expand -group ctrl -color Cyan -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ctrl0/stall
add wave -noupdate -expand -group div /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/annul_i
add wave -noupdate -expand -group div /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/signed_div_i
add wave -noupdate -expand -group div -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/start_i
add wave -noupdate -expand -group div -color Cyan -radix unsigned /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/cnt
add wave -noupdate -expand -group div -color Cyan /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/state
add wave -noupdate -expand -group div /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/opdata1_i
add wave -noupdate -expand -group div /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/opdata2_i
add wave -noupdate -expand -group div /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/dividend
add wave -noupdate -expand -group div -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/ready_o
add wave -noupdate -expand -group div /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/div0/result_o
add wave -noupdate -expand -group regs -color Yellow /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/hilo_reg0/clk
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
WaveRestoreCursors {{Cursor 1} {1053746 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 213
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
WaveRestoreZoom {0 ps} {2892877 ps}
