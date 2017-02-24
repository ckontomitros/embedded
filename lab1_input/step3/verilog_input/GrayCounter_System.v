`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name:    GrayCounter_System 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Instantiation of the GrayCounter_Nbits and GrayCounter_Pulse models
//
//////////////////////////////////////////////////////////////////////////////////
module GrayCounter_System(clk,rst,leds);
  parameter N = 4;
  parameter distance =1000000; // How much for 1 Hz when clk period is 10 ns?
  input clk, rst;
  output [N-1:0] leds;
  wire pulse;
    
  // Instantiation of the GrayCounter_Pulse 
  // Here
  GrayCounter_Pulse PULSE(clk, rst,pulse);
  gray_Nbits DUT(.clk(clk), .clk_en(pulse), .rst(rst), .gray_out(leds));  
	 
  // Instantiation of the gray_Nbits 
  // Here


endmodule
