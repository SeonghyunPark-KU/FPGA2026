`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2026 04:42:34 PM
// Design Name: 
// Module Name: Ver_halfadder
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


module Ver_halfadder(
input A, // First input
input B, // Second input
output SUM, // sum output
output CARRY // carry output
);

    assign SUM = A^B; //XOR for begin
    assign CARRY = A&B; //AND for carry
    
endmodule
