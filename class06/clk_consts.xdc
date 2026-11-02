set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS33} [get_ports clk_in]

create_clock -period 83.333 [get_ports clk_in]