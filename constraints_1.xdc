##------------------------------------------------------------------------------
## XDC Constraint File for Custom PL-based UART
## Device: xc7z020ckg484-1
## Adjust the PACKAGE_PIN assignments as necessary based on your board's documentation.
##------------------------------------------------------------------------------
# UART Configuration
set_property PACKAGE_PIN Y4 [get_ports {uart_rtl_txd}]
set_property IOSTANDARD LVCMOS33 [get_ports {uart_rtl_txd}]
set_property PACKAGE_PIN AB5 [get_ports {uart_rtl_rxd}]
set_property IOSTANDARD LVCMOS33 [get_ports {uart_rtl_rxd}]