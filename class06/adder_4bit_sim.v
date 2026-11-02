`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2026 04:32:03 PM
// Design Name: 
// Module Name: adder_4bit_sim
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

module adder_4bit_sim;

reg [3:0] a, b;
wire [3:0] s;
wire c;

integer i, j;
integer error_cnt;
reg [4:0] expected;

// DUT
adder_4bit dut (
  .a (a),
  .b (b),
  .s (s),
  .c (c)
);

initial begin
  a = 4'd0;  b = 4'd0;
  #10; 
  a = 4'd3;  b = 4'd5;  
  #10;  
  a = 4'd9;  b = 4'd6;  
  #10;  
  a = 4'd15; b = 4'd1;  
  #10;  
  a = 4'd12; b = 4'd10; 
  #10; 
 
$finish;
end
    
endmodule
