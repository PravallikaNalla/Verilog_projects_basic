`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Pravallika Nalla
//
// Create Date:   23:19:04 06/08/2020
// Design Name:   Sequence_detector
// Module Name:   C:/Users/pravnall/Documents/xilinx projects/RTL_projects/Sequence_detector_test.v
// Project Name:  RTL_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sequence_detector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sequence_detector_test;

	// Inputs
	reg in_stream;
	reg clk;
	reg sync_reset;

	// Outputs
	wire [2:0] state;
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Sequence_detector uut (
		.in_stream(in_stream), 
		.clk(clk), 
		.sync_reset(sync_reset),
		.state(state),
		.out(out)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end

	initial begin
		$monitor("time %d, in %b, out %b, state: %d", $time, in_stream, out, state);
		// Initialize Inputs
		in_stream = 0;
		sync_reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		sync_reset = 0;
		#20;
		in_stream = 1;
		#20;
		in_stream = 0;
		#20;
		in_stream = 0;
		#20;
		in_stream = 1;
		#20;
		in_stream = 1;
		#20;
		in_stream = 1;
		#20;
		in_stream = 0;
		#20;
		in_stream = 1;
		#20;
		in_stream = 1;
		#20;
		in_stream = 0;
		#20;
		in_stream = 1;
		#20;
		in_stream = 0;
		#20;
		in_stream = 0;
		#20;
		in_stream = 1;
		
		$finish;

	end
      
endmodule

