 /*
 -----------------------------------------------------------------------------
 -- File           : Gray_Nbits_RTL.v
 -----------------------------------------------------------------------------
 */ 

module gray_Nbits (clk, clk_en, rst, gray_out);
  parameter N = 4;
  parameter SIZE =(N+1);
  parameter Zeros = {SIZE{1'b0}};
  // Place the definition of wires and regs here
  input clk,clk_en,rst;
  output gray_out;
  reg [N:0] state;
  reg [N:0] toggle;
  // The state of the Gray counter
  always @(posedge clk, negedge rst)
    begin
	     if (rst == 1'b0)
		   state=Zeros; // Initialize state with 1000..00
	     else
		    state<=state^toggle;
	 end
  
  
  // The combinational logic produces the toggle[N:0] signals
  always @(state) 
    begin     
        toggle[0] <=  1'b1;
        toggle[1] <= state[0];	
        for (i=2; i<N; i=i+1) 
	   begin	
            toggle[i]<=state[i-1]&&(~|state[i-2:0])	;   
           end 
	   toggle[N]<=~|state[N-1:0];
    assign gray_out=state[N:1];
	 
endmodule
