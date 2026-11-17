`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2026 06:02:31 PM
// Design Name: 
// Module Name: adder_4port_25_sim
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

module adder_5port_sim(
    input wire clk 
);

//MMCM
 wire clk25;
 wire locked;

clk_wiz_0 u_mmcm (
 .clk_in1  (clk),
 .clk_out1 (clk25),
 .locked   (locked)
);

    // ---------------- Address counter ----------------
    reg [7:0] addr = 8'd0;

    always @(posedge clk25) begin
        if (locked)
            addr <= addr + 8'd1;     // 0~255 반복
    end

    // ---------------- BRAM 1~5 (256 x 64) ----------------
    wire [63:0] d1, d2, d3, d4, d5;

    bram_1 u_bram1 (.clka(clk25), .addra(addr), .douta(d1));
    bram_2 u_bram2 (.clka(clk25), .addra(addr), .douta(d2));
    bram_3 u_bram3 (.clka(clk25), .addra(addr), .douta(d3));
    bram_4 u_bram4 (.clka(clk25), .addra(addr), .douta(d4));
    bram_5 u_bram5 (.clka(clk25), .addra(addr), .douta(d5));

    // ---------------- 5-port adder (64-bit x 5 -> 67-bit) ----------------
    wire [66:0] sum;

    adder_5port_pipelined #(.DATA_W(64)) u_adder (
        .clk (clk25),
        .in1 (d1),
        .in2 (d2),
        .in3 (d3),
        .in4 (d4),
        .in5 (d5),
        .sum (sum)
    );

    // ---------------- ILA (8-bit) ----------------
    ila_0 u_ila (
        .clk    (clk25),
        .probe0 (sum[7:0])
    );

endmodule