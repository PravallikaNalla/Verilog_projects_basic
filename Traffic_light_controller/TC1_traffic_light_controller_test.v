`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:17:48 05/22/2020
// Design Name:   TC1_traffic_light_controller
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/test/TC1_traffic_light_controller_test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TC1_traffic_light_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TC1_traffic_light_controller_test;

	// Inputs
	reg clk;
	reg sync_reset;

	// Outputs
	//wire start_timer, Ored_start,tMG,tMY,tSG,tSY;
	wire MR;
	wire MG;
	wire MY;
	wire SR;
	wire SG;
	wire SY;

	// Instantiate the Unit Under Test (UUT)
	TC1_traffic_light_controller uut (
		.clk(clk), 
		.sync_reset(sync_reset),
		//.start_timer(start_timer), .Ored_start(Ored_start), .tMG(tMG), .tMY(tMY), .tSG(tSG), .tSY(tSY),
		.MR(MR), 
		.MG(MG), 
		.MY(MY), 
		.SR(SR), 
		.SG(SG), 
		.SY(SY)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		sync_reset = 1;
		$monitor("time: %d, reset:%b. RGY- M: %b %b %b| S: %b %b %b",$time, sync_reset, MR,MG,MY, SR,SG,SY);
		//$monitor("time: %d, reset:%b. RGY- M: %b %b %b| S: %b %b %b| \t start_timer:%b,Ored:%b tMG tMY: %b %b| tSG tSY: %b %b",$time, sync_reset, MR,MG,MY, SR,SG,SY, start_timer, Ored_start, tMG, tMY, tSG, tSY);
		// Wait 100 ns for global reset to finish
		#40;
		sync_reset = 0;

		// Add stimulus here
		#840;
		sync_reset = 1;
		#20
		sync_reset = 0;
		#300;
		$finish;

	end
      
endmodule

