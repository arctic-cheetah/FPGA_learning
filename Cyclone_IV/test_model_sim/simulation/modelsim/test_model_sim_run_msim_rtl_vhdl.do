transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {/home/london/intelFPGA/Cyclone_IV/test_model_sim/test_model_sim.vhd}

vcom -2008 -work work {/home/london/intelFPGA/Cyclone_IV/test_model_sim/test_model_sim_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  test_model_tb

add wave *
view structure
view signals
run -all
