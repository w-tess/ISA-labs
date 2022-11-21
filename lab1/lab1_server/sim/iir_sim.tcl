# script per simulazione e generazione vcd
vlog -reportprogress 300 -work work ../tb/tb_iir.v
vcom -reportprogress 300 -work work ../tb/clk_gen.vhd
vcom -reportprogress 300 -work work ../tb/data_maker.vhd
vcom -reportprogress 300 -work work ../tb/data_sink.vhd
vlog -reportprogress 300 -work work ../netlist/iir_filter.v
# link alla simulazione della libreria per le celle e 
# del file con i delay per calcolo switching activity
vsim -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_iir
vsim -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_iir/UUT=../netlist/iir_filter.sdf work.tb_iir
# segnali aggiunti a wave per simulazione questa-sim
add wave *
# generazione file vcd per calcolo switching activity
vcd file ../vcd/iir_filter_syn.vcd
vcd add /tb_iir/UUT/*
run 40 us


