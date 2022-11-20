# script di sintesi del filtro e calcolo timing/area
remove_design -designs
analyze -library WORK -format vhdl {../src/iir_filter.vhd ../src/cu.vhd ../src/dff.vhd ../src/iir_filter_dp.vhd ../src/s_adder_n.vhd ../src/s_multiplier_n.vhd ../src/s_reg_n.vhd}
set power_preserve_rtl_hier_names true
elaborate iir_filter -arch str -lib WORK
uniquify
link
# definizione vincoli su clock e ritardi delle celle
create_clock -name clk0 -period 12.04 CLK
set_dont_touch_network clk0
set_clock_uncertainty 0.07 [get_clocks clk0]
set_input_delay 0.5 -max -clock clk0 [remove_from_collection [all_inputs] CLK]
set_output_delay 0.5 -max -clock clk0 [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]
# inizio sintesi del sistema
compile
# report delle informazioni su timing/area
report_timing > iir_timing.txt
report_area > iir_area.txt
# generazione netlist e file con informazioni 
# su delay e vincoli su input/output
ungroup -all -flatten
change_names -hierarchy -rules verilog
write_sdf ../netlist/iir_filter.sdf
write -f verilog -hierarchy -output ../netlist/iir_filter.v
write_sdc ../netlist/iir_filter.sdc


# # script per generazione report switching activity
# # PRIMA DARE IL COMANDO DI CONVERSIONE DA VCD A SAIF
# read_verilog -netlist ../netlist/iir_filter.v
# read_saif -input ../saif/iir_filter_syn.saif -instance tb_iir/UUT -unit ns -scale 1
# # definizione clock
# create_clock -name clk0 -period 12.04 CLK
# report_power

