set_property -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS33} [get_ports A]
set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS33} [get_ports B]
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS33} [get_ports clk_in]

create_clock -period 83.333 [get_ports clk_in]

set_property -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS33} [get_ports sum]
set_property -dict {PACKAGE_PIN C16 IOSTANDARD LVCMOS33} [get_ports carry]