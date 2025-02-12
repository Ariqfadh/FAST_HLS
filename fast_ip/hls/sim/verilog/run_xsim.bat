
set PATH=
call C:/Xilinx/Vivado/2024.2/bin/xelab xil_defaultlib.apatb_fast_ip_top glbl -Oenable_linking_all_libraries  -prj fast_ip.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver -L xpm  -L floating_point_v7_0_24 -L floating_point_v7_1_19 --lib "ieee_proposed=./ieee_proposed" -s fast_ip 
call C:/Xilinx/Vivado/2024.2/bin/xsim --noieeewarnings fast_ip -tclbatch fast_ip.tcl 

