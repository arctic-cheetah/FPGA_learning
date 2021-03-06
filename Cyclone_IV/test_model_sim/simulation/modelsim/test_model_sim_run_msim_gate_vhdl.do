transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {test_model_sim.vho}

vcom -93 -work work {/home/london/intelFPGA/Cyclone_IV/test_model_sim/test_model_sim_tb.vhd}

vsim -t 1ps -L altera -L cycloneive -L gate_work -L work -voptargs="+acc"  test_model_sim_tb

add wave *
view structure
view signals
run -all
