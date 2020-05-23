`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:42:07 05/21/2020 
// Design Name: 
// Module Name:    TC1_traffic_timer 
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
module TC1_traffic_timer(
    input start,
    input clk,
    output tMG,
    output tMY,
    output tSG,
    output tSY
    );

	 wire [3:0] i;
	 Binary_up_down_counter #(4) Timer(.sync_reset(start), .load(0), .count(1), .up_down(0), .clk(clk), .N(0), .O(i));

	 //tMG=1 when i = 15
	 //tMY=1 when i = 1
	 //tSG=1 when i = 4
	 //tSY=1 when i = 1
	 and A1(tMG, i[3], i[2], i[1], i[0]);
	 and A2(tMY, ~i[3], ~i[2], ~i[1], i[0]);
	 and A3(tSG, ~i[3], i[2], ~i[1], ~i[0]);
	 and A4(tSY, ~i[3], ~i[2], ~i[1], i[0]);
	 /*
	 always @(i)
	 begin
		case(i)
			4'd1: begin
						tMG = 0;
						tMY = 1;
						tSG = 0;
						tSY = 1;
					end
			4'd4: begin
						tMG = 0;
						tMY = 0;
						tSG = 1;
						tSY = 0;
					end
			4'd15: begin
						tMG = 1;
						tMY = 0;
						tSG = 0;
						tSY = 0;
					end
			default: begin
							tMG = 0;
							tMY = 0;
							tSG = 0;
							tSY = 0;
						end
		endcase
	 end
	 */

endmodule
