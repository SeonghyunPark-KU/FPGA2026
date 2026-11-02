`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2026 04:04:00 PM
// Design Name: 
// Module Name: equiv_simp_sim
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


module equiv_simp_sim;

reg [7:0] A, B;
reg clk;
wire [7:0] sum;

// DUT
equiv_simp dut(
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
