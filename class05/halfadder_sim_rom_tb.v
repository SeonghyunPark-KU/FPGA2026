`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2026 05:40:09 PM
// Design Name: 
// Module Name: halfadder_sim_rom_tb
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

module halfadder_sim_rom_tb;

    reg clk;
    reg reset;

    halfadder_sim_rom uut (
        .clk(clk),
        .reset(reset)
    );

    // 12 MHz clock
    initial begin
        clk = 1'b0;
        forever #41.6665 clk = ~clk;
    end

    // Reset
    initial begin
        reset = 1'b1;

        #100;
        reset = 1'b0;

        #900;
        $finish;
    end

endmodule