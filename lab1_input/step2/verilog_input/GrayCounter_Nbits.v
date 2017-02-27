 /*
 -----------------------------------------------------------------------------
 -- File           : Gray_Nbits_RTL.v
 -----------------------------------------------------------------------------
 */ 

module gray_Nbits (clk, clk_en, rst, gray_out);
  parameter N = 4;
  integer i;
  reg [N-1:0] counter;
  // Place the definition of wires and regs here
  output [N-1:0] gray_out;
  input clk,rst,clk_en;
  // The state of the Gray counter
  always @(posedge clk, negedge rst)
    begin
	     if (rst == 1'b1)begin
		    // Initialize state with 1000..00
        counter=0;
      
        end
	     else
		    // Main part of code
        counter<={1'b0,counter[N-1:1]}^gray_out[N-1:0];
        counter<=counter+1'b1;
	 end
  
  
  // The combinational logic produces the toggle[N:0] signals
  assign gray_out={1'b0,counter[N-1:1]}^counter[N-1:0];
endmodule
