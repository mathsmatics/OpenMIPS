#vlog 编译对应文件

vlog ./../rtl/*.v

# simulate
vsim -voptargs=+acc work.openmips_min_sopc_tb

# add wave
# do ./sim_wave/wave.do
do ./sim_wave/top.do

restart
run -all


#configure wave -timelineunits us
#quit -sim