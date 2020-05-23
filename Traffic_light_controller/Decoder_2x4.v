`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:38:41 05/21/2020 
// Design Name: 
// Module Name:    Decoder_2x4 
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
module Decoder_2x4(
    input [1:0] In,
    output [3:0] O
    );
	 wire [1:0] In_bar;
	 
	 not N0(In_bar[0], In[0]);
	 not N1(In_bar[1], In[1]);

	 and A0(O[0], In_bar[1], In_bar[0]);
	 and A1(O[1], In_bar[1], In[0]);
	 and A2(O[2], In[1], 		In_bar[0]);
	 and A3(O[3], In[1], 		In[0]);

endmodule
