`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2026 08:14:22 PM
// Design Name: 
// Module Name: adder_5port_pipelined
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


module adder_5port_pipelined #(
    parameter DATA_W = 64,
    parameter SUM_W  = DATA_W + 3     // 5 x (2^64 - 1) < 2^67
) (
    input wire clk,
    input wire [DATA_W-1:0] in1,
    input wire [DATA_W-1:0] in2,
    input wire [DATA_W-1:0] in3,
    input wire [DATA_W-1:0] in4,
    input wire [DATA_W-1:0] in5,
    output reg [SUM_W-1:0] sum
);
    // Stage 1: add two at a time, delay in5 by one stage for alignment
    reg [DATA_W:0]   s12, s34;        // 65-bit
    reg [DATA_W-1:0] d5_s1;

    // Stage 2
    reg [DATA_W+1:0] s1234;           // 66-bit
    reg [DATA_W-1:0] d5_s2;

    always @(posedge clk) begin
        // Stage 1
        s12   <= in1 + in2;
        s34   <= in3 + in4;
        d5_s1 <= in5;

        // Stage 2
        s1234 <= s12 + s34;
        d5_s2 <= d5_s1;

        // Stage 3
        sum   <= s1234 + d5_s2;
    end
endmodule
