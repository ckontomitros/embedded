// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Mon Jun 12 17:55:40 2017
// Host        : chris running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ arm_sobel_0_1_stub.v
// Design      : arm_sobel_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "sobel,Vivado 2016.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_AXILiteS_AWADDR, 
  s_axi_AXILiteS_AWVALID, s_axi_AXILiteS_AWREADY, s_axi_AXILiteS_WDATA, 
  s_axi_AXILiteS_WSTRB, s_axi_AXILiteS_WVALID, s_axi_AXILiteS_WREADY, 
  s_axi_AXILiteS_BRESP, s_axi_AXILiteS_BVALID, s_axi_AXILiteS_BREADY, 
  s_axi_AXILiteS_ARADDR, s_axi_AXILiteS_ARVALID, s_axi_AXILiteS_ARREADY, 
  s_axi_AXILiteS_RDATA, s_axi_AXILiteS_RRESP, s_axi_AXILiteS_RVALID, 
  s_axi_AXILiteS_RREADY, ap_clk, ap_rst_n, interrupt, m_axi_INPUT_BUNDLE_AWADDR, 
  m_axi_INPUT_BUNDLE_AWLEN, m_axi_INPUT_BUNDLE_AWSIZE, m_axi_INPUT_BUNDLE_AWBURST, 
  m_axi_INPUT_BUNDLE_AWLOCK, m_axi_INPUT_BUNDLE_AWREGION, m_axi_INPUT_BUNDLE_AWCACHE, 
  m_axi_INPUT_BUNDLE_AWPROT, m_axi_INPUT_BUNDLE_AWQOS, m_axi_INPUT_BUNDLE_AWVALID, 
  m_axi_INPUT_BUNDLE_AWREADY, m_axi_INPUT_BUNDLE_WDATA, m_axi_INPUT_BUNDLE_WSTRB, 
  m_axi_INPUT_BUNDLE_WLAST, m_axi_INPUT_BUNDLE_WVALID, m_axi_INPUT_BUNDLE_WREADY, 
  m_axi_INPUT_BUNDLE_BRESP, m_axi_INPUT_BUNDLE_BVALID, m_axi_INPUT_BUNDLE_BREADY, 
  m_axi_INPUT_BUNDLE_ARADDR, m_axi_INPUT_BUNDLE_ARLEN, m_axi_INPUT_BUNDLE_ARSIZE, 
  m_axi_INPUT_BUNDLE_ARBURST, m_axi_INPUT_BUNDLE_ARLOCK, m_axi_INPUT_BUNDLE_ARREGION, 
  m_axi_INPUT_BUNDLE_ARCACHE, m_axi_INPUT_BUNDLE_ARPROT, m_axi_INPUT_BUNDLE_ARQOS, 
  m_axi_INPUT_BUNDLE_ARVALID, m_axi_INPUT_BUNDLE_ARREADY, m_axi_INPUT_BUNDLE_RDATA, 
  m_axi_INPUT_BUNDLE_RRESP, m_axi_INPUT_BUNDLE_RLAST, m_axi_INPUT_BUNDLE_RVALID, 
  m_axi_INPUT_BUNDLE_RREADY, m_axi_OUTPUT_BUNDLE_AWADDR, m_axi_OUTPUT_BUNDLE_AWLEN, 
  m_axi_OUTPUT_BUNDLE_AWSIZE, m_axi_OUTPUT_BUNDLE_AWBURST, m_axi_OUTPUT_BUNDLE_AWLOCK, 
  m_axi_OUTPUT_BUNDLE_AWREGION, m_axi_OUTPUT_BUNDLE_AWCACHE, 
  m_axi_OUTPUT_BUNDLE_AWPROT, m_axi_OUTPUT_BUNDLE_AWQOS, m_axi_OUTPUT_BUNDLE_AWVALID, 
  m_axi_OUTPUT_BUNDLE_AWREADY, m_axi_OUTPUT_BUNDLE_WDATA, m_axi_OUTPUT_BUNDLE_WSTRB, 
  m_axi_OUTPUT_BUNDLE_WLAST, m_axi_OUTPUT_BUNDLE_WVALID, m_axi_OUTPUT_BUNDLE_WREADY, 
  m_axi_OUTPUT_BUNDLE_BRESP, m_axi_OUTPUT_BUNDLE_BVALID, m_axi_OUTPUT_BUNDLE_BREADY, 
  m_axi_OUTPUT_BUNDLE_ARADDR, m_axi_OUTPUT_BUNDLE_ARLEN, m_axi_OUTPUT_BUNDLE_ARSIZE, 
  m_axi_OUTPUT_BUNDLE_ARBURST, m_axi_OUTPUT_BUNDLE_ARLOCK, 
  m_axi_OUTPUT_BUNDLE_ARREGION, m_axi_OUTPUT_BUNDLE_ARCACHE, 
  m_axi_OUTPUT_BUNDLE_ARPROT, m_axi_OUTPUT_BUNDLE_ARQOS, m_axi_OUTPUT_BUNDLE_ARVALID, 
  m_axi_OUTPUT_BUNDLE_ARREADY, m_axi_OUTPUT_BUNDLE_RDATA, m_axi_OUTPUT_BUNDLE_RRESP, 
  m_axi_OUTPUT_BUNDLE_RLAST, m_axi_OUTPUT_BUNDLE_RVALID, m_axi_OUTPUT_BUNDLE_RREADY)
/* synthesis syn_black_box black_box_pad_pin="s_axi_AXILiteS_AWADDR[4:0],s_axi_AXILiteS_AWVALID,s_axi_AXILiteS_AWREADY,s_axi_AXILiteS_WDATA[31:0],s_axi_AXILiteS_WSTRB[3:0],s_axi_AXILiteS_WVALID,s_axi_AXILiteS_WREADY,s_axi_AXILiteS_BRESP[1:0],s_axi_AXILiteS_BVALID,s_axi_AXILiteS_BREADY,s_axi_AXILiteS_ARADDR[4:0],s_axi_AXILiteS_ARVALID,s_axi_AXILiteS_ARREADY,s_axi_AXILiteS_RDATA[31:0],s_axi_AXILiteS_RRESP[1:0],s_axi_AXILiteS_RVALID,s_axi_AXILiteS_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_INPUT_BUNDLE_AWADDR[31:0],m_axi_INPUT_BUNDLE_AWLEN[7:0],m_axi_INPUT_BUNDLE_AWSIZE[2:0],m_axi_INPUT_BUNDLE_AWBURST[1:0],m_axi_INPUT_BUNDLE_AWLOCK[1:0],m_axi_INPUT_BUNDLE_AWREGION[3:0],m_axi_INPUT_BUNDLE_AWCACHE[3:0],m_axi_INPUT_BUNDLE_AWPROT[2:0],m_axi_INPUT_BUNDLE_AWQOS[3:0],m_axi_INPUT_BUNDLE_AWVALID,m_axi_INPUT_BUNDLE_AWREADY,m_axi_INPUT_BUNDLE_WDATA[31:0],m_axi_INPUT_BUNDLE_WSTRB[3:0],m_axi_INPUT_BUNDLE_WLAST,m_axi_INPUT_BUNDLE_WVALID,m_axi_INPUT_BUNDLE_WREADY,m_axi_INPUT_BUNDLE_BRESP[1:0],m_axi_INPUT_BUNDLE_BVALID,m_axi_INPUT_BUNDLE_BREADY,m_axi_INPUT_BUNDLE_ARADDR[31:0],m_axi_INPUT_BUNDLE_ARLEN[7:0],m_axi_INPUT_BUNDLE_ARSIZE[2:0],m_axi_INPUT_BUNDLE_ARBURST[1:0],m_axi_INPUT_BUNDLE_ARLOCK[1:0],m_axi_INPUT_BUNDLE_ARREGION[3:0],m_axi_INPUT_BUNDLE_ARCACHE[3:0],m_axi_INPUT_BUNDLE_ARPROT[2:0],m_axi_INPUT_BUNDLE_ARQOS[3:0],m_axi_INPUT_BUNDLE_ARVALID,m_axi_INPUT_BUNDLE_ARREADY,m_axi_INPUT_BUNDLE_RDATA[31:0],m_axi_INPUT_BUNDLE_RRESP[1:0],m_axi_INPUT_BUNDLE_RLAST,m_axi_INPUT_BUNDLE_RVALID,m_axi_INPUT_BUNDLE_RREADY,m_axi_OUTPUT_BUNDLE_AWADDR[31:0],m_axi_OUTPUT_BUNDLE_AWLEN[7:0],m_axi_OUTPUT_BUNDLE_AWSIZE[2:0],m_axi_OUTPUT_BUNDLE_AWBURST[1:0],m_axi_OUTPUT_BUNDLE_AWLOCK[1:0],m_axi_OUTPUT_BUNDLE_AWREGION[3:0],m_axi_OUTPUT_BUNDLE_AWCACHE[3:0],m_axi_OUTPUT_BUNDLE_AWPROT[2:0],m_axi_OUTPUT_BUNDLE_AWQOS[3:0],m_axi_OUTPUT_BUNDLE_AWVALID,m_axi_OUTPUT_BUNDLE_AWREADY,m_axi_OUTPUT_BUNDLE_WDATA[31:0],m_axi_OUTPUT_BUNDLE_WSTRB[3:0],m_axi_OUTPUT_BUNDLE_WLAST,m_axi_OUTPUT_BUNDLE_WVALID,m_axi_OUTPUT_BUNDLE_WREADY,m_axi_OUTPUT_BUNDLE_BRESP[1:0],m_axi_OUTPUT_BUNDLE_BVALID,m_axi_OUTPUT_BUNDLE_BREADY,m_axi_OUTPUT_BUNDLE_ARADDR[31:0],m_axi_OUTPUT_BUNDLE_ARLEN[7:0],m_axi_OUTPUT_BUNDLE_ARSIZE[2:0],m_axi_OUTPUT_BUNDLE_ARBURST[1:0],m_axi_OUTPUT_BUNDLE_ARLOCK[1:0],m_axi_OUTPUT_BUNDLE_ARREGION[3:0],m_axi_OUTPUT_BUNDLE_ARCACHE[3:0],m_axi_OUTPUT_BUNDLE_ARPROT[2:0],m_axi_OUTPUT_BUNDLE_ARQOS[3:0],m_axi_OUTPUT_BUNDLE_ARVALID,m_axi_OUTPUT_BUNDLE_ARREADY,m_axi_OUTPUT_BUNDLE_RDATA[31:0],m_axi_OUTPUT_BUNDLE_RRESP[1:0],m_axi_OUTPUT_BUNDLE_RLAST,m_axi_OUTPUT_BUNDLE_RVALID,m_axi_OUTPUT_BUNDLE_RREADY" */;
  input [4:0]s_axi_AXILiteS_AWADDR;
  input s_axi_AXILiteS_AWVALID;
  output s_axi_AXILiteS_AWREADY;
  input [31:0]s_axi_AXILiteS_WDATA;
  input [3:0]s_axi_AXILiteS_WSTRB;
  input s_axi_AXILiteS_WVALID;
  output s_axi_AXILiteS_WREADY;
  output [1:0]s_axi_AXILiteS_BRESP;
  output s_axi_AXILiteS_BVALID;
  input s_axi_AXILiteS_BREADY;
  input [4:0]s_axi_AXILiteS_ARADDR;
  input s_axi_AXILiteS_ARVALID;
  output s_axi_AXILiteS_ARREADY;
  output [31:0]s_axi_AXILiteS_RDATA;
  output [1:0]s_axi_AXILiteS_RRESP;
  output s_axi_AXILiteS_RVALID;
  input s_axi_AXILiteS_RREADY;
  input ap_clk;
  input ap_rst_n;
  output interrupt;
  output [31:0]m_axi_INPUT_BUNDLE_AWADDR;
  output [7:0]m_axi_INPUT_BUNDLE_AWLEN;
  output [2:0]m_axi_INPUT_BUNDLE_AWSIZE;
  output [1:0]m_axi_INPUT_BUNDLE_AWBURST;
  output [1:0]m_axi_INPUT_BUNDLE_AWLOCK;
  output [3:0]m_axi_INPUT_BUNDLE_AWREGION;
  output [3:0]m_axi_INPUT_BUNDLE_AWCACHE;
  output [2:0]m_axi_INPUT_BUNDLE_AWPROT;
  output [3:0]m_axi_INPUT_BUNDLE_AWQOS;
  output m_axi_INPUT_BUNDLE_AWVALID;
  input m_axi_INPUT_BUNDLE_AWREADY;
  output [31:0]m_axi_INPUT_BUNDLE_WDATA;
  output [3:0]m_axi_INPUT_BUNDLE_WSTRB;
  output m_axi_INPUT_BUNDLE_WLAST;
  output m_axi_INPUT_BUNDLE_WVALID;
  input m_axi_INPUT_BUNDLE_WREADY;
  input [1:0]m_axi_INPUT_BUNDLE_BRESP;
  input m_axi_INPUT_BUNDLE_BVALID;
  output m_axi_INPUT_BUNDLE_BREADY;
  output [31:0]m_axi_INPUT_BUNDLE_ARADDR;
  output [7:0]m_axi_INPUT_BUNDLE_ARLEN;
  output [2:0]m_axi_INPUT_BUNDLE_ARSIZE;
  output [1:0]m_axi_INPUT_BUNDLE_ARBURST;
  output [1:0]m_axi_INPUT_BUNDLE_ARLOCK;
  output [3:0]m_axi_INPUT_BUNDLE_ARREGION;
  output [3:0]m_axi_INPUT_BUNDLE_ARCACHE;
  output [2:0]m_axi_INPUT_BUNDLE_ARPROT;
  output [3:0]m_axi_INPUT_BUNDLE_ARQOS;
  output m_axi_INPUT_BUNDLE_ARVALID;
  input m_axi_INPUT_BUNDLE_ARREADY;
  input [31:0]m_axi_INPUT_BUNDLE_RDATA;
  input [1:0]m_axi_INPUT_BUNDLE_RRESP;
  input m_axi_INPUT_BUNDLE_RLAST;
  input m_axi_INPUT_BUNDLE_RVALID;
  output m_axi_INPUT_BUNDLE_RREADY;
  output [31:0]m_axi_OUTPUT_BUNDLE_AWADDR;
  output [7:0]m_axi_OUTPUT_BUNDLE_AWLEN;
  output [2:0]m_axi_OUTPUT_BUNDLE_AWSIZE;
  output [1:0]m_axi_OUTPUT_BUNDLE_AWBURST;
  output [1:0]m_axi_OUTPUT_BUNDLE_AWLOCK;
  output [3:0]m_axi_OUTPUT_BUNDLE_AWREGION;
  output [3:0]m_axi_OUTPUT_BUNDLE_AWCACHE;
  output [2:0]m_axi_OUTPUT_BUNDLE_AWPROT;
  output [3:0]m_axi_OUTPUT_BUNDLE_AWQOS;
  output m_axi_OUTPUT_BUNDLE_AWVALID;
  input m_axi_OUTPUT_BUNDLE_AWREADY;
  output [31:0]m_axi_OUTPUT_BUNDLE_WDATA;
  output [3:0]m_axi_OUTPUT_BUNDLE_WSTRB;
  output m_axi_OUTPUT_BUNDLE_WLAST;
  output m_axi_OUTPUT_BUNDLE_WVALID;
  input m_axi_OUTPUT_BUNDLE_WREADY;
  input [1:0]m_axi_OUTPUT_BUNDLE_BRESP;
  input m_axi_OUTPUT_BUNDLE_BVALID;
  output m_axi_OUTPUT_BUNDLE_BREADY;
  output [31:0]m_axi_OUTPUT_BUNDLE_ARADDR;
  output [7:0]m_axi_OUTPUT_BUNDLE_ARLEN;
  output [2:0]m_axi_OUTPUT_BUNDLE_ARSIZE;
  output [1:0]m_axi_OUTPUT_BUNDLE_ARBURST;
  output [1:0]m_axi_OUTPUT_BUNDLE_ARLOCK;
  output [3:0]m_axi_OUTPUT_BUNDLE_ARREGION;
  output [3:0]m_axi_OUTPUT_BUNDLE_ARCACHE;
  output [2:0]m_axi_OUTPUT_BUNDLE_ARPROT;
  output [3:0]m_axi_OUTPUT_BUNDLE_ARQOS;
  output m_axi_OUTPUT_BUNDLE_ARVALID;
  input m_axi_OUTPUT_BUNDLE_ARREADY;
  input [31:0]m_axi_OUTPUT_BUNDLE_RDATA;
  input [1:0]m_axi_OUTPUT_BUNDLE_RRESP;
  input m_axi_OUTPUT_BUNDLE_RLAST;
  input m_axi_OUTPUT_BUNDLE_RVALID;
  output m_axi_OUTPUT_BUNDLE_RREADY;
endmodule
