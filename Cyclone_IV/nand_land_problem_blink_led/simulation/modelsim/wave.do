onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /LED_blinker_tb/t_clock
add wave -noupdate /LED_blinker_tb/t_EN
add wave -noupdate /LED_blinker_tb/t_SW_1
add wave -noupdate /LED_blinker_tb/t_SW_2
add wave -noupdate /LED_blinker_tb/W_LED_DRIVE
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4299723627446 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ps} {17179869184 ns}
