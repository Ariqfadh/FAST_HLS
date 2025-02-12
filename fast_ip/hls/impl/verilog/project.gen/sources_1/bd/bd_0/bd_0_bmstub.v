// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module bd_0 (
  ap_clk,
  ap_rst_n,
  interrupt,
  dst_axi_tdata,
  dst_axi_tkeep,
  dst_axi_tlast,
  dst_axi_tready,
  dst_axi_tstrb,
  dst_axi_tvalid,
  s_axi_CONTROL_BUS_araddr,
  s_axi_CONTROL_BUS_arready,
  s_axi_CONTROL_BUS_arvalid,
  s_axi_CONTROL_BUS_awaddr,
  s_axi_CONTROL_BUS_awready,
  s_axi_CONTROL_BUS_awvalid,
  s_axi_CONTROL_BUS_bready,
  s_axi_CONTROL_BUS_bresp,
  s_axi_CONTROL_BUS_bvalid,
  s_axi_CONTROL_BUS_rdata,
  s_axi_CONTROL_BUS_rready,
  s_axi_CONTROL_BUS_rresp,
  s_axi_CONTROL_BUS_rvalid,
  s_axi_CONTROL_BUS_wdata,
  s_axi_CONTROL_BUS_wready,
  s_axi_CONTROL_BUS_wstrb,
  s_axi_CONTROL_BUS_wvalid,
  src_axi_tdata,
  src_axi_tkeep,
  src_axi_tlast,
  src_axi_tready,
  src_axi_tstrb,
  src_axi_tvalid
);

  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.AP_CLK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, ASSOCIATED_BUSIF dst_axi:s_axi_CONTROL_BUS:src_axi, ASSOCIATED_RESET ap_rst_n, INSERT_VIP 0" *)
  input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST" *)
  (* X_INTERFACE_MODE = "slave RST.AP_RST_N" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST_N, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT" *)
  (* X_INTERFACE_MODE = "master INTR.INTERRUPT" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
  output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TDATA" *)
  (* X_INTERFACE_MODE = "master dst_axi" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dst_axi, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
  output [31:0]dst_axi_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TKEEP" *)
  output [3:0]dst_axi_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TLAST" *)
  output [0:0]dst_axi_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TREADY" *)
  input dst_axi_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TSTRB" *)
  output [3:0]dst_axi_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TVALID" *)
  output dst_axi_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS ARADDR" *)
  (* X_INTERFACE_MODE = "slave s_axi_CONTROL_BUS" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_CONTROL_BUS, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000.0, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
  input [5:0]s_axi_CONTROL_BUS_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS ARREADY" *)
  output s_axi_CONTROL_BUS_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS ARVALID" *)
  input s_axi_CONTROL_BUS_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS AWADDR" *)
  input [5:0]s_axi_CONTROL_BUS_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS AWREADY" *)
  output s_axi_CONTROL_BUS_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS AWVALID" *)
  input s_axi_CONTROL_BUS_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS BREADY" *)
  input s_axi_CONTROL_BUS_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS BRESP" *)
  output [1:0]s_axi_CONTROL_BUS_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS BVALID" *)
  output s_axi_CONTROL_BUS_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RDATA" *)
  output [31:0]s_axi_CONTROL_BUS_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RREADY" *)
  input s_axi_CONTROL_BUS_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RRESP" *)
  output [1:0]s_axi_CONTROL_BUS_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RVALID" *)
  output s_axi_CONTROL_BUS_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WDATA" *)
  input [31:0]s_axi_CONTROL_BUS_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WREADY" *)
  output s_axi_CONTROL_BUS_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WSTRB" *)
  input [3:0]s_axi_CONTROL_BUS_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WVALID" *)
  input s_axi_CONTROL_BUS_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TDATA" *)
  (* X_INTERFACE_MODE = "slave src_axi" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME src_axi, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
  input [31:0]src_axi_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TKEEP" *)
  input [3:0]src_axi_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TLAST" *)
  input [0:0]src_axi_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TREADY" *)
  output src_axi_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TSTRB" *)
  input [3:0]src_axi_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TVALID" *)
  input src_axi_tvalid;

  // stub module has no contents

endmodule
