`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2026 04:00:37 PM
// Design Name: 
// Module Name: halfadder_sim
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


module halfadder_sim;
    reg A;
    reg B;
    reg clk;
    reg reset;

    wire sum;
    wire carry;

    Ver_halfadder uut (
        .A(A),
        .B(B),
        .clk_in(clk),
        .reset(reset),
        .sum(sum),
        .carry(carry)
    );

    // 12 MHz clock
    initial begin
        clk = 0;
        forever #41.6665 clk = ~clk;
    end

    initial begin

        A = 0;
        B = 0;
        reset = 1;

        #100;
        
        reset = 0;
        
        #100;

        A = 0;
        B = 1;

        #100;

        A = 1;
        B = 0;

        #100;

        A = 1;
        B = 1;

        #100;

        $finish;
    end

    // Monitor
    always @(posedge clk) begin
        $display(
            "time=%0t | A=%b B=%b | A_ff=%b B_ff=%b | sum=%b carry=%b",
            $time, A, B,
            uut.A_ff, uut.B_ff,
            sum, carry
        );
    end

endmodule
