transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {decimal_to_bcd.vo}

vlog -vlog01compat -work work +incdir+C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/decimal_to_bcd {C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/decimal_to_bcd/decimal_to_bcd_TB.v}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  decimal_to_bcd_TB

add wave *
view structure
view signals
run -all
