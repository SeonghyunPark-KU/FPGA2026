`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2026 04:55:43 PM
// Design Name: 
// Module Name: multiplier_4bit_sim
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


module multiplier_4bit_sim;

reg [3:0] a;
reg [3:0] b;
wire [7:0] p;
 
// DUT
multiplier_4bit dut (
 .a (a),
 .b (b),
 .p (p)
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
