`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:06:36 05/21/2020
// Design Name:   TC1_traffic_timer
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/test/TC1_traffic_timer_test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TC1_traffic_timer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TC1_traffic_timer_test;

	// Inputs
	reg start;
	reg clk;

	// Outputs
	wire tMG;
	wire tMY;
	wire tSG;
	wire tSY;

	// Instantiate the Unit Under Test (UUT)
	TC1_traffic_timer uut (
		.start(start), 
		.clk(clk), 
		.tMG(tMG), 
		.tMY(tMY), 
		.tSG(tSG), 
		.tSY(tSY)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end
	
	initial begin
		// Initialize Inputs
		start = 1;
		$monitor("time %d..start: %b....MG %b| MY:%b| SG %b| SY %b",$time, start, tMG, tMY,tSG,tSY);
		
		// Wait 100 ns for global reset to finish
		#100;
		start = 0;

		// Add stimulus here
		#120; start = 1;
		#20; start = 0;
		#340; start = 1;
		$finish;
		

	end
      
endmodule

