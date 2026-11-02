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


module equiv_hard(
input wire [7:0] A,
input wire [7:0] B,
input clk,
output wire [7:0] sum
);

wire [7:0] sum_comb;

// Combinational adder
assign sum_comb = A + B;
genvar i;
generate
for (i = 0; i < 8; i = i + 1) begin : gen_fdce
FDRE fdce_inst (
.Q (sum[i]), // flip-flop output
.C (clk), // clock
.CE (1'b1), // clock enable
.R (1'b0), // async clear
.D (sum_comb[i]) // combinational adder
);
end
endgenerate

endmodule
