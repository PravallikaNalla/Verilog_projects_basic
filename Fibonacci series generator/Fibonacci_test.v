`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:58:40 06/19/2020
// Design Name:   Fibonacci_series
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/RTL_projects/Fibonacci_test.v
// Project Name:  RTL_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fibonacci_series
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Fibonacci_test;

	// Inputs
	reg restart;
	reg clk;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	Fibonacci_series uut (
		.restart(restart), 
		.clk(clk), 
		.out(out)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		restart = 1;
		$monitor("restart:%b  out:%d",restart, out);
		// Wait 100 ns for global reset to finish
		#100;
		restart = 0;
        
		// Add stimulus here
		#200;
		restart = 1;
		#20;
		restart = 0;
		#200;
		$finish;
		

	end
      
endmodule

