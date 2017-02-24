 /*                                -
 -----------------------------------------------------------------------------
 -----------------------------------------------------------------------------
 -- File           : TB1_Gray.v
 -----------------------------------------------------------------------------
 -- Description    : Verilog testbench for Gray_4bits
 -- --------------------------------------------------------------------------
 -- --------------------------------------------------------------------------
 */
 
`timescale 1ns / 1ps
`define cycle 10

module TB3;
  parameter N = 4;
  reg clk, rst, clk_en;
  wire [3:0] leds;
  integer EndOfSimulation;  
  integer i;

  parameter ONE = 1'b1; 
               
  // Initial statement for signal initialization (reset, clk, EndOfSimulation)
               
  // Initial statement for signal initialization (reset, clk, EndOfSimulation)
   initial 
     begin
      clk=1'b0;
      rst=1'b1;
      #(4.25*`cycle) rst = 1'b0;
      for (i = 0; i < 15; i=i +1) 
      begin
        $display("na to %b",leds);
        #(`cycle*1000000);
      end

      
     end
   
  // Always statement to drive the clock goes here
  always 
     #(`cycle / 2) clk=~clk;
   

   // Instantiation of system

  GrayCounter_System SYS(clk, rst, leds); 
  
endmodule
