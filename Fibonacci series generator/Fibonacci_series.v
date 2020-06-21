`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:03 06/19/2020 
// Design Name: 
// Module Name:    Fibonacc_series 
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
module Fibonacci_series(
    input restart,
    input clk,
    output [7:0] out
    );

	 wire [7:0] Fn;
	 reg [7:0] Fn_1, Fn_2;
	 //F(n) = F(n-1) + F(n-2)
	 assign out = Fn_2;
	 assign Fn = Fn_1 + Fn_2;
	 
	 always @(posedge clk)
	 begin
		if (restart)
		begin
			Fn_1 <= 1;
			Fn_2 <= 1;
		end
		else
		begin
			Fn_2 <= Fn_1;
			Fn_1 <= Fn;
		end
	 end
	 
endmodule
