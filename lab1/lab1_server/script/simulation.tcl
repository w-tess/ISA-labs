vsim -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_iir_la

vsim -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_iir_la/UUT=../netlist/iir_filter_la.sdf work.tb_iir_la
