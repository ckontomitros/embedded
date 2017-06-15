// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:sobel:1.0
// IP Revision: 1706121729

(* X_CORE_INFO = "sobel,Vivado 2016.4" *)
(* CHECK_LICENSE_TYPE = "arm_sobel_0_1,sobel,{}" *)
(* CORE_GENERATION_INFO = "arm_sobel_0_1,sobel,{x_ipProduct=Vivado 2016.4,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=sobel,x_ipVersion=1.0,x_ipCoreRevision=1706121729,x_ipLanguage=VERILOG,x_ipSimLanguage=VERILOG,C_S_AXI_AXILITES_ADDR_WIDTH=5,C_S_AXI_AXILITES_DATA_WIDTH=32,C_M_AXI_INPUT_BUNDLE_ID_WIDTH=1,C_M_AXI_INPUT_BUNDLE_ADDR_WIDTH=32,C_M_AXI_INPUT_BUNDLE_DATA_WIDTH=32,C_M_AXI_INPUT_BUNDLE_AWUSER_WIDTH=1,C_M_AXI_INPUT_BUNDLE_ARUSER_WIDTH=1,C_M_AXI_INPUT_BUNDLE_WUSER_WIDTH=1,C_M_AXI_INPUT_BUNDLE_RUSER_WIDTH=1,C_M_AX\
I_INPUT_BUNDLE_BUSER_WIDTH=1,C_M_AXI_INPUT_BUNDLE_USER_VALUE=0x00000000,C_M_AXI_INPUT_BUNDLE_PROT_VALUE=000,C_M_AXI_INPUT_BUNDLE_CACHE_VALUE=0011,C_M_AXI_OUTPUT_BUNDLE_ID_WIDTH=1,C_M_AXI_OUTPUT_BUNDLE_ADDR_WIDTH=32,C_M_AXI_OUTPUT_BUNDLE_DATA_WIDTH=32,C_M_AXI_OUTPUT_BUNDLE_AWUSER_WIDTH=1,C_M_AXI_OUTPUT_BUNDLE_ARUSER_WIDTH=1,C_M_AXI_OUTPUT_BUNDLE_WUSER_WIDTH=1,C_M_AXI_OUTPUT_BUNDLE_RUSER_WIDTH=1,C_M_AXI_OUTPUT_BUNDLE_BUSER_WIDTH=1,C_M_AXI_OUTPUT_BUNDLE_USER_VALUE=0x00000000,C_M_AXI_OUTPUT_BUNDLE_P\
ROT_VALUE=000,C_M_AXI_OUTPUT_BUNDLE_CACHE_VALUE=0011}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module arm_sobel_0_1 (
  s_axi_AXILiteS_AWADDR,
  s_axi_AXILiteS_AWVALID,
  s_axi_AXILiteS_AWREADY,
  s_axi_AXILiteS_WDATA,
  s_axi_AXILiteS_WSTRB,
  s_axi_AXILiteS_WVALID,
  s_axi_AXILiteS_WREADY,
  s_axi_AXILiteS_BRESP,
  s_axi_AXILiteS_BVALID,
  s_axi_AXILiteS_BREADY,
  s_axi_AXILiteS_ARADDR,
  s_axi_AXILiteS_ARVALID,
  s_axi_AXILiteS_ARREADY,
  s_axi_AXILiteS_RDATA,
  s_axi_AXILiteS_RRESP,
  s_axi_AXILiteS_RVALID,
  s_axi_AXILiteS_RREADY,
  ap_clk,
  ap_rst_n,
  interrupt,
  m_axi_INPUT_BUNDLE_AWADDR,
  m_axi_INPUT_BUNDLE_AWLEN,
  m_axi_INPUT_BUNDLE_AWSIZE,
  m_axi_INPUT_BUNDLE_AWBURST,
  m_axi_INPUT_BUNDLE_AWLOCK,
  m_axi_INPUT_BUNDLE_AWREGION,
  m_axi_INPUT_BUNDLE_AWCACHE,
  m_axi_INPUT_BUNDLE_AWPROT,
  m_axi_INPUT_BUNDLE_AWQOS,
  m_axi_INPUT_BUNDLE_AWVALID,
  m_axi_INPUT_BUNDLE_AWREADY,
  m_axi_INPUT_BUNDLE_WDATA,
  m_axi_INPUT_BUNDLE_WSTRB,
  m_axi_INPUT_BUNDLE_WLAST,
  m_axi_INPUT_BUNDLE_WVALID,
  m_axi_INPUT_BUNDLE_WREADY,
  m_axi_INPUT_BUNDLE_BRESP,
  m_axi_INPUT_BUNDLE_BVALID,
  m_axi_INPUT_BUNDLE_BREADY,
  m_axi_INPUT_BUNDLE_ARADDR,
  m_axi_INPUT_BUNDLE_ARLEN,
  m_axi_INPUT_BUNDLE_ARSIZE,
  m_axi_INPUT_BUNDLE_ARBURST,
  m_axi_INPUT_BUNDLE_ARLOCK,
  m_axi_INPUT_BUNDLE_ARREGION,
  m_axi_INPUT_BUNDLE_ARCACHE,
  m_axi_INPUT_BUNDLE_ARPROT,
  m_axi_INPUT_BUNDLE_ARQOS,
  m_axi_INPUT_BUNDLE_ARVALID,
  m_axi_INPUT_BUNDLE_ARREADY,
  m_axi_INPUT_BUNDLE_RDATA,
  m_axi_INPUT_BUNDLE_RRESP,
  m_axi_INPUT_BUNDLE_RLAST,
  m_axi_INPUT_BUNDLE_RVALID,
  m_axi_INPUT_BUNDLE_RREADY,
  m_axi_OUTPUT_BUNDLE_AWADDR,
  m_axi_OUTPUT_BUNDLE_AWLEN,
  m_axi_OUTPUT_BUNDLE_AWSIZE,
  m_axi_OUTPUT_BUNDLE_AWBURST,
  m_axi_OUTPUT_BUNDLE_AWLOCK,
  m_axi_OUTPUT_BUNDLE_AWREGION,
  m_axi_OUTPUT_BUNDLE_AWCACHE,
  m_axi_OUTPUT_BUNDLE_AWPROT,
  m_axi_OUTPUT_BUNDLE_AWQOS,
  m_axi_OUTPUT_BUNDLE_AWVALID,
  m_axi_OUTPUT_BUNDLE_AWREADY,
  m_axi_OUTPUT_BUNDLE_WDATA,
  m_axi_OUTPUT_BUNDLE_WSTRB,
  m_axi_OUTPUT_BUNDLE_WLAST,
  m_axi_OUTPUT_BUNDLE_WVALID,
  m_axi_OUTPUT_BUNDLE_WREADY,
  m_axi_OUTPUT_BUNDLE_BRESP,
  m_axi_OUTPUT_BUNDLE_BVALID,
  m_axi_OUTPUT_BUNDLE_BREADY,
  m_axi_OUTPUT_BUNDLE_ARADDR,
  m_axi_OUTPUT_BUNDLE_ARLEN,
  m_axi_OUTPUT_BUNDLE_ARSIZE,
  m_axi_OUTPUT_BUNDLE_ARBURST,
  m_axi_OUTPUT_BUNDLE_ARLOCK,
  m_axi_OUTPUT_BUNDLE_ARREGION,
  m_axi_OUTPUT_BUNDLE_ARCACHE,
  m_axi_OUTPUT_BUNDLE_ARPROT,
  m_axi_OUTPUT_BUNDLE_ARQOS,
  m_axi_OUTPUT_BUNDLE_ARVALID,
  m_axi_OUTPUT_BUNDLE_ARREADY,
  m_axi_OUTPUT_BUNDLE_RDATA,
  m_axi_OUTPUT_BUNDLE_RRESP,
  m_axi_OUTPUT_BUNDLE_RLAST,
  m_axi_OUTPUT_BUNDLE_RVALID,
  m_axi_OUTPUT_BUNDLE_RREADY
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWADDR" *)
input wire [4 : 0] s_axi_AXILiteS_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWVALID" *)
input wire s_axi_AXILiteS_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWREADY" *)
output wire s_axi_AXILiteS_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WDATA" *)
input wire [31 : 0] s_axi_AXILiteS_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WSTRB" *)
input wire [3 : 0] s_axi_AXILiteS_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WVALID" *)
input wire s_axi_AXILiteS_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WREADY" *)
output wire s_axi_AXILiteS_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BRESP" *)
output wire [1 : 0] s_axi_AXILiteS_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BVALID" *)
output wire s_axi_AXILiteS_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BREADY" *)
input wire s_axi_AXILiteS_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARADDR" *)
input wire [4 : 0] s_axi_AXILiteS_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARVALID" *)
input wire s_axi_AXILiteS_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARREADY" *)
output wire s_axi_AXILiteS_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RDATA" *)
output wire [31 : 0] s_axi_AXILiteS_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RRESP" *)
output wire [1 : 0] s_axi_AXILiteS_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RVALID" *)
output wire s_axi_AXILiteS_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RREADY" *)
input wire s_axi_AXILiteS_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWADDR" *)
output wire [31 : 0] m_axi_INPUT_BUNDLE_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWLEN" *)
output wire [7 : 0] m_axi_INPUT_BUNDLE_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWSIZE" *)
output wire [2 : 0] m_axi_INPUT_BUNDLE_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWBURST" *)
output wire [1 : 0] m_axi_INPUT_BUNDLE_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWLOCK" *)
output wire [1 : 0] m_axi_INPUT_BUNDLE_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWREGION" *)
output wire [3 : 0] m_axi_INPUT_BUNDLE_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWCACHE" *)
output wire [3 : 0] m_axi_INPUT_BUNDLE_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWPROT" *)
output wire [2 : 0] m_axi_INPUT_BUNDLE_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWQOS" *)
output wire [3 : 0] m_axi_INPUT_BUNDLE_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWVALID" *)
output wire m_axi_INPUT_BUNDLE_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE AWREADY" *)
input wire m_axi_INPUT_BUNDLE_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE WDATA" *)
output wire [31 : 0] m_axi_INPUT_BUNDLE_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE WSTRB" *)
output wire [3 : 0] m_axi_INPUT_BUNDLE_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE WLAST" *)
output wire m_axi_INPUT_BUNDLE_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE WVALID" *)
output wire m_axi_INPUT_BUNDLE_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE WREADY" *)
input wire m_axi_INPUT_BUNDLE_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE BRESP" *)
input wire [1 : 0] m_axi_INPUT_BUNDLE_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE BVALID" *)
input wire m_axi_INPUT_BUNDLE_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE BREADY" *)
output wire m_axi_INPUT_BUNDLE_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARADDR" *)
output wire [31 : 0] m_axi_INPUT_BUNDLE_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARLEN" *)
output wire [7 : 0] m_axi_INPUT_BUNDLE_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARSIZE" *)
output wire [2 : 0] m_axi_INPUT_BUNDLE_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARBURST" *)
output wire [1 : 0] m_axi_INPUT_BUNDLE_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARLOCK" *)
output wire [1 : 0] m_axi_INPUT_BUNDLE_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARREGION" *)
output wire [3 : 0] m_axi_INPUT_BUNDLE_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARCACHE" *)
output wire [3 : 0] m_axi_INPUT_BUNDLE_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARPROT" *)
output wire [2 : 0] m_axi_INPUT_BUNDLE_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARQOS" *)
output wire [3 : 0] m_axi_INPUT_BUNDLE_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARVALID" *)
output wire m_axi_INPUT_BUNDLE_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE ARREADY" *)
input wire m_axi_INPUT_BUNDLE_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE RDATA" *)
input wire [31 : 0] m_axi_INPUT_BUNDLE_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE RRESP" *)
input wire [1 : 0] m_axi_INPUT_BUNDLE_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE RLAST" *)
input wire m_axi_INPUT_BUNDLE_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE RVALID" *)
input wire m_axi_INPUT_BUNDLE_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_INPUT_BUNDLE RREADY" *)
output wire m_axi_INPUT_BUNDLE_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWADDR" *)
output wire [31 : 0] m_axi_OUTPUT_BUNDLE_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWLEN" *)
output wire [7 : 0] m_axi_OUTPUT_BUNDLE_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWSIZE" *)
output wire [2 : 0] m_axi_OUTPUT_BUNDLE_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWBURST" *)
output wire [1 : 0] m_axi_OUTPUT_BUNDLE_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWLOCK" *)
output wire [1 : 0] m_axi_OUTPUT_BUNDLE_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWREGION" *)
output wire [3 : 0] m_axi_OUTPUT_BUNDLE_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWCACHE" *)
output wire [3 : 0] m_axi_OUTPUT_BUNDLE_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWPROT" *)
output wire [2 : 0] m_axi_OUTPUT_BUNDLE_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWQOS" *)
output wire [3 : 0] m_axi_OUTPUT_BUNDLE_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWVALID" *)
output wire m_axi_OUTPUT_BUNDLE_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE AWREADY" *)
input wire m_axi_OUTPUT_BUNDLE_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE WDATA" *)
output wire [31 : 0] m_axi_OUTPUT_BUNDLE_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE WSTRB" *)
output wire [3 : 0] m_axi_OUTPUT_BUNDLE_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE WLAST" *)
output wire m_axi_OUTPUT_BUNDLE_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE WVALID" *)
output wire m_axi_OUTPUT_BUNDLE_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE WREADY" *)
input wire m_axi_OUTPUT_BUNDLE_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE BRESP" *)
input wire [1 : 0] m_axi_OUTPUT_BUNDLE_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE BVALID" *)
input wire m_axi_OUTPUT_BUNDLE_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE BREADY" *)
output wire m_axi_OUTPUT_BUNDLE_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARADDR" *)
output wire [31 : 0] m_axi_OUTPUT_BUNDLE_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARLEN" *)
output wire [7 : 0] m_axi_OUTPUT_BUNDLE_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARSIZE" *)
output wire [2 : 0] m_axi_OUTPUT_BUNDLE_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARBURST" *)
output wire [1 : 0] m_axi_OUTPUT_BUNDLE_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARLOCK" *)
output wire [1 : 0] m_axi_OUTPUT_BUNDLE_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARREGION" *)
output wire [3 : 0] m_axi_OUTPUT_BUNDLE_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARCACHE" *)
output wire [3 : 0] m_axi_OUTPUT_BUNDLE_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARPROT" *)
output wire [2 : 0] m_axi_OUTPUT_BUNDLE_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARQOS" *)
output wire [3 : 0] m_axi_OUTPUT_BUNDLE_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARVALID" *)
output wire m_axi_OUTPUT_BUNDLE_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE ARREADY" *)
input wire m_axi_OUTPUT_BUNDLE_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE RDATA" *)
input wire [31 : 0] m_axi_OUTPUT_BUNDLE_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE RRESP" *)
input wire [1 : 0] m_axi_OUTPUT_BUNDLE_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE RLAST" *)
input wire m_axi_OUTPUT_BUNDLE_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE RVALID" *)
input wire m_axi_OUTPUT_BUNDLE_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_OUTPUT_BUNDLE RREADY" *)
output wire m_axi_OUTPUT_BUNDLE_RREADY;

  sobel #(
    .C_S_AXI_AXILITES_ADDR_WIDTH(5),
    .C_S_AXI_AXILITES_DATA_WIDTH(32),
    .C_M_AXI_INPUT_BUNDLE_ID_WIDTH(1),
    .C_M_AXI_INPUT_BUNDLE_ADDR_WIDTH(32),
    .C_M_AXI_INPUT_BUNDLE_DATA_WIDTH(32),
    .C_M_AXI_INPUT_BUNDLE_AWUSER_WIDTH(1),
    .C_M_AXI_INPUT_BUNDLE_ARUSER_WIDTH(1),
    .C_M_AXI_INPUT_BUNDLE_WUSER_WIDTH(1),
    .C_M_AXI_INPUT_BUNDLE_RUSER_WIDTH(1),
    .C_M_AXI_INPUT_BUNDLE_BUSER_WIDTH(1),
    .C_M_AXI_INPUT_BUNDLE_USER_VALUE('H00000000),
    .C_M_AXI_INPUT_BUNDLE_PROT_VALUE('B000),
    .C_M_AXI_INPUT_BUNDLE_CACHE_VALUE('B0011),
    .C_M_AXI_OUTPUT_BUNDLE_ID_WIDTH(1),
    .C_M_AXI_OUTPUT_BUNDLE_ADDR_WIDTH(32),
    .C_M_AXI_OUTPUT_BUNDLE_DATA_WIDTH(32),
    .C_M_AXI_OUTPUT_BUNDLE_AWUSER_WIDTH(1),
    .C_M_AXI_OUTPUT_BUNDLE_ARUSER_WIDTH(1),
    .C_M_AXI_OUTPUT_BUNDLE_WUSER_WIDTH(1),
    .C_M_AXI_OUTPUT_BUNDLE_RUSER_WIDTH(1),
    .C_M_AXI_OUTPUT_BUNDLE_BUSER_WIDTH(1),
    .C_M_AXI_OUTPUT_BUNDLE_USER_VALUE('H00000000),
    .C_M_AXI_OUTPUT_BUNDLE_PROT_VALUE('B000),
    .C_M_AXI_OUTPUT_BUNDLE_CACHE_VALUE('B0011)
  ) inst (
    .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),
    .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),
    .s_axi_AXILiteS_AWREADY(s_axi_AXILiteS_AWREADY),
    .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),
    .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),
    .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID),
    .s_axi_AXILiteS_WREADY(s_axi_AXILiteS_WREADY),
    .s_axi_AXILiteS_BRESP(s_axi_AXILiteS_BRESP),
    .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_BVALID),
    .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),
    .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),
    .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),
    .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_ARREADY),
    .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),
    .s_axi_AXILiteS_RRESP(s_axi_AXILiteS_RRESP),
    .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),
    .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .m_axi_INPUT_BUNDLE_AWID(),
    .m_axi_INPUT_BUNDLE_AWADDR(m_axi_INPUT_BUNDLE_AWADDR),
    .m_axi_INPUT_BUNDLE_AWLEN(m_axi_INPUT_BUNDLE_AWLEN),
    .m_axi_INPUT_BUNDLE_AWSIZE(m_axi_INPUT_BUNDLE_AWSIZE),
    .m_axi_INPUT_BUNDLE_AWBURST(m_axi_INPUT_BUNDLE_AWBURST),
    .m_axi_INPUT_BUNDLE_AWLOCK(m_axi_INPUT_BUNDLE_AWLOCK),
    .m_axi_INPUT_BUNDLE_AWREGION(m_axi_INPUT_BUNDLE_AWREGION),
    .m_axi_INPUT_BUNDLE_AWCACHE(m_axi_INPUT_BUNDLE_AWCACHE),
    .m_axi_INPUT_BUNDLE_AWPROT(m_axi_INPUT_BUNDLE_AWPROT),
    .m_axi_INPUT_BUNDLE_AWQOS(m_axi_INPUT_BUNDLE_AWQOS),
    .m_axi_INPUT_BUNDLE_AWUSER(),
    .m_axi_INPUT_BUNDLE_AWVALID(m_axi_INPUT_BUNDLE_AWVALID),
    .m_axi_INPUT_BUNDLE_AWREADY(m_axi_INPUT_BUNDLE_AWREADY),
    .m_axi_INPUT_BUNDLE_WID(),
    .m_axi_INPUT_BUNDLE_WDATA(m_axi_INPUT_BUNDLE_WDATA),
    .m_axi_INPUT_BUNDLE_WSTRB(m_axi_INPUT_BUNDLE_WSTRB),
    .m_axi_INPUT_BUNDLE_WLAST(m_axi_INPUT_BUNDLE_WLAST),
    .m_axi_INPUT_BUNDLE_WUSER(),
    .m_axi_INPUT_BUNDLE_WVALID(m_axi_INPUT_BUNDLE_WVALID),
    .m_axi_INPUT_BUNDLE_WREADY(m_axi_INPUT_BUNDLE_WREADY),
    .m_axi_INPUT_BUNDLE_BID(1'B0),
    .m_axi_INPUT_BUNDLE_BRESP(m_axi_INPUT_BUNDLE_BRESP),
    .m_axi_INPUT_BUNDLE_BUSER(1'B0),
    .m_axi_INPUT_BUNDLE_BVALID(m_axi_INPUT_BUNDLE_BVALID),
    .m_axi_INPUT_BUNDLE_BREADY(m_axi_INPUT_BUNDLE_BREADY),
    .m_axi_INPUT_BUNDLE_ARID(),
    .m_axi_INPUT_BUNDLE_ARADDR(m_axi_INPUT_BUNDLE_ARADDR),
    .m_axi_INPUT_BUNDLE_ARLEN(m_axi_INPUT_BUNDLE_ARLEN),
    .m_axi_INPUT_BUNDLE_ARSIZE(m_axi_INPUT_BUNDLE_ARSIZE),
    .m_axi_INPUT_BUNDLE_ARBURST(m_axi_INPUT_BUNDLE_ARBURST),
    .m_axi_INPUT_BUNDLE_ARLOCK(m_axi_INPUT_BUNDLE_ARLOCK),
    .m_axi_INPUT_BUNDLE_ARREGION(m_axi_INPUT_BUNDLE_ARREGION),
    .m_axi_INPUT_BUNDLE_ARCACHE(m_axi_INPUT_BUNDLE_ARCACHE),
    .m_axi_INPUT_BUNDLE_ARPROT(m_axi_INPUT_BUNDLE_ARPROT),
    .m_axi_INPUT_BUNDLE_ARQOS(m_axi_INPUT_BUNDLE_ARQOS),
    .m_axi_INPUT_BUNDLE_ARUSER(),
    .m_axi_INPUT_BUNDLE_ARVALID(m_axi_INPUT_BUNDLE_ARVALID),
    .m_axi_INPUT_BUNDLE_ARREADY(m_axi_INPUT_BUNDLE_ARREADY),
    .m_axi_INPUT_BUNDLE_RID(1'B0),
    .m_axi_INPUT_BUNDLE_RDATA(m_axi_INPUT_BUNDLE_RDATA),
    .m_axi_INPUT_BUNDLE_RRESP(m_axi_INPUT_BUNDLE_RRESP),
    .m_axi_INPUT_BUNDLE_RLAST(m_axi_INPUT_BUNDLE_RLAST),
    .m_axi_INPUT_BUNDLE_RUSER(1'B0),
    .m_axi_INPUT_BUNDLE_RVALID(m_axi_INPUT_BUNDLE_RVALID),
    .m_axi_INPUT_BUNDLE_RREADY(m_axi_INPUT_BUNDLE_RREADY),
    .m_axi_OUTPUT_BUNDLE_AWID(),
    .m_axi_OUTPUT_BUNDLE_AWADDR(m_axi_OUTPUT_BUNDLE_AWADDR),
    .m_axi_OUTPUT_BUNDLE_AWLEN(m_axi_OUTPUT_BUNDLE_AWLEN),
    .m_axi_OUTPUT_BUNDLE_AWSIZE(m_axi_OUTPUT_BUNDLE_AWSIZE),
    .m_axi_OUTPUT_BUNDLE_AWBURST(m_axi_OUTPUT_BUNDLE_AWBURST),
    .m_axi_OUTPUT_BUNDLE_AWLOCK(m_axi_OUTPUT_BUNDLE_AWLOCK),
    .m_axi_OUTPUT_BUNDLE_AWREGION(m_axi_OUTPUT_BUNDLE_AWREGION),
    .m_axi_OUTPUT_BUNDLE_AWCACHE(m_axi_OUTPUT_BUNDLE_AWCACHE),
    .m_axi_OUTPUT_BUNDLE_AWPROT(m_axi_OUTPUT_BUNDLE_AWPROT),
    .m_axi_OUTPUT_BUNDLE_AWQOS(m_axi_OUTPUT_BUNDLE_AWQOS),
    .m_axi_OUTPUT_BUNDLE_AWUSER(),
    .m_axi_OUTPUT_BUNDLE_AWVALID(m_axi_OUTPUT_BUNDLE_AWVALID),
    .m_axi_OUTPUT_BUNDLE_AWREADY(m_axi_OUTPUT_BUNDLE_AWREADY),
    .m_axi_OUTPUT_BUNDLE_WID(),
    .m_axi_OUTPUT_BUNDLE_WDATA(m_axi_OUTPUT_BUNDLE_WDATA),
    .m_axi_OUTPUT_BUNDLE_WSTRB(m_axi_OUTPUT_BUNDLE_WSTRB),
    .m_axi_OUTPUT_BUNDLE_WLAST(m_axi_OUTPUT_BUNDLE_WLAST),
    .m_axi_OUTPUT_BUNDLE_WUSER(),
    .m_axi_OUTPUT_BUNDLE_WVALID(m_axi_OUTPUT_BUNDLE_WVALID),
    .m_axi_OUTPUT_BUNDLE_WREADY(m_axi_OUTPUT_BUNDLE_WREADY),
    .m_axi_OUTPUT_BUNDLE_BID(1'B0),
    .m_axi_OUTPUT_BUNDLE_BRESP(m_axi_OUTPUT_BUNDLE_BRESP),
    .m_axi_OUTPUT_BUNDLE_BUSER(1'B0),
    .m_axi_OUTPUT_BUNDLE_BVALID(m_axi_OUTPUT_BUNDLE_BVALID),
    .m_axi_OUTPUT_BUNDLE_BREADY(m_axi_OUTPUT_BUNDLE_BREADY),
    .m_axi_OUTPUT_BUNDLE_ARID(),
    .m_axi_OUTPUT_BUNDLE_ARADDR(m_axi_OUTPUT_BUNDLE_ARADDR),
    .m_axi_OUTPUT_BUNDLE_ARLEN(m_axi_OUTPUT_BUNDLE_ARLEN),
    .m_axi_OUTPUT_BUNDLE_ARSIZE(m_axi_OUTPUT_BUNDLE_ARSIZE),
    .m_axi_OUTPUT_BUNDLE_ARBURST(m_axi_OUTPUT_BUNDLE_ARBURST),
    .m_axi_OUTPUT_BUNDLE_ARLOCK(m_axi_OUTPUT_BUNDLE_ARLOCK),
    .m_axi_OUTPUT_BUNDLE_ARREGION(m_axi_OUTPUT_BUNDLE_ARREGION),
    .m_axi_OUTPUT_BUNDLE_ARCACHE(m_axi_OUTPUT_BUNDLE_ARCACHE),
    .m_axi_OUTPUT_BUNDLE_ARPROT(m_axi_OUTPUT_BUNDLE_ARPROT),
    .m_axi_OUTPUT_BUNDLE_ARQOS(m_axi_OUTPUT_BUNDLE_ARQOS),
    .m_axi_OUTPUT_BUNDLE_ARUSER(),
    .m_axi_OUTPUT_BUNDLE_ARVALID(m_axi_OUTPUT_BUNDLE_ARVALID),
    .m_axi_OUTPUT_BUNDLE_ARREADY(m_axi_OUTPUT_BUNDLE_ARREADY),
    .m_axi_OUTPUT_BUNDLE_RID(1'B0),
    .m_axi_OUTPUT_BUNDLE_RDATA(m_axi_OUTPUT_BUNDLE_RDATA),
    .m_axi_OUTPUT_BUNDLE_RRESP(m_axi_OUTPUT_BUNDLE_RRESP),
    .m_axi_OUTPUT_BUNDLE_RLAST(m_axi_OUTPUT_BUNDLE_RLAST),
    .m_axi_OUTPUT_BUNDLE_RUSER(1'B0),
    .m_axi_OUTPUT_BUNDLE_RVALID(m_axi_OUTPUT_BUNDLE_RVALID),
    .m_axi_OUTPUT_BUNDLE_RREADY(m_axi_OUTPUT_BUNDLE_RREADY)
  );
endmodule
