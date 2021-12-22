transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {LED_blinker.vo}

vlog -vlog01compat -work work +incdir+C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/nand_land_problem_blink_led {C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/nand_land_problem_blink_led/LED_blinker_tb.v}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  LED_blinker_tb

add wave *
view structure
view signals
run -all
