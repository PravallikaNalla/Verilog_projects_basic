`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:29:37 06/07/2020 
// Design Name: 
// Module Name:    Vending_machine_basic 
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
module Vending_machine_basic(
    input [1:0] coin,
    input clk,
    input sync_reset,
	 //output reg [1:0] state,
    output can
    );

	 parameter [1:0] S0 = 2'b00;
	 parameter [1:0] S5 = 2'b01;
	 parameter [1:0] S10 = 2'b10;
	 parameter [1:0] S15 = 2'b11;
	 
	 reg [1:0] state;
	 and A1(can, state[0], state[1]);
	 
	 //seq - FSM
	 always @(posedge clk)
	 begin
		if (sync_reset)
			state <= S0;
		else
		begin
			case(state)
			S0:
			begin
				if (coin == 2'b00)
					state <= S0;
				else if (coin == 2'b01)
					state <= S5;
				else if (coin == 2'b10)
					state <= S10;
				else
					//shouldnt happen
					state <= S15;
			end
			S5:
			begin
				if (coin == 2'b00)
					state <= S5;
				else if (coin == 2'b01)
					state <= S10;
				else if (coin == 2'b10)
					state <= S15;
				else
					//shouldnt happen
					state <= S15;
			end
			S10:
			begin
				if (coin == 2'b00)
					state <= S10;
				else
					state <= S15;
			end
			//S15:
			//	state <= S0;
			default:
				state <= S0;
			endcase
		end
	 end

endmodule
