`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:45:59 05/21/2020 
// Design Name: 
// Module Name:    TC1_traffic_light_controller 
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
module TC1_traffic_light_controller(
    input clk,
    input sync_reset,
	 //output start_timer, Ored_start,
	 //output tMG,tMY,tSG,tSY,
	 output MR,
    output MG,
    output MY,
	 output SR,
    output SG,
    output SY
    );
	 wire tMG,tMY,tSG,tSY;
	 wire start_timer, Ored_start;
	 wire mux1o, mux2o;
	 
	 wire [3:0] s;
	 wire [1:0] AB;
	 wire [3:0] decoder_out;

	 assign MG = decoder_out[0];
	 assign MY = decoder_out[1];
	 assign SG = decoder_out[2];
	 assign SY = decoder_out[3];
	 or O1(MR, SG, SY);
	 or O2(SR, MG, MY);
	 
	 Mux_4x1 MUX1(.I0(0), .I1(tMY), .I2(1), .I3(~tSY), .sel(AB), .O(mux1o));
	 Mux_4x1 MUX2(.I0(tMG), .I1(~tMY), .I2(tSG), .I3(~tSY), .sel(AB), .O(mux2o));
	 
	 Dff A(.D(mux1o), .clk(clk), .sync_reset(sync_reset), .Q(AB[1]));
	 Dff B(.D(mux2o), .clk(clk), .sync_reset(sync_reset), .Q(AB[0])); 
	 
	 Decoder_2x4 Decode(.In(AB), .O(decoder_out));
	 
	 //calculate start timer
	 and A1(s[0], MG, tMG);
	 and A2(s[1], MY, tMY);
	 and A3(s[2], SG, tSG);
	 and A4(s[3], SY, tSY);
	 or O3(start_timer, s[0], s[1], s[2], s[3]);
	 or O4(Ored_start, start_timer, sync_reset);
	 TC1_traffic_timer TIMER(.start(Ored_start), .clk(clk), .tMG(tMG), .tMY(tMY), .tSG(tSG), .tSY(tSY));


endmodule
