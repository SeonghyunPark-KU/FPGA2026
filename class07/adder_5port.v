`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2026 04:23:18 PM
// Design Name: 
// Module Name: adder_5port
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

module adder_5port #(
    parameter DATA_W = 64,
    parameter SUM_W  = DATA_W + 3     // 5 x (2^64 - 1) < 2^67
) (
    input  wire [DATA_W-1:0] in1,
    input  wire [DATA_W-1:0] in2,
    input  wire [DATA_W-1:0] in3,
    input  wire [DATA_W-1:0] in4,
    input  wire [DATA_W-1:0] in5,
    input wire clk,
    output wire [SUM_W-1:0]  sum
);
    localparam PAD = SUM_W - DATA_W;

    assign sum = {{PAD{1'b0}}, in1}
               + {{PAD{1'b0}}, in2}
               + {{PAD{1'b0}}, in3}
               + {{PAD{1'b0}}, in4}
               + {{PAD{1'b0}}, in5};
endmodule
