 /*
 -----------------------------------------------------------------------------
 -- File           : Gray_Nbits_RTL.v
 -----------------------------------------------------------------------------
 */ 

module gray_Nbits (clk, clk_en, rst, gray_out);
  parameter N = 4;
  parameter SIZE =(N+1);
  parameter Zeros = {SIZE{1'b0}};
  reg [N:0] i;
  // Place the definition of wires and regs here
  reg [N:0] state,toggle;
  input clk,clk_en,rst;
  output[N:1] gray_out;

  // The state of the Gray counter
  always @(posedge clk, negedge rst)
    begin
	     if (rst == 1'b0)
	     begin
		    state=Zeros;
		    toggle={N{1'b0},1};
		end
	     else
		    state<=state^toggle;
	 end
  
  
  // The combinational logic produces the toggle[N:0] signals
  always @(state) 
    begin     
        toggle[0] <=  1'b1;
        toggle[1] <= state[0];	
        /*for (i=2; i<N; i=i+1) 
	     begin	
            toggle[i]<=toggle[i-1]&&(~|toggle[i-2:0]);   
         end */
        toggle[N]<=(~|toggle[N-1:0]);
	  end
    assign gray_out=state[N:1];
	 
endmodule
