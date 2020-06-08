`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:20:50 06/07/2020
// Design Name:   Vending_machine_basic
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/RTL_projects/Vending_machine_basic_test.v
// Project Name:  RTL_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Vending_machine_basic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Vending_machine_basic_test;

	// Inputs
	reg [1:0] coin;
	reg clk;
	reg sync_reset;

	// Outputs
	wire can;
	//wire [1:0] state;

	// Instantiate the Unit Under Test (UUT)
	Vending_machine_basic uut (
		.coin(coin), 
		.clk(clk), 
		.sync_reset(sync_reset), 
		//.state(state),
		.can(can)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end

	initial begin
		//$monitor("time:%d--res:%b, coin:%d, can:%b, state:%d", $time, sync_reset, coin, can, state);
		$monitor("time:%d--res:%b, coin:%d, can:%b", $time, sync_reset, coin, can);
		// Initialize Inputs
		coin = 0;
		sync_reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
      sync_reset = 0;
		#20;
		coin = 0;
		#20;
		coin = 1;
		#20;
		coin = 2;
		#20;
		coin = 0;
		#20;
		sync_reset = 1;
		#20;
		sync_reset = 0;
		#20;
		coin = 2;
		#20;
		coin = 3;
		#20;

		coin = 0;
		#20;
		sync_reset = 1;
		#20;
		sync_reset = 0;
		#20;
		coin = 2;
		#20;
		coin = 3;
		#20;
		coin = 2;
		#20;
		coin = 0;
		#20;
		coin = 1;
		#100;
		$finish;

	end
      
endmodule

