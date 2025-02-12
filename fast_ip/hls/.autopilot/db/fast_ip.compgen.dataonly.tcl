# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_CONTROL_BUS {
img_width { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
img_height { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
threshold { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict CONTROL_BUS $port_CONTROL_BUS


