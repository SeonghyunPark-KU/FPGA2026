`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2026 05:17:23 PM
// Design Name: 
// Module Name: equiv_hard_sim
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


module equiv_hard_sim;

reg [7:0] A, B;
reg clk;
wire [7:0] sum;

// DUT
equiv_hard dut(
 .A (A),
 .B (B),
 .clk (clk),
 .sum (sum)
 );
 
initial begin
 clk = 0;
 forever #5 clk = ~clk;
end

initial begin
  A = 7'd0;  B = 7'd0;  
  #110;
  A = 7'd5;  B = 7'd3;  
  #10;
  A = 7'd17;  B = 7'd11;  
  #10;
  A = 7'd41;  B = 7'd85;  
  #10;
 
$finish;
end

endmodule
