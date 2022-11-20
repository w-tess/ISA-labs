# # script per generazione report switching activity
# # PRIMA DARE IL COMANDO DI CONVERSIONE DA VCD A SAIF
read_verilog -netlist ../netlist/iir_filter_la.v
read_saif -input ../saif/iir_filter_la_syn.saif -instance tb_iir_la/UUT -unit ns -scale 1
# definizione clock
create_clock -name clk0 -period 6.24 CLK
report_power > iir_la_power.txt
