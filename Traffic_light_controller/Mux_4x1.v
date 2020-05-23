`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:28:15 05/21/2020 
// Design Name: 
// Module Name:    Mux_4x1 
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
module Mux_4x1(
    input I0,
    input I1,
    input I2,
    input I3,
    input [1:0] sel,
    output O
    );
	 
	 wire sel0_bar, sel1_bar;
	 //Level-1 AND gate outputs
	 wire [3:0] L1;
	 
	 not N1(sel0_bar, sel[0]);
	 not N2(sel1_bar, sel[1]);
	 
	 //Level-1 AND gates
	 and A1(L1[0],sel1_bar,  sel0_bar, I0);
	 and A2(L1[1],sel1_bar,  sel[0], I1);
	 and A3(L1[2],sel[1],  sel0_bar, I2);
	 and A4(L1[3],sel[1],  sel[0], I3);
	 
	 //Level-2 OR gate
	 or O1(O, L1[3], L1[2], L1[1], L1[0]);

endmodule
