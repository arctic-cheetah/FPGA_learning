transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {square_wave.vo}

vlog -vlog01compat -work work +incdir+C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/square_wave {C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/square_wave/square_wave.v}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  Square_wave_tb

add wave *
view structure
view signals
run -all
