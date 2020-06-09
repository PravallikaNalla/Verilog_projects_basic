`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Pravallika Nalla
// 
// Create Date:    07:29:03 06/09/2020 
// Design Name: 
// Module Name:    Sequence_detector_Mealy 
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
module Sequence_detector_Mealy(
    input in_stream,
    input clk,
    input sync_reset,
	 output reg [1:0] state,
    output reg out
    );

	 parameter [1:0] S0   = 2'b00;
	 parameter [1:0] S1   = 2'b01;
	 parameter [1:0] S11  = 2'b10;
	 parameter [1:0] S110 = 2'b11;
	 
	 //reg [1:0] state;
	 
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
					if (in_stream) begin
						state <= S1;
						out <= 0;
					end
					else begin
						state <= S0;
						out <= 0;
					end
				end
				S1:
				begin
					if (in_stream) begin
						state <= S11;
						out <= 0;
					end
					else begin
						state <= S0;
						out <= 0;
					end
				end
				S11:
				begin
					if (in_stream) begin
						state <= S11;
						out <= 0;
					end
					else begin
						state <= S110;
						out <= 0;
					end
				end
				S110:
				begin
					if (in_stream) begin
						state <= S1;
						out <= 1;
					end
					else begin
						state <= S0;
						out <= 0;
					end
				end
				//all cases covered. no need for default case
			endcase
		end
	 end


endmodule
