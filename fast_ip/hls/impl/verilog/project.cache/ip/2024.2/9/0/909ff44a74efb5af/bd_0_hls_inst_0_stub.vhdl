-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Sun Feb  9 15:24:41 2025
-- Host        : Ariqfadhh running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_CONTROL_BUS_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_CONTROL_BUS_ARREADY : out STD_LOGIC;
    s_axi_CONTROL_BUS_ARVALID : in STD_LOGIC;
    s_axi_CONTROL_BUS_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_CONTROL_BUS_AWREADY : out STD_LOGIC;
    s_axi_CONTROL_BUS_AWVALID : in STD_LOGIC;
    s_axi_CONTROL_BUS_BREADY : in STD_LOGIC;
    s_axi_CONTROL_BUS_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CONTROL_BUS_BVALID : out STD_LOGIC;
    s_axi_CONTROL_BUS_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CONTROL_BUS_RREADY : in STD_LOGIC;
    s_axi_CONTROL_BUS_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CONTROL_BUS_RVALID : out STD_LOGIC;
    s_axi_CONTROL_BUS_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CONTROL_BUS_WREADY : out STD_LOGIC;
    s_axi_CONTROL_BUS_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_CONTROL_BUS_WVALID : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    src_axi_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    src_axi_TKEEP : in STD_LOGIC_VECTOR ( 3 downto 0 );
    src_axi_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    src_axi_TREADY : out STD_LOGIC;
    src_axi_TSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    src_axi_TVALID : in STD_LOGIC;
    dst_axi_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dst_axi_TKEEP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dst_axi_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    dst_axi_TREADY : in STD_LOGIC;
    dst_axi_TSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dst_axi_TVALID : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "bd_0_hls_inst_0,fast_ip,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "bd_0_hls_inst_0,fast_ip,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=fast_ip,x_ipVersion=1.0,x_ipCoreRevision=2113947683,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_S_AXI_CONTROL_BUS_ADDR_WIDTH=6,C_S_AXI_CONTROL_BUS_DATA_WIDTH=32}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "HLS";
  attribute hls_module : string;
  attribute hls_module of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "s_axi_CONTROL_BUS_ARADDR[5:0],s_axi_CONTROL_BUS_ARREADY,s_axi_CONTROL_BUS_ARVALID,s_axi_CONTROL_BUS_AWADDR[5:0],s_axi_CONTROL_BUS_AWREADY,s_axi_CONTROL_BUS_AWVALID,s_axi_CONTROL_BUS_BREADY,s_axi_CONTROL_BUS_BRESP[1:0],s_axi_CONTROL_BUS_BVALID,s_axi_CONTROL_BUS_RDATA[31:0],s_axi_CONTROL_BUS_RREADY,s_axi_CONTROL_BUS_RRESP[1:0],s_axi_CONTROL_BUS_RVALID,s_axi_CONTROL_BUS_WDATA[31:0],s_axi_CONTROL_BUS_WREADY,s_axi_CONTROL_BUS_WSTRB[3:0],s_axi_CONTROL_BUS_WVALID,ap_clk,ap_rst_n,interrupt,src_axi_TDATA[31:0],src_axi_TKEEP[3:0],src_axi_TLAST[0:0],src_axi_TREADY,src_axi_TSTRB[3:0],src_axi_TVALID,dst_axi_TDATA[31:0],dst_axi_TKEEP[3:0],dst_axi_TLAST[0:0],dst_axi_TREADY,dst_axi_TSTRB[3:0],dst_axi_TVALID";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_ARADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS ARADDR";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of s_axi_CONTROL_BUS_ARADDR : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_axi_CONTROL_BUS_ARADDR : signal is "XIL_INTERFACENAME s_axi_CONTROL_BUS, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000.0, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_ARREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS ARREADY";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_ARVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS ARVALID";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_AWADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS AWADDR";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_AWREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS AWREADY";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_AWVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS AWVALID";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_BREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS BREADY";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_BRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS BRESP";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_BVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS BVALID";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_RDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RDATA";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_RREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RREADY";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_RRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RRESP";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_RVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS RVALID";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_WDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WDATA";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_WREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WREADY";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_WSTRB : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WSTRB";
  attribute X_INTERFACE_INFO of s_axi_CONTROL_BUS_WVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_CONTROL_BUS WVALID";
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_MODE of ap_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_CONTROL_BUS:src_axi:dst_axi, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_MODE of ap_rst_n : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  attribute X_INTERFACE_MODE of interrupt : signal is "master";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute X_INTERFACE_INFO of src_axi_TDATA : signal is "xilinx.com:interface:axis:1.0 src_axi TDATA";
  attribute X_INTERFACE_MODE of src_axi_TDATA : signal is "slave";
  attribute X_INTERFACE_PARAMETER of src_axi_TDATA : signal is "XIL_INTERFACENAME src_axi, TUSER_WIDTH 0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of src_axi_TKEEP : signal is "xilinx.com:interface:axis:1.0 src_axi TKEEP";
  attribute X_INTERFACE_INFO of src_axi_TLAST : signal is "xilinx.com:interface:axis:1.0 src_axi TLAST";
  attribute X_INTERFACE_INFO of src_axi_TREADY : signal is "xilinx.com:interface:axis:1.0 src_axi TREADY";
  attribute X_INTERFACE_INFO of src_axi_TSTRB : signal is "xilinx.com:interface:axis:1.0 src_axi TSTRB";
  attribute X_INTERFACE_INFO of src_axi_TVALID : signal is "xilinx.com:interface:axis:1.0 src_axi TVALID";
  attribute X_INTERFACE_INFO of dst_axi_TDATA : signal is "xilinx.com:interface:axis:1.0 dst_axi TDATA";
  attribute X_INTERFACE_MODE of dst_axi_TDATA : signal is "master";
  attribute X_INTERFACE_PARAMETER of dst_axi_TDATA : signal is "XIL_INTERFACENAME dst_axi, TUSER_WIDTH 0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000.0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of dst_axi_TKEEP : signal is "xilinx.com:interface:axis:1.0 dst_axi TKEEP";
  attribute X_INTERFACE_INFO of dst_axi_TLAST : signal is "xilinx.com:interface:axis:1.0 dst_axi TLAST";
  attribute X_INTERFACE_INFO of dst_axi_TREADY : signal is "xilinx.com:interface:axis:1.0 dst_axi TREADY";
  attribute X_INTERFACE_INFO of dst_axi_TSTRB : signal is "xilinx.com:interface:axis:1.0 dst_axi TSTRB";
  attribute X_INTERFACE_INFO of dst_axi_TVALID : signal is "xilinx.com:interface:axis:1.0 dst_axi TVALID";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "fast_ip,Vivado 2024.2";
begin
end;
