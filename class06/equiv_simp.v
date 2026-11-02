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


module equiv_simp(
input wire [7:0] A,
input wire [7:0] B,
input clk,
output reg [7:0] sum
);

always @(posedge clk) begin
 sum <= A + B;
end

endmodule