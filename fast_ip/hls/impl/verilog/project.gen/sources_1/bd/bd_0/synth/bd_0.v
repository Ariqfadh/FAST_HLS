//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Sun Feb  9 15:23:46 2025
//Host        : Ariqfadhh running 64-bit major release  (build 9200)
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (ap_clk,
    ap_rst_n,
    dst_axi_tdata,
    dst_axi_tkeep,
    dst_axi_tlast,
    dst_axi_tready,
    dst_axi_tstrb,
    dst_axi_tvalid,
    interrupt,
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
    src_axi_tvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF dst_axi:s_axi_CONTROL_BUS:src_axi, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TDATA" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dst_axi, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]dst_axi_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TKEEP" *) output [3:0]dst_axi_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TLAST" *) output [0:0]dst_axi_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TREADY" *) input dst_axi_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TSTRB" *) output [3:0]dst_axi_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dst_axi TVALID" *) output dst_axi_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS ARADDR" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_CONTROL_BUS, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [5:0]s_axi_CONTROL_BUS_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS ARREADY" *) output s_axi_CONTROL_BUS_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS ARVALID" *) input s_axi_CONTROL_BUS_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS AWADDR" *) input [5:0]s_axi_CONTROL_BUS_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS AWREADY" *) output s_axi_CONTROL_BUS_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS AWVALID" *) input s_axi_CONTROL_BUS_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS BREADY" *) input s_axi_CONTROL_BUS_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS BRESP" *) output [1:0]s_axi_CONTROL_BUS_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS BVALID" *) output s_axi_CONTROL_BUS_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RDATA" *) output [31:0]s_axi_CONTROL_BUS_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RREADY" *) input s_axi_CONTROL_BUS_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RRESP" *) output [1:0]s_axi_CONTROL_BUS_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RVALID" *) output s_axi_CONTROL_BUS_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WDATA" *) input [31:0]s_axi_CONTROL_BUS_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WREADY" *) output s_axi_CONTROL_BUS_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WSTRB" *) input [3:0]s_axi_CONTROL_BUS_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WVALID" *) input s_axi_CONTROL_BUS_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TDATA" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME src_axi, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]src_axi_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TKEEP" *) input [3:0]src_axi_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TLAST" *) input [0:0]src_axi_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TREADY" *) output src_axi_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TSTRB" *) input [3:0]src_axi_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 src_axi TVALID" *) input src_axi_tvalid;

  wire ap_clk;
  wire ap_rst_n;
  wire [31:0]dst_axi_tdata;
  wire [3:0]dst_axi_tkeep;
  wire [0:0]dst_axi_tlast;
  wire dst_axi_tready;
  wire [3:0]dst_axi_tstrb;
  wire dst_axi_tvalid;
  wire interrupt;
  wire [5:0]s_axi_CONTROL_BUS_araddr;
  wire s_axi_CONTROL_BUS_arready;
  wire s_axi_CONTROL_BUS_arvalid;
  wire [5:0]s_axi_CONTROL_BUS_awaddr;
  wire s_axi_CONTROL_BUS_awready;
  wire s_axi_CONTROL_BUS_awvalid;
  wire s_axi_CONTROL_BUS_bready;
  wire [1:0]s_axi_CONTROL_BUS_bresp;
  wire s_axi_CONTROL_BUS_bvalid;
  wire [31:0]s_axi_CONTROL_BUS_rdata;
  wire s_axi_CONTROL_BUS_rready;
  wire [1:0]s_axi_CONTROL_BUS_rresp;
  wire s_axi_CONTROL_BUS_rvalid;
  wire [31:0]s_axi_CONTROL_BUS_wdata;
  wire s_axi_CONTROL_BUS_wready;
  wire [3:0]s_axi_CONTROL_BUS_wstrb;
  wire s_axi_CONTROL_BUS_wvalid;
  wire [31:0]src_axi_tdata;
  wire [3:0]src_axi_tkeep;
  wire [0:0]src_axi_tlast;
  wire src_axi_tready;
  wire [3:0]src_axi_tstrb;
  wire src_axi_tvalid;

  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .dst_axi_TDATA(dst_axi_tdata),
        .dst_axi_TKEEP(dst_axi_tkeep),
        .dst_axi_TLAST(dst_axi_tlast),
        .dst_axi_TREADY(dst_axi_tready),
        .dst_axi_TSTRB(dst_axi_tstrb),
        .dst_axi_TVALID(dst_axi_tvalid),
        .interrupt(interrupt),
        .s_axi_CONTROL_BUS_ARADDR(s_axi_CONTROL_BUS_araddr),
        .s_axi_CONTROL_BUS_ARREADY(s_axi_CONTROL_BUS_arready),
        .s_axi_CONTROL_BUS_ARVALID(s_axi_CONTROL_BUS_arvalid),
        .s_axi_CONTROL_BUS_AWADDR(s_axi_CONTROL_BUS_awaddr),
        .s_axi_CONTROL_BUS_AWREADY(s_axi_CONTROL_BUS_awready),
        .s_axi_CONTROL_BUS_AWVALID(s_axi_CONTROL_BUS_awvalid),
        .s_axi_CONTROL_BUS_BREADY(s_axi_CONTROL_BUS_bready),
        .s_axi_CONTROL_BUS_BRESP(s_axi_CONTROL_BUS_bresp),
        .s_axi_CONTROL_BUS_BVALID(s_axi_CONTROL_BUS_bvalid),
        .s_axi_CONTROL_BUS_RDATA(s_axi_CONTROL_BUS_rdata),
        .s_axi_CONTROL_BUS_RREADY(s_axi_CONTROL_BUS_rready),
        .s_axi_CONTROL_BUS_RRESP(s_axi_CONTROL_BUS_rresp),
        .s_axi_CONTROL_BUS_RVALID(s_axi_CONTROL_BUS_rvalid),
        .s_axi_CONTROL_BUS_WDATA(s_axi_CONTROL_BUS_wdata),
        .s_axi_CONTROL_BUS_WREADY(s_axi_CONTROL_BUS_wready),
        .s_axi_CONTROL_BUS_WSTRB(s_axi_CONTROL_BUS_wstrb),
        .s_axi_CONTROL_BUS_WVALID(s_axi_CONTROL_BUS_wvalid),
        .src_axi_TDATA(src_axi_tdata),
        .src_axi_TKEEP(src_axi_tkeep),
        .src_axi_TLAST(src_axi_tlast),
        .src_axi_TREADY(src_axi_tready),
        .src_axi_TSTRB(src_axi_tstrb),
        .src_axi_TVALID(src_axi_tvalid));
endmodule
