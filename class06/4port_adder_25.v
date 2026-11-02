`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2026 03:53:53 PM
// Design Name: 
// Module Name: equiv_hard
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module adder_4port_25(
input  wire [7:0] in1,
input  wire [7:0] in2,
input  wire [7:0] in3,
input  wire [7:0] in4,
output wire [9:0] sum
);

assign sum = {2'b00, in1} + {2'b00, in2} + {2'b00, in3} + {2'b00, in4};

endmodule