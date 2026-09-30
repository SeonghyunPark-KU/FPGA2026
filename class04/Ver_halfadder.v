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
 input clk_in, // input clock
 output reg sum, // sum output
 output reg carry // carry output
);

// Clock buffering
wire clk_ibuf;
wire clk;

IBUFG u_ibufg(
 .I (clk_in),
 .O (clk_ibuf)
);
BUFG u_bufg(
 .I (clk_ibufg),
 .O (clk)
);

// Input FF
 reg A_ff;
 reg B_ff; 
// Output FF
 wire sum_ff;
 wire carry_ff;

always @(posedge clk) begin
  A_ff <= A;
  B_ff <= B;
end
  
assign sum_ff = A_ff^B_ff;  
assign carry_ff = A_ff&B_ff;

always @(posedge clk) begin
  sum <= sum_ff;
  carry <= carry_ff;
end    

ila_0 u_ila(
  .clk (clk),
  .probe0 (sum),
  .probe1 (carry)
);

vio_0 u_vio(
  .clk (clk),
  .probe_in0 (A),
  .probe_in1 (B)
);
    
endmodule
