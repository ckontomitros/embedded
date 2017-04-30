`timescale 1ns / 100ps
// Description: This FSM converts an input level signal to a single-cycle pulse.
module accelero (
	input                 clk  ,
	input                 rst  ,
	input  wire [   31:0] Nin  ,
	input  wire [   31:0] Nout ,
	input       [31*50:0] x    ,
	output reg  [31*50:0] Y    ,
	output reg            ready
);
	reg       [31 :0] memA     [0:1023]         ;
	reg       [31 :0] memB     [0:1023]         ;
	parameter         S0                = 3'b000;
	parameter         S1                = 3'b001;
	parameter         S2                = 3'b010;
	parameter         S3                = 3'b011;
	parameter         S4                = 3'b100;
	parameter         S5                = 3'b101;
	parameter         a                 = 5     ;
	reg               tickle            = 0     ;
	reg       [  2:0] state             = S0    ;
	reg       [ 31:0] Ninput,Noutput;
	reg       [  2:0] nextstate         = S0    ;
	reg       [ 31:0] i                 = 0,j=0 ;
	// Compute next state of the FSM

	always @(state)
		begin
			case(state)
				S0 :
					if(!rst)
						begin
							nextstate <= S1;

						end
						else
							begin
								ready     <= 0;
								nextstate <= S1;

							end

				S1 :
					begin

						Ninput    <= Nin;
						Noutput   <= Nout;
						nextstate <= S2;
						i         <= 0;
					end
				S2 :
					begin
						if(i<=Nin)
							begin
								memA[i]   <= x[i*32+:32];
								i         <= i+1;
								nextstate <= S5;
							end
						else
							begin
								nextstate = S3;
								i         <= 0;
							end
					end
				S3 :
					begin

						for(i=0;i<Noutput;i=i+1)
							begin
								memB[i] <= a*(memA[i]*memA[i]);

							end

						i         <= 0;
						nextstate <= S4;


					end
				S4 :
					begin
						for (i=0; i<32; i=i+1)
							for (j=0; j<32; j=j+1)
								Y[i*32+:32] <= memB[i];
						nextstate <= S0;
						ready     <= 1;
					end
				S5 :
					begin
						if(i<=Nin)
							begin
								memA[i]   <= x[i*32+:32];
								i         <= i+1;
								nextstate = S2;
							end
						else
							begin
								nextstate = S3;
								i         <= 0;
							end

					end
				default : begin
					ready     <= 0;
					nextstate <= S0;
				end
			endcase
		end

	// Set the new state
	always @(posedge clk, negedge rst)
		begin
			if(rst)
				state <= S0;
			else
				state <= nextstate;
		end
endmodule