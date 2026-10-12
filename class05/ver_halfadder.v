`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2026 03:55:49 PM
// Design Name: 
// Module Name: ver_halfadder
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
 input reset, //reset
 output reg sum, // sum output
 output reg carry // carry output
);

// Clock buffering
//wire clk_ibufg;
//wire clk;

//IBUFG u_ibufg(
 //.I (clk_in),
 //.O (clk_ibufg)
//);
//BUFG u_bufg(
// .I (clk_ibufg),
// .O (clk)
//);

// Input FF
 reg A_ff;
 reg B_ff; 
// Output FF
 wire sum_ff;
 wire carry_ff;

always @(posedge clk_in) begin
  if (reset) begin
    A_ff <= 1'b0;
    B_ff <= 1'b0;
  end
  else begin
    A_ff <= A;
    B_ff <= B;
  end
end
  
assign sum_ff = A_ff^B_ff;  
assign carry_ff = A_ff&B_ff;

always @(posedge clk_in) begin
  if (reset) begin
    sum <= 1'b0;
    carry <= 1'b0;
  end
  else begin
    sum <= sum_ff;
    carry <= carry_ff;
  end
end

endmodule
