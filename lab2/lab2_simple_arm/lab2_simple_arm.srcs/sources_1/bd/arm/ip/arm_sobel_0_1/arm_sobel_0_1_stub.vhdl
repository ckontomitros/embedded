-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Mon Jun 12 17:55:47 2017
-- Host        : chris running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/konto/Documents/embeded/lab2/lab2_simple_arm/lab2_simple_arm.srcs/sources_1/bd/arm/ip/arm_sobel_0_1/arm_sobel_0_1_stub.vhdl
-- Design      : arm_sobel_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arm_sobel_0_1 is
  Port ( 
    s_axi_AXILiteS_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_AXILiteS_AWVALID : in STD_LOGIC;
    s_axi_AXILiteS_AWREADY : out STD_LOGIC;
    s_axi_AXILiteS_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_AXILiteS_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_AXILiteS_WVALID : in STD_LOGIC;
    s_axi_AXILiteS_WREADY : out STD_LOGIC;
    s_axi_AXILiteS_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_AXILiteS_BVALID : out STD_LOGIC;
    s_axi_AXILiteS_BREADY : in STD_LOGIC;
    s_axi_AXILiteS_ARADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_AXILiteS_ARVALID : in STD_LOGIC;
    s_axi_AXILiteS_ARREADY : out STD_LOGIC;
    s_axi_AXILiteS_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_AXILiteS_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_AXILiteS_RVALID : out STD_LOGIC;
    s_axi_AXILiteS_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_INPUT_BUNDLE_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_INPUT_BUNDLE_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_INPUT_BUNDLE_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_INPUT_BUNDLE_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_INPUT_BUNDLE_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_INPUT_BUNDLE_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_INPUT_BUNDLE_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_INPUT_BUNDLE_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_INPUT_BUNDLE_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_INPUT_BUNDLE_AWVALID : out STD_LOGIC;
    m_axi_INPUT_BUNDLE_AWREADY : in STD_LOGIC;
    m_axi_INPUT_BUNDLE_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_INPUT_BUNDLE_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_INPUT_BUNDLE_WLAST : out STD_LOGIC;
    m_axi_INPUT_BUNDLE_WVALID : out STD_LOGIC;
    m_axi_INPUT_BUNDLE_WREADY : in STD_LOGIC;
    m_axi_INPUT_BUNDLE_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_INPUT_BUNDLE_BVALID : in STD_LOGIC;
    m_axi_INPUT_BUNDLE_BREADY : out STD_LOGIC;
    m_axi_INPUT_BUNDLE_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_INPUT_BUNDLE_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_INPUT_BUNDLE_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_INPUT_BUNDLE_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_INPUT_BUNDLE_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_INPUT_BUNDLE_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_INPUT_BUNDLE_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_INPUT_BUNDLE_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_INPUT_BUNDLE_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_INPUT_BUNDLE_ARVALID : out STD_LOGIC;
    m_axi_INPUT_BUNDLE_ARREADY : in STD_LOGIC;
    m_axi_INPUT_BUNDLE_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_INPUT_BUNDLE_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_INPUT_BUNDLE_RLAST : in STD_LOGIC;
    m_axi_INPUT_BUNDLE_RVALID : in STD_LOGIC;
    m_axi_INPUT_BUNDLE_RREADY : out STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_OUTPUT_BUNDLE_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_OUTPUT_BUNDLE_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_OUTPUT_BUNDLE_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_OUTPUT_BUNDLE_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_OUTPUT_BUNDLE_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_OUTPUT_BUNDLE_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_OUTPUT_BUNDLE_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_OUTPUT_BUNDLE_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_OUTPUT_BUNDLE_AWVALID : out STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_AWREADY : in STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_OUTPUT_BUNDLE_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_OUTPUT_BUNDLE_WLAST : out STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_WVALID : out STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_WREADY : in STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_OUTPUT_BUNDLE_BVALID : in STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_BREADY : out STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_OUTPUT_BUNDLE_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_OUTPUT_BUNDLE_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_OUTPUT_BUNDLE_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_OUTPUT_BUNDLE_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_OUTPUT_BUNDLE_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_OUTPUT_BUNDLE_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_OUTPUT_BUNDLE_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_OUTPUT_BUNDLE_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_OUTPUT_BUNDLE_ARVALID : out STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_ARREADY : in STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_OUTPUT_BUNDLE_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_OUTPUT_BUNDLE_RLAST : in STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_RVALID : in STD_LOGIC;
    m_axi_OUTPUT_BUNDLE_RREADY : out STD_LOGIC
  );

end arm_sobel_0_1;

architecture stub of arm_sobel_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_AXILiteS_AWADDR[4:0],s_axi_AXILiteS_AWVALID,s_axi_AXILiteS_AWREADY,s_axi_AXILiteS_WDATA[31:0],s_axi_AXILiteS_WSTRB[3:0],s_axi_AXILiteS_WVALID,s_axi_AXILiteS_WREADY,s_axi_AXILiteS_BRESP[1:0],s_axi_AXILiteS_BVALID,s_axi_AXILiteS_BREADY,s_axi_AXILiteS_ARADDR[4:0],s_axi_AXILiteS_ARVALID,s_axi_AXILiteS_ARREADY,s_axi_AXILiteS_RDATA[31:0],s_axi_AXILiteS_RRESP[1:0],s_axi_AXILiteS_RVALID,s_axi_AXILiteS_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_INPUT_BUNDLE_AWADDR[31:0],m_axi_INPUT_BUNDLE_AWLEN[7:0],m_axi_INPUT_BUNDLE_AWSIZE[2:0],m_axi_INPUT_BUNDLE_AWBURST[1:0],m_axi_INPUT_BUNDLE_AWLOCK[1:0],m_axi_INPUT_BUNDLE_AWREGION[3:0],m_axi_INPUT_BUNDLE_AWCACHE[3:0],m_axi_INPUT_BUNDLE_AWPROT[2:0],m_axi_INPUT_BUNDLE_AWQOS[3:0],m_axi_INPUT_BUNDLE_AWVALID,m_axi_INPUT_BUNDLE_AWREADY,m_axi_INPUT_BUNDLE_WDATA[31:0],m_axi_INPUT_BUNDLE_WSTRB[3:0],m_axi_INPUT_BUNDLE_WLAST,m_axi_INPUT_BUNDLE_WVALID,m_axi_INPUT_BUNDLE_WREADY,m_axi_INPUT_BUNDLE_BRESP[1:0],m_axi_INPUT_BUNDLE_BVALID,m_axi_INPUT_BUNDLE_BREADY,m_axi_INPUT_BUNDLE_ARADDR[31:0],m_axi_INPUT_BUNDLE_ARLEN[7:0],m_axi_INPUT_BUNDLE_ARSIZE[2:0],m_axi_INPUT_BUNDLE_ARBURST[1:0],m_axi_INPUT_BUNDLE_ARLOCK[1:0],m_axi_INPUT_BUNDLE_ARREGION[3:0],m_axi_INPUT_BUNDLE_ARCACHE[3:0],m_axi_INPUT_BUNDLE_ARPROT[2:0],m_axi_INPUT_BUNDLE_ARQOS[3:0],m_axi_INPUT_BUNDLE_ARVALID,m_axi_INPUT_BUNDLE_ARREADY,m_axi_INPUT_BUNDLE_RDATA[31:0],m_axi_INPUT_BUNDLE_RRESP[1:0],m_axi_INPUT_BUNDLE_RLAST,m_axi_INPUT_BUNDLE_RVALID,m_axi_INPUT_BUNDLE_RREADY,m_axi_OUTPUT_BUNDLE_AWADDR[31:0],m_axi_OUTPUT_BUNDLE_AWLEN[7:0],m_axi_OUTPUT_BUNDLE_AWSIZE[2:0],m_axi_OUTPUT_BUNDLE_AWBURST[1:0],m_axi_OUTPUT_BUNDLE_AWLOCK[1:0],m_axi_OUTPUT_BUNDLE_AWREGION[3:0],m_axi_OUTPUT_BUNDLE_AWCACHE[3:0],m_axi_OUTPUT_BUNDLE_AWPROT[2:0],m_axi_OUTPUT_BUNDLE_AWQOS[3:0],m_axi_OUTPUT_BUNDLE_AWVALID,m_axi_OUTPUT_BUNDLE_AWREADY,m_axi_OUTPUT_BUNDLE_WDATA[31:0],m_axi_OUTPUT_BUNDLE_WSTRB[3:0],m_axi_OUTPUT_BUNDLE_WLAST,m_axi_OUTPUT_BUNDLE_WVALID,m_axi_OUTPUT_BUNDLE_WREADY,m_axi_OUTPUT_BUNDLE_BRESP[1:0],m_axi_OUTPUT_BUNDLE_BVALID,m_axi_OUTPUT_BUNDLE_BREADY,m_axi_OUTPUT_BUNDLE_ARADDR[31:0],m_axi_OUTPUT_BUNDLE_ARLEN[7:0],m_axi_OUTPUT_BUNDLE_ARSIZE[2:0],m_axi_OUTPUT_BUNDLE_ARBURST[1:0],m_axi_OUTPUT_BUNDLE_ARLOCK[1:0],m_axi_OUTPUT_BUNDLE_ARREGION[3:0],m_axi_OUTPUT_BUNDLE_ARCACHE[3:0],m_axi_OUTPUT_BUNDLE_ARPROT[2:0],m_axi_OUTPUT_BUNDLE_ARQOS[3:0],m_axi_OUTPUT_BUNDLE_ARVALID,m_axi_OUTPUT_BUNDLE_ARREADY,m_axi_OUTPUT_BUNDLE_RDATA[31:0],m_axi_OUTPUT_BUNDLE_RRESP[1:0],m_axi_OUTPUT_BUNDLE_RLAST,m_axi_OUTPUT_BUNDLE_RVALID,m_axi_OUTPUT_BUNDLE_RREADY";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "sobel,Vivado 2016.4";
begin
end;
