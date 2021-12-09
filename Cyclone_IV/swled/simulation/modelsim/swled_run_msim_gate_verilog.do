transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {swled.vo}

vcom -93 -work work {/home/london/intelFPGA/Cyclone_IV/swled/swled.vhd}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  swled

add wave *
view structure
view signals
run -all
