`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Pravallika Nalla
// 
// Create Date:    23:03:45 06/08/2020 
// Design Name: 
// Module Name:    Sequence_detector 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Sequence_detector(
    input in_stream,
    input clk,
    input sync_reset,
	 output reg [2:0] state,
    output out
    );

	 parameter [2:0] S0   = 3'b000;
	 parameter [2:0] S1   = 3'b001;
	 parameter [2:0] S11  = 3'b010;
	 parameter [2:0] S110 = 3'b011;
	 parameter [2:0] S1101 = 3'b100;
	 
	 //reg [2:0] state;
	 
	 and A1(out, state[2], ~state[1], ~state[0], in_stream);
	 
	 //seq fsm code
	 always @(posedge clk)
	 begin
		if (sync_reset)
			state <= 0;
		else
		begin
			case (state)
				S0:
				begin
					if (in_stream)
						state <= S1;
					else
						state <= S0;
				end
				S1:
				begin
					if (in_stream)
						state <= S11;
					else
						state <= S0;
				end
				S11:
				begin
					if (in_stream)
						state <= S11;
					else
						state <= S110;
				end
				S110:
				begin
					if (in_stream)
						state <= S1101;
					else
						state <= S0;
				end
				S1101:
				begin
					if (in_stream)
						state <= S11;
					else
						state <= S0;
				end
			endcase
		end
	 end

endmodule
