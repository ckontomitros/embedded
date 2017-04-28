`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2017 05:21:14 PM
// Design Name: 
// Module Name: Tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define cycle 10   // this is equivalent to defines in C
module Tb;
parameter Ninput=40;
parameter Noutput=40;
reg clk, rst, clk_en;
integer i;
reg [31*50:0] x  ;
//reg [31:0] y [Noutput:0];
wire [31*50:0]y; 
always 
    begin
      # (`cycle/2) clk = ~clk;
    end
initial
    begin
        rst = 1'b1;	  
        clk = 1'b0 ;
        for(i=0;i<Ninput;i=i+1)
            begin
                x[i*32+:32]=i;
            end
        # (2*`cycle);
        rst=1'b0;
        # (70*`cycle);
    end
    accelero multiplayer (.clk(clk),.rst(rst),.Nin(Ninput),.Nout(Noutput),.x(x),.Y(y));
endmodule
