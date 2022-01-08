transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/clk_counter_with_disp {C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/clk_counter_with_disp/clk_counter_with_disp.v}
vlog -vlog01compat -work work +incdir+C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/clk_counter_with_disp {C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/clk_counter_with_disp/seven_segment_disp.v}

vlog -vlog01compat -work work +incdir+C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/clk_counter_with_disp {C:/Users/dudbo/Documents/intelFPGA/FPGA_learning/Cyclone_IV/clk_counter_with_disp/clc_counter_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  clc_counter_tb

add wave *
view structure
view signals
run -all
